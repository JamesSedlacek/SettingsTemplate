//
//  SettingsVC.swift
//  SettingsTemplate
//
//  Created by James Sedlacek on 4/13/21.
//

import UIKit

class SettingsVC: UIViewController {
    
    // MARK: - Variables
    
    var collectionViewSection: [(identifier: String, numberOfRows: Int)] =
        [(identifier: ReuseIdentifier.Notifications.rawValue, numberOfRows: 3),
         (identifier: ReuseIdentifier.General.rawValue,       numberOfRows: 1),
         (identifier: ReuseIdentifier.Appearance.rawValue,    numberOfRows: 2),
         (identifier: ReuseIdentifier.ContactUs.rawValue,     numberOfRows: 1),
         (identifier: ReuseIdentifier.Legal.rawValue,         numberOfRows: 2)]
    
    var picker = PickerOption.timeInterval
    let currencies: [Currency] = [.USDollar,
                                  .Euro,
                                  .CanadianDollar,
                                  .AustralianDollar,
                                  .JapaneseYen]
    let timeIntervals: [NotificationTimeInterval] = [NotificationTimeInterval.fiveMinutes,
                                                     NotificationTimeInterval.fifteenMinutes,
                                                     NotificationTimeInterval.thirtyMinutes,
                                                     NotificationTimeInterval.oneHour,
                                                     NotificationTimeInterval.twelveHours,
                                                     NotificationTimeInterval.oneDay]
    var ctiDelegate: ChangedTimeIntervalDelegate?
    var ccDelegate: ChangeCurrencyDelegate?
    
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
        
        switch reuseIdentifier {
        
        case ReuseIdentifier.NotificationsOFF.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NotificationsCVCell
            cell.setup(viewController: self, pushNotificationsOn: false)
            return styleCell(cell) as! NotificationsCVCell
        
        case ReuseIdentifier.Notifications.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NotificationsCVCell
            cell.setup(viewController: self, pushNotificationsOn: true)
            ctiDelegate = cell
            return styleCell(cell) as! NotificationsCVCell
            
        case ReuseIdentifier.General.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GeneralCVCell
            cell.setup(self)
            ccDelegate = cell
            return styleCell(cell) as! GeneralCVCell
        
        case ReuseIdentifier.Legal.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LegalCVCell
            cell.initButtonGesture(self)
            return styleCell(cell) as! LegalCVCell
        
        case ReuseIdentifier.ContactUs.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ContactUsCVCell
            cell.initButtonGesture(self)
            return styleCell(cell) as! ContactUsCVCell
        
        case ReuseIdentifier.Appearance.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppThemeCVCell
            cell.styleButtons()
            return styleCell(cell) as! AppThemeCVCell
            
        default:
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

// MARK: - ViewButton Delegate

extension SettingsVC: ViewButtonDelegate {
    func viewButtonTapped(_ type: ViewButton) {
        switch type {
        case .ContactUs:
            performSegue(withIdentifier: "ContactUsSegue", sender: nil)
        case .TermsOfService:
            performSegue(withIdentifier: "TermsSegue", sender: nil)
        case .PrivacyPolicy:
            performSegue(withIdentifier: "PrivacySegue", sender: nil)
        }
    }
}

// MARK: - PickerView Delegate

extension SettingsVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch picker {
        case .currency:
            return currencies.count
        case .timeInterval:
            return timeIntervals.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch picker {
        case .currency:
            return currencies[row].rawValue
        case .timeInterval:
            return timeIntervals[row].rawValue
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch picker {
        case .currency:
            ccDelegate?.changeCurrency(to: currencies[row])
        case .timeInterval:
            ctiDelegate?.changeInterval(to: timeIntervals[row])
        }
    }
}

// MARK: - Set Delegate

extension SettingsVC: SetPickerDelegate {
    func setPicker(to option: PickerOption) {
        picker = option
    }
}

// MARK: - Push Delegate

extension SettingsVC: PushNotificationsDelegate {
    func togglePushNotifications() {
        for sectionIndex in 0..<collectionViewSection.count {
            if collectionViewSection[sectionIndex].identifier
                == ReuseIdentifier.Notifications.rawValue {
                collectionViewSection[sectionIndex].identifier = ReuseIdentifier.NotificationsOFF.rawValue
                collectionViewSection[sectionIndex].numberOfRows = 1
                break
            }
            if collectionViewSection[sectionIndex].identifier
                == ReuseIdentifier.NotificationsOFF.rawValue {
                collectionViewSection[sectionIndex].identifier = ReuseIdentifier.Notifications.rawValue
                collectionViewSection[sectionIndex].numberOfRows = 3
                break
            }
        }
        collectionView.reloadData()
    }
}
