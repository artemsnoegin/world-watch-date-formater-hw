//
//  WorldClockViewController.swift
//  DateHW
//
//  Created by Артём Сноегин on 29.09.2025.
//

import UIKit

class WorldClockViewController: UIViewController {
    
    private var selectedCities = DataStore().loadDefaultCities()
    
    private var tableView = UITableView()
    
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupNavigationBar()
        setupTableView()
        setupTimer()
    }
    
    private func setupNavigationBar() {
        title = "World Clock"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.leftBarButtonItem?.tintColor = .systemOrange
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem?.tintColor = .systemOrange
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
    
    @objc private func addTapped() {
        let cities = DataStore().loadCities().filter {
            !selectedCities.contains($0)
        }
        let nextVC = SelectCityViewController(cities: cities)
        nextVC.delegate = self
        
        let modalVC = UINavigationController(rootViewController: nextVC)
        present(modalVC, animated: true)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])

        tableView.register(WorldClockTableViewCell.self, forCellReuseIdentifier: WorldClockTableViewCell.reuseIdentifier)
    }
    
    private func setupTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateCells()
        }
    }
    
    private func updateCells() {
        for cell in tableView.visibleCells {
            if let clockCell = cell as? WorldClockTableViewCell {
                clockCell.updateTime()
            }
        }
    }
    
    deinit {
        timer.invalidate()
    }
    
}

extension WorldClockViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
}

extension WorldClockViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let city = selectedCities[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: WorldClockTableViewCell.reuseIdentifier, for: indexPath) as! WorldClockTableViewCell

        cell.configureCell(for: city)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            selectedCities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let city = selectedCities[sourceIndexPath.row]
        
        selectedCities.remove(at: sourceIndexPath.row)
        selectedCities.insert(city, at: destinationIndexPath.row)
    }
    
}

extension WorldClockViewController: SelectCityViewControllerDelegate {
    
    func didSelectCity(_ city: City) {
        selectedCities.append(city)
        
        let indexPath = IndexPath(row: selectedCities.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
}
