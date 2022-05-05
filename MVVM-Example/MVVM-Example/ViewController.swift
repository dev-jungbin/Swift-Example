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
    
    var toDoData = ToDoModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        fetchData()
    }
    
    private func fetchData() {
        let url = "https://jsonplaceholder.typicode.com/todos"
        
        URLSession.shared.dataTask(with: URL(string: url)!) { [weak self] data, _, _ in
            guard let data = data else { return }
            guard let model = try? JSONDecoder().decode(ToDoModel.self, from: data) else { return }
            
            self?.toDoData = model
            
            DispatchQueue.main.async {
                self?.updateToDoTableView()
                self?.updateSummaryLabel()
            }
        }.resume()
    }
    
    private func updateToDoTableView() {
        tableView.reloadData()
    }
    
    private func updateSummaryLabel() {
        summaryLabel.text = "총 할 일: \(toDoData.count)개"
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.setData(data: toDoData[indexPath.row])
        return cell
    }
}
