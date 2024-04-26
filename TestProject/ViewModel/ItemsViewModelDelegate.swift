//
//  ItemsViewModelDelegate.swift
//  TestProject
//
//  Created by Navroz Huda on 26/04/24.
//

import Foundation

protocol ItemsViewModelDelegate: AnyObject {
    func didFetchItems(_ items: [Item])
    func fetchItemsDidFail(with: Error)
}
