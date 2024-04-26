//
//  ViewController.swift
//  TestProject
//
//  Created by Navroz Huda on 26/04/24.
//

import UIKit

class ViewController: UIViewController, ItemsViewProtocol , UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var viewModel: ItemsViewModelProtocol = ItemsViewModel()
    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
        tableView.register(UINib(nibName: ItemTableViewCell.cell, bundle: nil), forCellReuseIdentifier: ItemTableViewCell.cell)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        
        viewModel.fetchItems()
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    // UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.cell, for: indexPath) as! ItemTableViewCell
        
        // Configure the cell
        let item = items[indexPath.row]
        cell.configure(with:item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let itemDetailsVC = storyboard.instantiateViewController(withIdentifier: "ItemDetailViewController") as! ItemDetailViewController
        itemDetailsVC.item = items[indexPath.row]
        self.present(itemDetailsVC, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == items.count - 1 {
            viewModel.fetchItems()
        }
    }
}
// MARK: - ItemsViewModelDelegate

extension ViewController: ItemsViewModelDelegate {
    
    func didFetchItems(_ items: [Item]) {
        self.items.append(contentsOf: items)
        reloadTableView()
    }
    
    func fetchItemsDidFail(with error: Error) {
        print("Error fetching items: \(error.localizedDescription)")
        // Handle error
    }
}

