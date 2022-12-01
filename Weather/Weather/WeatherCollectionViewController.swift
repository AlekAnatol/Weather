//
//  WeatherCollectionViewController.swift
//  Weather
//
//  Created by Екатерина Алексеева on 29.11.2022.
//

import UIKit

class WeatherCollectionViewController: UICollectionViewController {
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView = UICollectionView(frame: view.safeAreaLayoutGuide.layoutFrame,                                                               collectionViewLayout: setUpFlowLayout())
        self.collectionView.backgroundColor = .lightGray
        self.collectionView.register(WeatherCell.self, forCellWithReuseIdentifier: "\(WeatherCell.self)")
    }

    // MARK: - UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(WeatherCell.self)", for: indexPath) as? WeatherCell
        else { return UICollectionViewCell() }
        cell.imageView.image = getImage(item: indexPath.item)
        cell.temperatureLabel.text = "30 C"
        cell.timeLabel.text = "29.12.2022 13-22"
        return cell
    }
    
    // MARK: - Private Methods
    
    private func setUpFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 200)
        return layout
    }
    
    private func getImage(item: Int) -> UIImage {
        let division = item % 3
        switch division {
        case 0:
            return UIImage(named: "sol") ?? UIImage()
        case 1:
            return UIImage(named: "rain") ?? UIImage()
        case 2:
            return UIImage(named: "wind") ?? UIImage()
        default:
            return UIImage(named: "sol") ?? UIImage()
        }
    }
}
