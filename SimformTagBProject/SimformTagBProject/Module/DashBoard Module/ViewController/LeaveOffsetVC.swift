//
//  LeaveOffsetVC.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 09/06/23.
//

import UIKit

class LeaveOffsetVC: BaseViewController {
    
    //MARK: Outlets
    @IBOutlet private weak var tableView: BaseTableView!
    
    //MARK: Variable Declaration
    fileprivate let viewModel = LeaveOffsetViewModel()
    var leaveOffsetData: [InstituteUserLeaveRequestList] = []
    var coordinator: LeaveCoordinator?
    
    
    //MARK: Actions
    @IBAction func backClick(_ sender: Any) {
        exitVc()
    }
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: InitialSetUpCall
        initialSetup()
        viewModel.fatchLeaveOffsetData()
        //viewModel.fatchLeaveDataThroughURLSession()
        bindUI()
        
    }
    
    @objc func exitVc() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: Extension for Function
extension LeaveOffsetVC {
    
    func initialSetup() {
        tableView.dataSource = self
        title = R.string.localizable.leaveOffsetTitle()
        
        //Change statusBar color
        //StatusBar.changeStatusBarColor(color: R.color.deepAqua() ?? .white)
        
        navigationBarItemSpacing()
        navigationAppearance()
    }
    
    func bindUI() {
        viewModel.apiSuccess.bind { [weak self] in
            guard let uSelf = self else { return }
            uSelf.leaveOffsetData = uSelf.viewModel.leaveOffsetData.value
            if uSelf.leaveOffsetData.count == 0 {
                uSelf.tableView.lodingState = .empty
                uSelf.tableView.shouldShowPlaceholder(true)
            } else {
                uSelf.tableView.lodingState = .success
                uSelf.tableView.shouldShowPlaceholder(false)
            }
            DispatchQueue.main.async {
                uSelf.tableView.reloadData()
            }
        }
    }
    
    private func navigationBarItemSpacing() {
        
        navigationController?.navigationItem.rightBarButtonItem?.imageInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: -10)
    }
    
    func navigationAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = R.color.deepAqua()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }
}

//MARK: Extension UITableViewDataSource
extension LeaveOffsetVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaveOffsetData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.leaveOffsetCell.identifier, for: indexPath) as? LeaveOffsetTableCell else {
            return UITableViewCell()
        }
        
        cell.configure(data: leaveOffsetData[indexPath.row])
        
        
        switch(cell.status.text) {
        case "approved":
            cell.status.textColor = R.color.coolGreen()
        case "cancelled":
            cell.status.textColor = R.color.darkishPink()
        case "pending":
            cell.status.textColor = R.color.reddidh()
        default:
            cell.status.text = "-"
        }
        return cell
    }
}
