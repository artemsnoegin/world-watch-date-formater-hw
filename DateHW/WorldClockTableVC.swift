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
        
        tableView.register(WorldClockTableViewCell.self, forCellReuseIdentifier: WorldClockTableViewCell.reuseID)
        
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
        let city = selectedCities[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: WorldClockTableViewCell.reuseID, for: indexPath) as! WorldClockTableViewCell

        cell.configureCell(for: city)
        
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

class WorldClockTableViewCell: UITableViewCell {
    
    static let reuseID = "WorldClockTableViewCell"
    
    private let cityLabel = UILabel()
    private let countryLabel = UILabel()
    private let timeLabel = UILabel()
    
    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(for city: City) {
        cityLabel.text = city.name
        countryLabel.text = city.country
        timeLabel.text = city.currentTime()
    }
    
    private func setupUI() {
        
        let labelStack = UIStackView(arrangedSubviews: [cityLabel, countryLabel])
        labelStack.axis = .vertical
        
        cityLabel.font = .preferredFont(forTextStyle: .extraLargeTitle2)
        cityLabel.textAlignment = .left
        
        countryLabel.font = .preferredFont(forTextStyle: .callout)
        countryLabel.textAlignment = .left
        countryLabel.textColor = .secondaryLabel
        
        contentView.addSubview(labelStack)
        labelStack.translatesAutoresizingMaskIntoConstraints = false
        
        timeLabel.font = .boldSystemFont(ofSize: cityLabel.font.pointSize * 2)
        timeLabel.textAlignment = .right
        contentView.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            labelStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            labelStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            labelStack.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor),
            
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
    }
    
}
