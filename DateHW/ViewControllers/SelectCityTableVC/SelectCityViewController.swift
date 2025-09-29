//
//  SelectCityViewController.swift
//  DateHW
//
//  Created by Артём Сноегин on 24.09.2025.
//

import UIKit

class SelectCityViewController: UIViewController {

    private var tableView = UITableView()
    
    weak var delegate: SelectCityViewControllerDelegate?

    private var cities: [City]
    
    init(cities: [City]) {
        self.cities = cities
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        title = "Choose a City"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTap))
        navigationItem.rightBarButtonItem?.tintColor = .systemOrange
    }
    
    @objc private func cancelTap() {
        dismiss(animated: true)
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
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
    }
    
}

extension SelectCityViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCity = cities[indexPath.row]
        
        delegate?.didSelectCity(selectedCity)
        dismiss(animated: true)
    }
    
}

extension SelectCityViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(UITableViewCell.self)", for: indexPath)
        
        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = cities[indexPath.row].name
        contentConfig.secondaryText = cities[indexPath.row].country
        
        cell.contentConfiguration = contentConfig
        
        return cell
    }
    
}
