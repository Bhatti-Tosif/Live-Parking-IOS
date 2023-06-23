//
//  CommonFunction.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 09/06/23.
//

import Foundation
import UIKit


//MARK: - Set System Fonts
func setRegularSystemFont(size: CGFloat = 14) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: .regular)
}
func setMediumSystemFont(size: CGFloat = 14) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: .medium)
}

func setSemiBoldSystemFont(size: CGFloat = 14) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: .semibold)
}

func setBoldSystemFont(size: CGFloat = 14) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: .bold)
}

/// change status bar color
func setStatusBarColor(color: UIColor){
    if #available(iOS 13, *) {
        let keyWindow = UIApplication.shared.connectedScenes.filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
        guard let keyWindow else { return }
        guard let frame = keyWindow.windowScene?.statusBarManager?.statusBarFrame else { return }
        let statusBar = UIView(frame: frame)
        statusBar.backgroundColor = color
        keyWindow.addSubview(statusBar)
    } else {
        guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
        statusBar.backgroundColor = color
    }
}

func setupStatusBarBackgroundColor(_ thisself: UIViewController,_ statusBarColor: String) {
    let statusBarTagNumber = 1
    if #available(iOS 13.0, *) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let statusBarManager = windowScene.statusBarManager
        else {
            return
        }
        
        let statusBarHeight = statusBarManager.statusBarFrame.height
        
        for subview in thisself.view.subviews {
            if subview.tag == statusBarTagNumber {
                subview.backgroundColor = .white
                return
            }
        }
        
        let statusbarView = UIView()
        statusbarView.tag = statusBarTagNumber
        statusbarView.backgroundColor = UIColor(named: statusBarColor)
        thisself.view.addSubview(statusbarView)
        
        statusbarView.translatesAutoresizingMaskIntoConstraints = false
        statusbarView.heightAnchor
            .constraint(equalToConstant: statusBarHeight).isActive = true
        statusbarView.widthAnchor
            .constraint(equalTo: thisself.view.widthAnchor, multiplier: 1.0).isActive = true
        statusbarView.topAnchor
            .constraint(equalTo: thisself.view.topAnchor).isActive = true
        statusbarView.centerXAnchor
            .constraint(equalTo: thisself.view.centerXAnchor).isActive = true
        
    } else {
        let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
        statusBar?.backgroundColor = UIColor(named:statusBarColor)
    }
}

//MARK: -Get Application Window
var getApplicationWindow: UIWindow? {
    if let delegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate, let window = delegate.window {
        return window
    }
    return nil
}
