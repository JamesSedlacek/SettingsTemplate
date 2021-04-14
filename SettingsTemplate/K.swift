//
//  K.swift
//  LoginTest
//
//  Created by James Sedlacek on 3/16/21.
//

import UIKit

enum loginType {
    case Facebook
    case Google
    case Email
}

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
