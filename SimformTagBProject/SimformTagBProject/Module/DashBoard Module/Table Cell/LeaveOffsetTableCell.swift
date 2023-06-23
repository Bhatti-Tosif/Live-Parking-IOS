//
//  LeaveOffsetTableCell.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 09/06/23.
//

import UIKit

class LeaveOffsetTableCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet private weak var requestDate: UILabel!
    @IBOutlet private weak var startDate: UILabel!
    @IBOutlet private weak var endDate: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet private weak var actiontaken: UILabel!
    @IBOutlet private weak var reason: UILabel!
    
    //MARK: Configure Cell
    func configure(data: InstituteUserLeaveRequestList) {
        requestDate.text = Date.namedDateTime(dateString: data.actionTakenDate ?? R.string.localizable.noDate())
        startDate.text = Date.namedDateTime(dateString: data.leaveStartDate ?? R.string.localizable.noDate())
        endDate.text = Date.namedDateTime(dateString: data.leaveEndDate ?? R.string.localizable.noDate())
        status.text = data.status
        actiontaken.text = Date.namedDateTime(dateString: data.actionTakenDate ?? R.string.localizable.noDate())
        reason.text = data.leaveReason
    }
    
}
