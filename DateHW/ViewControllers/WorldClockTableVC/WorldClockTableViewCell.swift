//
//  WorldClockTableViewCell.swift
//  DateHW
//
//  Created by Артём Сноегин on 29.09.2025.
//

import UIKit

class WorldClockTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "WorldClockTableViewCell"
    
    private let cityLabel = UILabel()
    private let countryLabel = UILabel()
    private let timeLabel = UILabel()
    private var timezoneID: String?
    
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
        timezoneID = city.timezoneID
        updateTime()
    }
    
    func updateTime() {
        guard let timezoneID = timezoneID else { return }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        dateFormatter.timeZone = TimeZone(identifier: timezoneID)

        timeLabel.text = dateFormatter.string(from: Date.now)
    }
    
    private func setupUI() {
        let labelStack = UIStackView(arrangedSubviews: [cityLabel, countryLabel])
        labelStack.axis = .vertical
        
        cityLabel.font = .preferredFont(forTextStyle: .largeTitle)
        cityLabel.textAlignment = .left
        
        countryLabel.font = .preferredFont(forTextStyle: .callout)
        countryLabel.textAlignment = .left
        countryLabel.textColor = .secondaryLabel
        
        contentView.addSubview(labelStack)
        labelStack.translatesAutoresizingMaskIntoConstraints = false
        
        timeLabel.font = .systemFont(ofSize: cityLabel.font.pointSize * 1.5, weight: .medium)
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
