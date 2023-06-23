//
//  SignUpVC.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 07/06/23.
//

import UIKit

class SignUpVC: BaseViewController {
    
    //MARK: -Outlets
    @IBOutlet private weak var segmentForUsertype: UISegmentedControl!
    @IBOutlet private weak var txtFirstName: UITextField!
    @IBOutlet private weak var txtLastName: UITextField!
    @IBOutlet private weak var txtEmailID: UITextField!
    @IBOutlet private weak var txtMobileNumber: UITextField!
    @IBOutlet private weak var txtPassword: UITextField!
    @IBOutlet private weak var btnSignUp: BaseButton!
    
    //MARK: -Properties
    fileprivate let viewModel = SignUpViewModel()
    var userModel: UserInfo?
    var coordinator: AuthenticationCoordinator?
    
    //MARK: -LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: InitialSetUpCall
        initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureNavBar()
        bindingUI()
    }
    
}

//MARK: Extension for Initial Setup
extension SignUpVC {
    
    func initialSetup() {
        setUpTextField()
        setUpSegmentControll()
    }
    
    private func setUpTextField() {
        txtFirstName.addBorderAndColor(color: R.color.txtFieldBorderColor() ?? .white, width: 1, corner_radius: 4)
        txtLastName.addBorderAndColor(color: R.color.txtFieldBorderColor() ?? .white, width: 1, corner_radius: 4)
        txtMobileNumber.addBorderAndColor(color: R.color.txtFieldBorderColor() ?? .white, width: 1, corner_radius: 4)
        txtEmailID.addBorderAndColor(color: R.color.txtFieldBorderColor() ?? UIColor.white, width: 1, corner_radius: 4)
        txtPassword.addBorderAndColor(color: R.color.txtFieldBorderColor() ?? UIColor.white, width: 1, corner_radius: 4)
        txtPassword.setupRightImage(imageName: R.image.hide.name)
        txtFirstName.delegate = self
        txtLastName.delegate = self
        txtEmailID.delegate = self
        txtMobileNumber.delegate = self
        txtPassword.delegate = self
    }
    
    private func setUpSegmentControll() {
        segmentForUsertype.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : R.font.poppinsSemiBold(size: 14) ?? setSemiBoldSystemFont(size: 14)], for: .selected)
        segmentForUsertype.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: R.color.txtFieldBorderColor() ?? .white, NSAttributedString.Key.font: R.font.poppinsSemiBold(size: 14) ?? setSemiBoldSystemFont(size: 14)], for: .normal)
        segmentForUsertype.setTitle(R.string.localizable.businessTitle(), forSegmentAt: AccountType.business.rawValue)
        segmentForUsertype.selectedSegmentIndex = AccountType.personal.rawValue
        
        segmentForUsertype.layer.borderWidth = 2
        segmentForUsertype.layer.borderColor = R.color.deepAqua()?.cgColor
    }
    
    private func bindingUI() {
        
        viewModel.buttonStartAnimation.bind { [weak self] in
            guard let uSelf = self else { return }
            uSelf.btnSignUp.startAnimate(spinnerType: .ballRotateChase, spinnercolor: R.color.deepAqua() ?? .green ,complete: nil)
            
        }
        
        viewModel.signUpSuccess.bind { [weak self] in
            guard let uSelf = self else { return }
            AlertHelper.showSuccessMsg(message: R.string.localizable.success())
            uSelf.btnSignUp.stopAnimationSuccess(completion: nil)
            uSelf.userModel = uSelf.viewModel.userInfo
            uSelf.fillData()
            uSelf.coordinator?.gotoLoginVC()
        }
        
        viewModel.apiError.bind { [weak self] (message: String) in
            guard let uSelf = self else { return }
            AlertHelper.showErrorMsg(message: message)
            uSelf.btnSignUp.stopAnimationFailure(completion: nil)
        }
        
    }
    
    private func fillData() {
        txtEmailID.text = userModel?.email
        txtFirstName.text = userModel?.firstName
        txtLastName.text = userModel?.lastName
        txtPassword.text = userModel?.userType
    }
    
    private func configureNavBar() {
        setNavigationBarHidden(isHidden: false)
        setStatusBarColor(color: R.color.deepAqua() ?? .white)
        setNavigationBarColor(color: R.color.deepAqua() ?? .white)
        setLeftNavButtons((R.image.back(), CGRect(x: 0, y: 0, width: 20, height: 20), #selector(exitVC)))
        setAttributedNavTitle(title: R.string.localizable.signUpTitle(), font: R.font.poppinsMedium(size: 16) ?? setMediumSystemFont(), color: .white)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = R.color.deepAqua()
        navigationItem.standardAppearance = appearance
    }
}

//MARK: Extension for Actions
extension SignUpVC {
    
    @IBAction func signupClicked(_ sender: Any) {
        let signupRequestModal = SignupRequestModel(firstName: txtFirstName.text ?? "", lastName: txtLastName.text ?? "", email: txtEmailID.text ?? "", mobileNumber: txtMobileNumber.text ?? "", password: txtPassword.text ?? "")
        viewModel.signUpValidaton(signupRequestModel: signupRequestModal)
        
    }
}

//MARK: Extension for TextField Delegate
extension SignUpVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case txtFirstName:
            txtLastName.becomeFirstResponder()
        case txtLastName:
            txtEmailID.becomeFirstResponder()
        case txtEmailID:
            txtMobileNumber.becomeFirstResponder()
        case txtMobileNumber:
            txtPassword.becomeFirstResponder()
        default:
            break
        }
        return true
    }
}
