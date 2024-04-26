//
//  ItemDetailViewController.swift
//  TestProject
//
//  Created by Navroz Huda on 26/04/24.
//

import UIKit

class ItemDetailViewController: UIViewController {

    var item: Item?
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var lblbody: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = item {
            lbltitle.text = item.title
            lblbody.text = item.body
        }
    }
    

}
