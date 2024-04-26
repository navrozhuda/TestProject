//
//  ItemTableViewCell.swift
//  TestProject
//
//  Created by Navroz Huda on 26/04/24.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    static let cell = "ItemTableViewCell"
    @IBOutlet weak var lblid: UILabel!
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var lblbody: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        self.selectionStyle = .none
    }

    func configure(with item: Item) {
        lblid.text = "\(item.id)"
        lbltitle.text = item.title
        lblbody.text = item.body
    }
    
}
