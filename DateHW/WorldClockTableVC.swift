//
//  WorldClockTableVC.swift
//  DateHW
//
//  Created by Артём Сноегин on 24.09.2025.
//

import UIKit

class WorldClockTableVC: UITableViewController, CitySelectorDelegate {

    private var selectedCities = [City]()
    
    func didSelectCity(_ city: City) {
        selectedCities.append(city)
        let indexPath = IndexPath(row: selectedCities.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        title = "World Clock"
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.leftBarButtonItem?.tintColor = .systemOrange
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem?.tintColor = .systemOrange

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedCities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = selectedCities[indexPath.row].name
        contentConfig.secondaryText = selectedCities[indexPath.row].country
        
        cell.contentConfiguration = contentConfig
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            selectedCities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let city = selectedCities[sourceIndexPath.row]
        selectedCities.remove(at: sourceIndexPath.row)
        selectedCities.insert(city, at: destinationIndexPath.row)
    }
    
    @objc private func addTapped() {
        let citiesTableVC = CitiesTableVC()
        citiesTableVC.citySelectorDelegate = self
        let modalVC = UINavigationController(rootViewController: citiesTableVC)
        present(modalVC, animated: true)
    }
    
}
