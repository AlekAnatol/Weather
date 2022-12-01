//
//  WeatherCell.swift
//  Weather
//
//  Created by Екатерина Алексеева on 29.11.2022.
//

import UIKit

class WeatherCell: UICollectionViewCell {
    
    // MARK: - Visual Components
    
    let imageView = UIImageView()
    let temperatureLabel = UILabel()
    let timeLabel = UILabel()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods
    
    private func setUpCell() {
        contentView.addSubview(imageView)
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(timeLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        
        imageView.backgroundColor = .green
        temperatureLabel.backgroundColor = .orange
        timeLabel.backgroundColor = .red
        
        timeLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            temperatureLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            temperatureLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            temperatureLabel.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            
            imageView.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.bottomAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 150),
            
            timeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            timeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            timeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
