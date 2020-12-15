//
//  TipLabel.swift
//  TipCalculator
//
//  Created by Heli Bavishi on 12/14/20.
//

import UIKit

class TipLabel: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateFontTo(font: FontNames.latoRegular)
        self.textColor = .mainTextColor
    }
    
    func updateFontTo(font: String) {
        let size = self.font.pointSize
        self.font = UIFont(name: font, size: size)
    }
}//End of class

class TipLabelLight: TipLabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        updateFontTo(font: FontNames.latoLight)
        self.textColor = .subltleTextColor
    }
}

class TipLabelBold: TipLabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        updateFontTo(font: FontNames.latoBold)
    }
}//End of class
