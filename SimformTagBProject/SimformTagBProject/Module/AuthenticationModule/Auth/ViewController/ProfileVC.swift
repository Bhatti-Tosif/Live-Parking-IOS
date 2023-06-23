//
//  ProfileVC.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 08/06/23.
//

import UIKit

class ProfileVC: BaseViewController {
    
    //MARK: -Outlets
    @IBOutlet private weak var txtFirstName: UITextField!
    @IBOutlet private weak var txtLastName: UITextField!
    @IBOutlet private weak var txtEmailId: UITextField!
    @IBOutlet private weak var txtMobileNumber: UITextField!
    @IBOutlet private weak var txtCountry: UITextField!
    @IBOutlet private weak var txtAddress: UITextField!
    @IBOutlet private weak var txtBussinessName: UITextField!
    @IBOutlet private weak var txtBussinessType: UITextField!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var btnUpdateProfile: BaseButton!
    
    //MARK: Variable Declaration
    fileprivate let viewModel = ProfileViewModel()
    var userInfo:UserInfo?
    var coordinator: EditProfileCoordinator?
    
    //MARK: -LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: InitialSetUpCall
        initialSetUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setStatusBarColor(color: R.color.deepAqua() ?? .white)
    }
    
    deinit {
        coordinator = nil
    }
    
}

//MARK: Extension for Function
extension ProfileVC {
    
    private func initialSetUp() {
        configureNavigationBar()
        textFieldSet()
        viewModel.fatchProfileData()
        bindUI()
    }

    private func bindUI() {
        
        viewModel.apiSuccess.bind { [weak self] in
            guard let uSelf = self else { return }
            AlertHelper.showSuccessMsg(message: R.string.localizable.success())
            uSelf.userInfo = uSelf.viewModel.userInfo
            uSelf.setData()
        }
        viewModel.apiError.bind { [weak self] (message: String) in
            guard self != nil else { return }
            AlertHelper.showErrorMsg(message: message)
        }
    }
    
    private func textFieldSet() {
        txtFirstName.addBorderAndColor(color: R.color.txtFieldBorderColor() ?? .white, width: 1, corner_radius: 4)
        txtLastName.addBorderAndColor(color: R.color.txtFieldBorderColor() ?? .white, width: 1, corner_radius: 4)
        txtEmailId.addBorderAndColor(color: R.color.txtFieldBorderColor() ?? .white, width: 1, corner_radius: 4)
        txtMobileNumber.addBorderAndColor(color: R.color.txtFieldBorderColor() ?? .white, width: 1, corner_radius: 4)
        txtAddress.addBorderAndColor(color: R.color.txtFieldBorderColor() ?? .white, width: 1, corner_radius: 4)
        txtCountry.addBorderAndColor(color: R.color.txtFieldBorderColor() ?? .white, width: 1, corner_radius: 4)
        txtBussinessName.addBorderAndColor(color: R.color.txtFieldBorderColor() ?? .white, width: 1, corner_radius: 4)
        txtBussinessType.addBorderAndColor(color: R.color.txtFieldBorderColor() ?? .white, width: 1, corner_radius: 4)
    }
    
    func setData() {
        guard let userInfo = userInfo else { return }
        txtFirstName.text = userInfo.firstName
        txtLastName.text = userInfo.lastName
        txtEmailId.text = userInfo.email
        txtMobileNumber.text = userInfo.phoneNumber
        txtAddress.text = userInfo.address?.addressLine1
        txtCountry.text = userInfo.address?.country
        txtBussinessName.text = userInfo.businessName
        txtBussinessType.text = userInfo.userType
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.barStyle = .black
        setNavbarStanderdColor(color: R.color.deepAqua() ?? .green)
        setNavigationBarColor(color: R.color.deepAqua() ?? .green)
        setAttributedNavTitle(title: R.string.localizable.promocode(), font: R.font.poppinsMedium(size: 16) ?? setMediumSystemFont(size: 16), color: .white)
        let button = UIButton()
        button.addTarget(self, action: #selector(onClickLogout), for: .touchUpInside)
        button.setAttributedTitle(NSAttributedString(string: R.string.localizable.logout(), attributes: [NSAttributedString.Key.font : R.font.poppinsMedium(size: 16) ?? setMediumSystemFont(size: 16), NSAttributedString.Key.foregroundColor : UIColor.white]), for: .normal)
        setRightNavItem(button)
        let editButton = UIButton()
        editButton.addTarget(self, action: #selector(onClickEditProfile), for: .touchUpInside)
        editButton.setAttributedTitle(NSAttributedString(string: R.string.localizable.editProfile(), attributes: [NSAttributedString.Key.font : R.font.poppinsMedium(size: 16) ?? setMediumSystemFont(size: 16), NSAttributedString.Key.foregroundColor : UIColor.white]), for: .normal)
        setLeftNavItem(editButton)
    }
    
    @objc func onClickLogout() {
        userManager.isUserLogin = false
        userManager.userName = ""
        coordinator?.logout()
    }
    
    @objc func onClickEditProfile() {
        
    }
    
    @IBAction func btnUpdateProfileClicked(_ sender: UIButton) {
        let editProfileModel = EditProfileRequestModel(firstName: txtFirstName.text ?? "", lastName: txtLastName.text ?? "", mobileNumber: txtMobileNumber.text ?? "")
        viewModel.updateProfile(editProfileModel: editProfileModel)
        btnUpdateProfile.startAnimate(complete: nil)
        
        viewModel.apiSuccess.bind { [weak self] in
            guard let uSelf = self else { return }
            AlertHelper.showSuccessMsg(message: R.string.localizable.success())
            uSelf.btnUpdateProfile.stopAnimationSuccess(completion: nil)
        }
        
        viewModel.apiError.bind { [weak self] (message: String) in
            guard let uSelf = self else { return }
            AlertHelper.showErrorMsg(message: message)
            uSelf.btnUpdateProfile.stopAnimationFailure(completion: nil)
        }
    }
}
