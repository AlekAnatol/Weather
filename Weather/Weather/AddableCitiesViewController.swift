//
//  AddableCitiesViewController.swift
//  Weather
//
//  Created by Екатерина Алексеева on 25.11.2022.
//

import UIKit

class AddableCitiesViewController: UIViewController {
    
    // MARK: - Visual Components
    
    var citiesToAddTableView = UITableView()
    
    // MARK: - Private Properties
    
    private var citiesToAdd = ["Mahachkala", "Lima"]
    private let reuseIdentifier = "cities"
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTableView()
    }
    
    // MARK: - Private Methods
    
    private func createTableView() -> Void {
        citiesToAddTableView = UITableView(frame: self.view.bounds, style: .plain)
        citiesToAddTableView.backgroundColor = .green
        citiesToAddTableView.register(UITableViewCell.self, forCellReuseIdentifier:reuseIdentifier)
        citiesToAddTableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        citiesToAddTableView.dataSource = self
        citiesToAddTableView.delegate = self
        view.addSubview(citiesToAddTableView)
    }
}

// MARK: - extension UITableViewDataSource

extension AddableCitiesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesToAdd.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = citiesToAddTableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = citiesToAdd[indexPath.row]
        return cell
    }
}

// MARK: - extension UITableViewDelegate

extension AddableCitiesViewController: UITableViewDelegate {
    
}



