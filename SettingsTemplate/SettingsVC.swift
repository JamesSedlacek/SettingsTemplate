//
//  SettingsVC.swift
//  SettingsTemplate
//
//  Created by James Sedlacek on 4/13/21.
//

import UIKit

// MARK: - ReuseIdentifier ENUM

enum ReuseIdentifier: String {
    case Notifications = "NotificationsCell"
    case General = "GeneralSettingsCell"
    case Appearance = "AppThemeCell"
    case ContactUs = "ContactUsCell"
    case Legal = "LegalCell"
}

class SettingsVC: UIViewController {
    
    // MARK: - Variables
    
    let collectionViewSection: [(identifier: String, numberOfRows: Int)] =
        [(identifier: ReuseIdentifier.Notifications.rawValue, numberOfRows: 4),
         (identifier: ReuseIdentifier.General.rawValue,       numberOfRows: 1),
         (identifier: ReuseIdentifier.Appearance.rawValue,    numberOfRows: 2),
         (identifier: ReuseIdentifier.ContactUs.rawValue,     numberOfRows: 1),
         (identifier: ReuseIdentifier.Legal.rawValue,         numberOfRows: 2)]
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - IBActions
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

// MARK: - Collection View Delegate

extension SettingsVC: UICollectionViewDelegate,
                      UICollectionViewDataSource,
                      UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewSection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = collectionViewSection[indexPath.row].identifier
        
        if reuseIdentifier == ReuseIdentifier.Appearance.rawValue {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppThemeCVCell

            cell.lightButton.layer.cornerRadius = 8
            cell.darkButton.layer.cornerRadius = 8
            cell.buttonStackView.spacing = (cell.frame.width -
                                            cell.lightButton.frame.width -
                                            cell.darkButton.frame.width) / 3
            return styleCell(cell) as! AppThemeCVCell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
            return styleCell(cell)
        }
    }
    
    func styleCell(_ cell: UICollectionViewCell) -> UICollectionViewCell {
        cell.layer.cornerRadius = 8
        cell.contentView.layer.cornerRadius = 8
        cell.contentView.layer.masksToBounds = true
        cell.layer.masksToBounds = false
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowRadius = 3.0
        cell.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let headerHeight: CGFloat = 60
        let rowHeight: CGFloat = 50
        let margin: CGFloat = 28
        let screenSize = UIScreen.main.bounds
        let height: CGFloat = headerHeight + (rowHeight * CGFloat(collectionViewSection[indexPath.row].numberOfRows))
        return CGSize(width: screenSize.width - margin,
                      height: height)
    }
}
