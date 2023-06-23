//
//  AuthLoginVCViewController.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 06/06/23.
//

import UIKit
import SSSpinnerButton

class AuthLoginVC: BaseViewController {
    
    @IBOutlet weak var segmentUserType: UISegmentedControl!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var btnLogin: SSSpinnerButton!
    
    
    //MARK: Properties
    internal var coordinator: AuthenticationCoordinator?
    fileprivate let viewModel = LoginViewModel()
    
    //MARK: LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavBar()
        bindUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }
    
    
    deinit {
        coordinator = nil
    }
}

//MARK: Extension for Actions
extension AuthLoginVC {
    
    @IBAction func onLoginTouched(_sender: UIButton) {
        let loginRequestModel: LoginRequestModal
        if segmentUserType.selectedSegmentIndex == 0  {
            loginRequestModel = LoginRequestModal(email: txtFieldEmail.text?.trimmed() ?? "", password: txtFieldPassword.text?.trimmed() ?? "",userType: "business")
        } else {
            loginRequestModel = LoginRequestModal(email: txtFieldEmail.text?.trimmed() ?? "", password: txtFieldPassword.text?.trimmed() ?? "",userType: "individual")
        }
        viewModel.loginValidation(loginRequestModal: loginRequestModel)
    }
    
    @IBAction func onAppleBtnClick(_ sender: Any) {
        
    }
}

//MARK: Extension For Function
extension AuthLoginVC {
    
    private func initialSetup() {
        txtFieldEmail.addBorderAndColor(color: R.color.txtFieldBorderColor() ?? UIColor.white, width: 1, corner_radius: 4)
        txtFieldPassword.addBorderAndColor(color: R.color.txtFieldBorderColor() ?? UIColor.white, width: 1, corner_radius: 4)
        txtFieldPassword.setupRightImage(imageName: R.image.hide.name)
        txtFieldEmail.delegate = self
        txtFieldPassword.delegate = self
        
        setUpSegmentControll()
    }
    
    private func bindUI() {
        
        viewModel.validationComplete.bind { [weak self] in
            guard let uSelf = self else { return }
            uSelf.btnLogin.startAnimate(spinnerType: .ballRotateChase, spinnercolor: R.color.deepAqua() ?? .green ,complete: nil)
        }
        
        viewModel.loginSuccess.bind { [weak self] in
            guard let uSelf = self else { return }
            uSelf.btnLogin.stopAnimationSuccess(completion: nil)
            AlertHelper.showSuccessMsg(message: R.string.localizable.success())
            uSelf.coordinator?.gotoHomeVC()
        }
        
        viewModel.apiError.bind{ [weak self] (message: String) in
            guard let uSelf = self else { return }
            uSelf.btnLogin.stopAnimationFailure(completion: nil)
            AlertHelper.showErrorMsg(message: message)
        }
    }
    
    private func setUpSegmentControll() {
        segmentUserType.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : R.font.poppinsSemiBold(size: 14) ?? setSemiBoldSystemFont(size: 14)], for: .selected)
        segmentUserType.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: R.color.txtFieldBorderColor() ?? .white, NSAttributedString.Key.font: R.font.poppinsSemiBold(size: 14) ?? setSemiBoldSystemFont(size: 14)], for: .normal)
        segmentUserType.setTitle(R.string.localizable.businessTitle(), forSegmentAt: AccountType.business.rawValue)
        segmentUserType.selectedSegmentIndex = AccountType.personal.rawValue
        
        segmentUserType.layer.borderWidth = 2
        segmentUserType.layer.borderColor = R.color.deepAqua()?.cgColor
    }
    
    private func configureNavBar() {
        setNavigationBarHidden(isHidden: false)
        setStatusBarColor(color: R.color.deepAqua() ?? .white)
        setNavigationBarColor(color: R.color.deepAqua() ?? .white)
        setLeftNavButtons((R.image.back(), CGRect(x: 0, y: 0, width: 20, height: 20), #selector(exitVC)))
        setAttributedNavTitle(title: R.string.localizable.loginTitle(), font: R.font.poppinsMedium(size: 16) ?? setMediumSystemFont(size: 16), color: .white)
        let appearence = UINavigationBarAppearance()
        appearence.backgroundColor = R.color.deepAqua()
        navigationItem.standardAppearance = appearence
    }
}

// MARK: - TextField Delegates
extension AuthLoginVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case txtFieldEmail:
            txtFieldPassword.becomeFirstResponder()
        case txtFieldPassword:
            txtFieldPassword.resignFirstResponder()
        default:
            break
        }
        return true
    }
}
