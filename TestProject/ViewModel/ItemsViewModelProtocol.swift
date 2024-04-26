//
//  ItemsViewModelProtocol.swift
//  TestProject
//
//  Created by Navroz Huda on 26/04/24.
//

import Foundation

protocol ItemsViewModelProtocol: AnyObject {
    var delegate: ItemsViewModelDelegate? { get set }
    func fetchItems()
}
