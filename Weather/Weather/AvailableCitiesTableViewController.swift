//
//  AvailableCitiesTableViewController.swift
//  Weather
//
//  Created by Екатерина Алексеева on 25.11.2022.
//

import UIKit

class AvailableCitiesTableViewController: UITableViewController {
    
    // MARK: - Private Properties
    
    private var availableCities = ["Kamchatka"]//[String]()
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
    
    // Отрабатываем нажатие кнопки Add city
    @objc func toAddableCities(_ sender: UIBarButtonItem) -> Void {
        guard sender.title == "Add city" else { return }
        let addCityViewController = AddableCitiesViewController()
        navigationItem.backButtonTitle = "My cities"
        self.navigationController?.pushViewController(addCityViewController, animated: true)
    }
    
    func addCity(city: String) {
        if !availableCities.contains(city) {
            availableCities.append(city)
        }
        tableView.reloadData()
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
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            availableCities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weatherVC = WeatherCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationItem.backButtonTitle = "To cities"
        print("Go to weather for \(availableCities[indexPath.row])")
        navigationController?.pushViewController(weatherVC, animated: true)
    }
}
