//
//  NotificationsCVCell.swift
//  SettingsTemplate
//
//  Created by James Sedlacek on 4/14/21.
//

import UIKit

class NotificationsCVCell: UICollectionViewCell {
    
    // MARK: - Variables
    
    var parentVC: UIViewController?
    var pickerDelegate: SetPickerDelegate?
    var pushDelegate: PushNotificationsDelegate?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var timeIntervalTF: UITextField!
    @IBOutlet weak var pushSwitch: UISwitch!
    
    // MARK: - IBActions
    
    @IBAction func beginEditing(_ sender: UITextField) {
        pickerDelegate?.setPicker(to: .timeInterval)
    }
    
    @IBAction func pushTapped(_ sender: UISwitch) {
        pushDelegate?.togglePushNotifications()
    }
    
    func setup(viewController: UIViewController, pushNotificationsOn: Bool) {
        pushSwitch.isOn = pushNotificationsOn
        pickerDelegate = viewController as? SetPickerDelegate
        pushDelegate = viewController as? PushNotificationsDelegate
        if pushNotificationsOn {
            parentVC = viewController
            createPicker()
            createToolbar()
        }
    }
    
    private func createPicker() {
        guard let vc = parentVC else { return }
        let picker = UIPickerView()
        picker.delegate = vc as? UIPickerViewDelegate
        picker.dataSource = vc as? UIPickerViewDataSource
        timeIntervalTF.inputView = picker
    }
    
    private func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let screenSize = UIScreen.main.bounds
        toolbar.center = CGPoint(x: screenSize.width/2, y: 200)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.dismissKeyboard))
        let flexible = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneButtonTapped as () -> Void))
        
        toolbar.setItems([cancelButton, flexible, doneButton], animated: false)
        
        toolbar.isUserInteractionEnabled = true
        timeIntervalTF.inputAccessoryView = toolbar
    }

    @objc func dismissKeyboard() {
        guard let vc = parentVC else { return }
        vc.view.endEditing(true)
    }
    
    @objc func doneButtonTapped() {
        guard let vc = parentVC else { return }
        //TODO: When a user taps the done button
        vc.view.endEditing(true)
    }
}
