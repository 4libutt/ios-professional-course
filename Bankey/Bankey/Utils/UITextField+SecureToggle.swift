//
//  UITextField+SecureToggle.swift
//  Bankey
//
//  Created by Ali Butt on 13/12/2022.
//

import Foundation
import UIKit

extension UITextField {
    func enablePasswordToggle() {
        let passwordToggleButton = UIButton(type: .custom)
//        passwordToggleButton.tintColor = .systemBlue
        passwordToggleButton.setImage(UIImage(named: "eye.fill"), for: .normal)
        passwordToggleButton.setImage(UIImage(named: "eye.slash.fill"), for: .selected)
        passwordToggleButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        rightView = passwordToggleButton
        rightViewMode = .always
    }
    
    @objc func togglePasswordView(_ sender: UIButton) {
        isSecureTextEntry.toggle()
        sender.isSelected.toggle()
    }
}
