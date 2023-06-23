//
//  BaseViewController.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 06/06/23.
//

import UIKit

class BaseViewController: UIViewController {

    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}

//MARK: Extension Other Methods.
extension BaseViewController {
    
    func setNavigationBarHidden(isHidden:Bool = false) {
        let navigationController = getNavigationController()
        navigationController.setNavigationBarHidden(isHidden, animated: false)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    /// setNavigationBarTitle
    /// - Parameter title: sets navigation bar titles
    func setNavigationBarTitle(title: String, titleTextColor: UIColor = .white) {
        let navigationController = self.getNavigationController()
        let navigationItem = self.getNavigationItem()
        navigationItem.title = title
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleTextColor, NSAttributedString.Key.font: R.font.poppinsRegular]
    }
}

extension BaseViewController: UINavigationControllerDelegate {
    
    func getNavigationController() -> UINavigationController {
        if let navigationController = self.navigationController {
            navigationController.interactivePopGestureRecognizer?.isEnabled = true
            return navigationController
        }
        return self.navigationController ?? UINavigationController()
    }
    
    func getNavigationItem() -> UINavigationItem {
        navigationItem
    }
    
    /// set standerd appearence of navigation bar
    func setNavbarStanderdColor(color: UIColor) {
        let appearence = UINavigationBarAppearance()
        appearence.backgroundColor = color
        navigationController?.navigationBar.standardAppearance = appearence
    }
    
    /// set Attributed Navigation Title
    func setAttributedNavTitle(title: String, font: UIFont, color: UIColor) {
        let lblTitle = UILabel()
        lblTitle.font = font
        lblTitle.text = title
        lblTitle.textColor = color
        navigationItem.titleView = lblTitle
    }
    
    /// set NavigationBar Color
    func setNavigationBarColor(color: UIColor) {
        navigationController?.navigationBar.backgroundColor = color
    }
    
    /// Set Left Nav Buttons
    func setLeftNavButtons(_ items: (UIImage?, CGRect, Selector)... ) {
        var navItems: [UIBarButtonItem] = []
        items.forEach{ item in
            let navBtn: UIButton = UIButton(type: .custom)
            navBtn.setImage(item.0, for: .normal)
            navBtn.addTarget(self, action: item.2, for: .touchUpInside)
            navBtn.frame = item.1
            navItems.append(UIBarButtonItem(customView: navBtn))
        }
        
        navigationItem.setLeftBarButtonItems(navItems, animated: false)
    }
    
    /// Set Right Nav Buttons
    func setRightNavButtons(_ items: (UIImage?, CGRect, Selector)... ) {
        var navItems: [UIBarButtonItem] = []
        items.forEach{ item in
            let navBtn: UIButton = UIButton(type: .custom)
            navBtn.setImage(item.0, for: .normal)
            navBtn.addTarget(self, action: item.2, for: .touchUpInside)
            navBtn.frame = item.1
            navBtn.tintColor = UIColor.white
            navItems.append(UIBarButtonItem(customView: navBtn))
        }
        
        navigationItem.setRightBarButtonItems(navItems, animated: true)
    }

    /// Set Left Nav Item
    func setLeftNavItem(_ item: UIView ) {
        navigationItem.setLeftBarButton(UIBarButtonItem(customView: item), animated: true)
    }
    
    /// Set Right Nav Item
    func setRightNavItem(_ item: UIView ) {
        navigationItem.setRightBarButton(UIBarButtonItem(customView: item), animated: true)
        
    }
    
    /// set Navigation Title
    func setNavTitle(title: String) {
        navigationItem.title = title
    }
    
    @objc func exitVC() {
        let navigationController = self.getNavigationController()
        navigationController.popViewController(animated: true)
    }
    
    func dismissViewController() {
        self.dismiss(animated: true, completion: nil)
    }
}
