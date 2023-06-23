//
//  TextFieldExtension.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 06/06/23.
//

import Foundation
import UIKit

var isIconeClicked = false
var btnPassword = UIButton()

extension UITextField {
    
    //MARK:- Set Image on left of text fields
    func setupLeftImage(imageName:String){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.image = UIImage(named: imageName)
        let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
        imageContainerView.addSubview(imageView)
        leftView = imageContainerView
        leftViewMode = .always
        self.tintColor = .lightGray
    }
    
    //MARK:- Set Image on the right of text fields
    func setupRightImage(imageName: String){
        btnPassword = UIButton(frame: CGRect(x: 8, y: 8, width: 24, height: 24))
        btnPassword.setImage(UIImage(named: imageName), for: .normal)
        btnPassword.addTarget(self, action: #selector(toggleShowPassword), for: .touchUpInside)
        let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageContainerView.addSubview(btnPassword)
        rightView = imageContainerView
        rightViewMode = .always
        self.tintColor = .lightGray
    }
    
    @objc func toggleShowPassword() {
        if (isIconeClicked) {
            btnPassword.setImage(R.image.hide(), for: .normal)
            self.isSecureTextEntry = true
        } else {
            btnPassword.setImage(R.image.show(), for: .normal)
            self.isSecureTextEntry = false

        }
        isIconeClicked = !isIconeClicked
    }
}
