//
//  ViewController.swift
//  MVVM-Example
//
//  Created by madilyn on 2022/05/05.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var summaryLabel: UILabel!
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        updateUI()
        viewModel.reload()
    }
    
    @IBAction func tapUser1(_ sender: Any) {
        viewModel.selectUser(userID: 1)
        updateUI()
    }
    
    @IBAction func tapUser2(_ sender: Any) {
        viewModel.selectUser(userID: 2)
        updateUI()
    }
    
    private func updateSummaryLabel() {
        summaryLabel.text = "총 할 일: \(viewModel.currentToDoModel.count)개"
    }
    
    private func updateUI() {
        viewModel.onUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.updateSummaryLabel()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.currentToDoModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.setData(data: viewModel.currentToDoModel[indexPath.row])
        return cell
    }
}
