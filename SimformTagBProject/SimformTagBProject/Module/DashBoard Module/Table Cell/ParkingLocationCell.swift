//
//  ParkingLocationCell.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 08/06/23.
//

import UIKit

class ParkingLocationDataTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet private weak var carImage: UIImageView!
    @IBOutlet private weak var parkingCode: UILabel!
    @IBOutlet private weak var parkingName: UILabel!
    @IBOutlet private weak var parkingAddress: UILabel!
    @IBOutlet private weak var selectedArrow: UIImageView!
    @IBOutlet private weak var OutercellView: UIView!
    
    //MARK: LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            OutercellView.backgroundColor = R.color.iceBlueTwo()
            selectedArrow.isHidden = false
        } else {
            OutercellView.backgroundColor = R.color.whiteThree()
            selectedArrow.isHidden = true
        }
        
        OutercellView.layer.borderWidth = selected ? 1 : 0
        OutercellView.layer.borderColor = selected ? R.color.deepAqua()?.cgColor : R.color.whiteThree()?.cgColor
        
    }
    
    //MARK: Configure Cell
    func configure(data: ParkingDetailModelData) {
        carImage.load(url: URL(string: data.parkingLot?.parkingImageInfo?.image ?? "") ?? URL(fileURLWithPath: data.parkingLot?.parkingImageInfo?.image ?? ""))
        parkingCode.text = String(data.uniqueId)
        parkingName.text = data.parkingLot?.name
        parkingAddress.text = "\(data.parkingLot?.address?.addressLine1 ?? "") \(data.parkingLot?.address?.state ?? "") \(data.parkingLot?.address?.country ?? "") \(data.parkingLot?.address?.zipcode ?? "")"
        selectedArrow.image = R.image.iconMenuCopy()
    }
    
}
