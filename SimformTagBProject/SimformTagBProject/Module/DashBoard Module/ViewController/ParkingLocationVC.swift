//
//  ParkingLocationVC.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 08/06/23.
//

import UIKit

class ParkingLocationVC: BaseViewController {

    //MARK: Outlets
    @IBOutlet private weak var tableView: BaseTableView!
    @IBOutlet private weak var buttonView: UIView!
    @IBOutlet weak var btnApply: BaseButton!
    
    //MARK: Variable Declaration
    var selectedItem = 0
    var selectedItemId: Int?
    fileprivate let viewModel = ParkingLocationViewModel()
    var parkingLotData = [ParkingDetailModelData]()
    var coordinator: ParkingCoordinator?
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bindUI()
    }
    
    //MARK: Actions
    @IBAction func btn_Back(_ sender: Any) {
        exitVc()
    }
    
    @IBAction func btnApplyClicked(_ sender: Any) {
        let deleteRequestModel = DeleteParkingLocationRequestModel(parkingLotId: selectedItemId)
        btnApply.startAnimate(spinnerType: .ballRotateChase, spinnercolor: .white, complete: nil)
        viewModel.deleteParkingLocation(deleteParkingLocationRequestModel: deleteRequestModel)
    }
    
    @objc func exitVc() {
        navigationController?.popViewController(animated: true)
    }

}

//MARK: Extension for UITableViewDataSource
extension ParkingLocationVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ParkingLocationDataTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(data: parkingLotData[indexPath.row])
        
        //MARK: Allow Multiple selection
        self.tableView.allowsMultipleSelection = true
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parkingLotData.count
    }
}

//MARK: Extension for UITableViewDelegate
extension ParkingLocationVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //MARK: Give backgroubnd color..
        selectedItem += 1
        selectedItemId = parkingLotData[indexPath.row].parkingLot?.id
        buttonView.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selectedItem -= 1
        if(selectedItem == 0) {
            buttonView.isHidden = true
        }
    }

}

//MARK: Extension for Function
extension ParkingLocationVC {
    
    func initialSetUp() {
        tableView.dataSource = self
        tableView.delegate = self
        navigationApperance()
        setData()
    }
    
    func setData() {
        viewModel.fatchparkingDataFromAPI()
    }
    
    func bindUI() {
        
        viewModel.apiSuccess.bind { [weak self] in
            guard let uSelf = self else { return }
            
            uSelf.parkingLotData = uSelf.viewModel.parkingData.value
            
            DispatchQueue.main.async {
                if uSelf.parkingLotData.count == 0 {
                    uSelf.tableView.lodingState = .empty
                    uSelf.tableView.shouldShowPlaceholder(true)
                } else {
                    uSelf.tableView.lodingState = .success
                    uSelf.tableView.shouldShowPlaceholder(false)
                }
                uSelf.tableView.reloadData()
            }
        }
        
        viewModel.deleteSuccess.bind { [weak self] in
            guard let uSelf = self else { return }
            uSelf.btnApply.stopAnimationSuccess(completion:  {
                DispatchQueue.main.async {
                    uSelf.fatchParkingData()
                }
            })
            
        }
        
        viewModel.apiError.bind { [weak self] (message: String) in
            guard let uSelf = self else { return }
            uSelf.tableView.lodingState = .failure
        }
        
        viewModel.deleteFail.bind { [weak self] in
            guard let uSelf = self else { return }
            uSelf.btnApply.stopAnimationFailure(completion: nil)
        }
    }
    
    func fatchParkingData() {
        tableView.lodingState = .loading
        selectedItem = 0
        viewModel.fatchparkingDataFromAPI()
    }
    
    func navigationApperance() {
        let apperance = UINavigationBarAppearance()
        apperance.backgroundColor = R.color.deepAqua()
        navigationItem.title = "Parking Location"
        apperance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = apperance
        navigationItem.scrollEdgeAppearance = apperance
        navigationController?.navigationBar.tintColor = .white
        setStatusBarColor(color: R.color.deepAqua() ?? .white)
    }
}
