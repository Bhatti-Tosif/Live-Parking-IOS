//
//  PromoCodeCell.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 09/06/23.
//

import UIKit

class PromoCodeTableViewCell: UITableViewCell {
    
    //MARK: IBOUTLETS
    @IBOutlet private weak var promoCodeName: UILabel!
    @IBOutlet private weak var expiryDate: UILabel!
    @IBOutlet private weak var discount: UILabel!
    @IBOutlet private weak var status: UILabel!
    @IBOutlet private weak var usage: UILabel!
    
    //MARK: LIFECYCLES
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//MARK: EXTENSIONS
extension PromoCodeTableViewCell {
    func configCell(data: PromoCodeResponseModel) {
        promoCodeName.text = data.getFullName()
        expiryDate.text = data.expiryDate
        status.text = data.active ? R.string.localizable.txtActive() : R.string.localizable.txtInActive()
        if status.text == R.string.localizable.txtActive() {
            status.textColor = R.color.lightBlueGreyTwo()
        }
        discount.text = data.discountValue
        usage.text = String(data.usageLimit)
    }
}
