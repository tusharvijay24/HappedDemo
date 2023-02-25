//
//  UITextField+.swift
//  HappedDemo
//
//  Created by Tushar on 25/02/23.
//

import Foundation
import UIKit

@IBDesignable class CustomTextField: UITextField {
    @IBInspectable var maximumCharacters: Int = 80 {
        didSet {
            limitCharacters()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        limitCharacters()
        addTarget(self, action: #selector(CustomTextField.limitCharacters), for: .editingChanged)
    }

    @objc func limitCharacters() {
        guard text != nil else {
            return
        }
        if (text?.count)! > maximumCharacters {
            if let range = text?.index(before: (text?.endIndex)!) {
                text = text?.substring(to: range)
            }
        }
    }
}
