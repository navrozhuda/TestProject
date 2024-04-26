//
//  ItemsViewProtocol.swift
//  TestProject
//
//  Created by Navroz Huda on 26/04/24.
//

import Foundation


protocol ItemsViewProtocol: AnyObject {
    var viewModel: ItemsViewModelProtocol { get }
    func reloadTableView()
}
