//
//  ItemsViewModel.swift
//  TestProject
//
//  Created by Navroz Huda on 26/04/24.
//

import Foundation

//https://jsonplaceholder.typicode.com/posts?_start=0&_limit=10

class ItemsViewModel: ItemsViewModelProtocol {
    weak var delegate: ItemsViewModelDelegate?
    private var items: [Item] = []
    private var startPage = 0
    private let pageSize = 10
    private var isLoading = false
    
    func fetchItems() {
        guard !isLoading else { return }
        isLoading = true
        
        // Call your pagination API
   
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts?_start=\(startPage)&_limit=\(pageSize)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            defer { self.isLoading = false }
            if let error = error {
                self.delegate?.fetchItemsDidFail(with: error)
                return
            }
            guard let data = data else {
                let error = NSError(domain: "NoData", code: -1, userInfo: nil)
                self.delegate?.fetchItemsDidFail(with: error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let newItems = try decoder.decode([Item].self, from: data)
                let transformedItems = self.performComputations(with: newItems)
                self.items.append(contentsOf: newItems)
                self.startPage += newItems.count
                self.delegate?.didFetchItems(newItems)
            } catch {
                self.delegate?.fetchItemsDidFail(with: error)
            }
        }.resume()
    }
    
    private func performComputations(with items: [Item]) -> [ComputedItem] {
        // Perform computations on items and return computed items
        var transformedItems: [ComputedItem] = []
        for item in items {
        
            let transformedItem = computeTransformation(for: item)
            transformedItems.append(transformedItem)
        }
        return transformedItems
    }
    
    private func computeTransformation(for item: Item) -> ComputedItem {
        
        let titleLength = item.title.count
        return ComputedItem(id: item.id, titleLength: titleLength)
    }
}
