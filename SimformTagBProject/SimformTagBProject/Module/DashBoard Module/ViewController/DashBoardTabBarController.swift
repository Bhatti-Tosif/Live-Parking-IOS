//
//  DashBoardTabBarController.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 10/06/23.
//

import UIKit

class DashBoardTabBarController: UITabBarController {

    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTabBarView()
    }

}

//MARK: Extension for function
extension DashBoardTabBarController {
    
    private func setUpTabBarView() {
        tabBar.clipsToBounds = true
        let appearance = UITabBarAppearance()
        appearance.stackedLayoutAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0)
        appearance.backgroundImage = R.image.tabBarBackground()
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        tabBar.tintColor = R.color.deepAqua()
        tabBar.unselectedItemTintColor = .gray
        setUpTabBarViewControllers()
    }
    
    private func setUpTabBarViewControllers() {
        
        guard let promocodeVC = R.storyboard.dashBoard.promoCodeVC(), let parkingLocationVC = R.storyboard.dashBoard.parkingLocationVC(), let leaveOffsetVC = R.storyboard.dashBoard.leaveOffsetVC(), let editProfileVC = R.storyboard.dashBoard.profileVC() else { return }
        
        var viewControllerList: [UINavigationController] = []
        
        let tabBarItemPromocode = UITabBarItem(title: R.string.localizable.promocode(), image: R.image.home(), selectedImage: R.image.home())
        promocodeVC.tabBarItem = tabBarItemPromocode
        let promocodeNavigationController = UINavigationController(rootViewController: promocodeVC)
        let promocodeCoordinator = PromocodeCoordinator(navigationController: promocodeNavigationController)
        promocodeVC.coordinator = promocodeCoordinator
        viewControllerList.append(promocodeNavigationController)
        
        let tabBarItemParking = UITabBarItem(title: R.string.localizable.parking(), image: R.image.reportIcone(), selectedImage: R.image.reportIcone())
        tabBarItemParking.standardAppearance?.selectionIndicatorTintColor = R.color.deepAqua()
        parkingLocationVC.tabBarItem = tabBarItemParking
        let parkingNavigationController = UINavigationController(rootViewController: parkingLocationVC)
        let parkingCoordinator = ParkingCoordinator(navigationController: parkingNavigationController)
        parkingLocationVC.coordinator = parkingCoordinator
        viewControllerList.append(parkingNavigationController)
        
        if userManager.userAccountType == R.string.localizable.personal() {
            let tabBarItemLeave = UITabBarItem(title: R.string.localizable.leave(), image: R.image.verify(), selectedImage: R.image.verify())
            leaveOffsetVC.tabBarItem = tabBarItemLeave
            let leaveNavigationController = UINavigationController(rootViewController: leaveOffsetVC)
            let leaveCoordinator = LeaveCoordinator(navigationController: leaveNavigationController)
            leaveOffsetVC.coordinator = leaveCoordinator
            viewControllerList.append(leaveNavigationController)
        }
        
        let tabBarItemProfile = UITabBarItem(title: R.string.localizable.profile(), image: R.image.editProfile(), selectedImage: R.image.editProfile())
        editProfileVC.tabBarItem = tabBarItemProfile
        let editProfileNavigationController = UINavigationController(rootViewController: editProfileVC)
        let editProfileCooordinator = EditProfileCoordinator(navigationController: editProfileNavigationController)
        editProfileVC.coordinator = editProfileCooordinator
        viewControllerList.append(editProfileNavigationController)
        
        viewControllers = viewControllerList
        title = tabBarItemPromocode.title
        
    }
}
