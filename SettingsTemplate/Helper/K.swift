//
//  K.swift
//  LoginTest
//
//  Created by James Sedlacek on 3/16/21.
//

import UIKit

struct K {
    struct URLs {
        static let privacyPolicy = URL(string:"https://dragon-odyssey.flycricket.io/privacy.html")!
        static let termsOfService = URL(string:"https://dragon-odyssey.flycricket.io/terms.html")!
    }
    
    struct Strings {
        static let supportEmail = "support@gmail.com"
    }
    
    struct Numbers {
        static let buttonCornerRadius: CGFloat = 25
    }
    
    struct Images {
        static let square = UIImage.init(systemName: "square")
        static let checkmarkSquare = UIImage.init(systemName: "checkmark.square")
        static let eye = UIImage.init(systemName: "eye")
        static let eyeSlash = UIImage.init(systemName: "eye.slash")
    }
    
    struct Colors {
        static let buttonBackground = UIColor.systemBlue
        static let buttonTint = UIColor.white
        static let textFieldLine = UIColor.systemBlue.cgColor
    }
}

// MARK: - ENUMs & Protocols

enum NotificationTimeInterval: String {
    case fiveMinutes = "5 Minutes"
    case fifteenMinutes = "15 Minutes"
    case thirtyMinutes = "30 Minutes"
    case oneHour = "1 Hour"
    case twelveHours = "12 Hours"
    case oneDay = "24 Hours"
}

enum Currency: String {
    case USDollar = "USD"
    case Euro = "EUR"
    case CanadianDollar = "CAD"
    case AustralianDollar = "AUD"
    case JapaneseYen = "JPY"
}

enum PickerOption {
    case currency
    case timeInterval
}

enum ReuseIdentifier: String {
    case Notifications = "NotificationsCell"
    case NotificationsOFF = "NotificationsOFFCell"
    case General = "GeneralSettingsCell"
    case Appearance = "AppThemeCell"
    case ContactUs = "ContactUsCell"
    case Legal = "LegalCell"
}

enum ViewButton {
    case ContactUs
    case TermsOfService
    case PrivacyPolicy
}

protocol ViewButtonDelegate {
    func viewButtonTapped(_ type: ViewButton)
}

protocol SetPickerDelegate {
    func setPicker(to option: PickerOption)
}

protocol PushNotificationsDelegate {
    func togglePushNotifications()
}

protocol ChangeCurrencyDelegate {
    func changeCurrency(to currency: Currency)
}

protocol ChangedTimeIntervalDelegate {
    func changeInterval(to interval: NotificationTimeInterval)
}
