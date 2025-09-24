//
//  CitiesTableVC.swift
//  DateHW
//
//  Created by Артём Сноегин on 24.09.2025.
//

import UIKit

class CitiesTableVC: UITableViewController {

    private var cities = DataStore().cities
    
    weak var citySelectorDelegate: CitySelectorDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        title = "Choose a City"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTap))
        navigationItem.rightBarButtonItem?.tintColor = .systemOrange

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = cities[indexPath.row].name
        contentConfig.secondaryText = cities[indexPath.row].country
        
        cell.contentConfiguration = contentConfig
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCity = cities[indexPath.row]
        citySelectorDelegate?.didSelectCity(selectedCity)
        dismiss(animated: true)
    }
    
    @objc private func cancelTap() {
        dismiss(animated: true)
    }
    
}
