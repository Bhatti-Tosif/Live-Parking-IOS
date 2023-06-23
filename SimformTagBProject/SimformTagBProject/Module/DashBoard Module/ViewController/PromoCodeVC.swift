//
//  PromoCodeVC.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 09/06/23.
//

import UIKit

class PromoCodeVC: BaseViewController {
    
    //MARK: IBOUTLETS
    @IBOutlet private weak var tblPromoCode: BaseTableView!
    @IBOutlet weak var txtSearch: UITextField!
    
    //MARK: LOCAL VARIABLES
    var selectedItems: [Int] = []
    private var viewModel = PromoCodeViewModel()
    private var promoCodeData: [PromoCodeResponseModel] = []
    var coordinator: PromocodeCoordinator?
    
    //MARK: LIFECYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        viewModel.fatchPromoCode()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureNavigationItems()
        setupStatusBarBackgroundColor(self, R.color.deepAqua.name)
    }
}

//MARK: UITableViewDataSource
extension PromoCodeVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return promoCodeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let promocode = tblPromoCode.dequeueReusableCell(withIdentifier: R.reuseIdentifier.promocodeTableCell.identifier, for: indexPath) as? PromoCodeTableViewCell else { return UITableViewCell() }
        promocode.configCell(data: promoCodeData[indexPath.row])
        return promocode
    }
}

//MARK: EXTENSION
extension PromoCodeVC {
    
    func initialSetup() {
        tblPromoCode.dataSource = self
        bindViewModel()
    }
    private func configureNavigationItems() {
        navigationController?.navigationBar.barStyle = .black
        setNavbarStanderdColor(color: R.color.deepAqua() ?? .green)
        setNavigationBarColor(color: R.color.deepAqua() ?? .green)
        setAttributedNavTitle(title: R.string.localizable.promocode(), font: R.font.poppinsMedium(size: 16) ?? setMediumSystemFont(size: 16), color: .white)
    }
    
    //MARK: INTERNAL FUNCTIONS
    @objc private func onTap() {
        navigationController?.popViewController(animated: true)
    }
    
    fileprivate func bindViewModel() {
        viewModel.apiSuccess.bind { [weak self] in
            guard let uSelf = self else { return }
            uSelf.promoCodeData = uSelf.viewModel.promoCodeData.value
            if uSelf.promoCodeData.count == 0 {
                uSelf.tblPromoCode.lodingState = .empty
                uSelf.tblPromoCode.shouldShowPlaceholder(true)
            } else {
                uSelf.tblPromoCode.lodingState = .success
                uSelf.tblPromoCode.shouldShowPlaceholder(false)
            }
            uSelf.tblPromoCode.reloadData()
        }
    }
    
}
