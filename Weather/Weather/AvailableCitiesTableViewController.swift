//
//  AvailableCitiesTableViewController.swift
//  Weather
//
//  Created by Екатерина Алексеева on 25.11.2022.
//

import UIKit

class AvailableCitiesTableViewController: UITableViewController {
    
    // MARK: - Private Properties
    
    private var availableCities = ["Moscow", "Samara", "Ulyanovsk", "Kazan"]
    private let reuseIdentifier = "cities"

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add city",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(toAddableCities))
    }
    
    // MARK: - Action
    
    // Отрабатываем нажатиеткнопки Add city
    @objc func toAddableCities(_ sender: UIBarButtonItem) -> Void {
        guard sender.title == "Add city" else { return }
        let addCityViewController = AddableCitiesViewController()
        self.navigationController?.pushViewController(addCityViewController, animated: true)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availableCities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = availableCities[indexPath.row]
        return cell
    }
}
