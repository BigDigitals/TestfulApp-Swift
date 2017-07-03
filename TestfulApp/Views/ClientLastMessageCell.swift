//
//  ClientLastMessageCell.swift
//  TestfulApp
//
//  Created by Evgeniy Tkachenko on 03.07.17.
//  Copyright © 2017 Big Dig. All rights reserved.
//

import UIKit

class ClientLastMessageCell: UITableViewCell {
    
    @IBOutlet weak var imPhoto: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbMessage: UILabel!
    @IBOutlet weak var lbNumberUnreadMessages: UILabel!
    
    // MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
