//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by Heli Bavishi on 12/14/20.
//

import Foundation

class TipCalculator {
    var amount: Double = 0
    var tipAmount: Double = 0
    var tipPercentage: Double = 0
    var totalAmount: Double = 0
    var tax: Double = 9.25
    
    init(amount: Double, tipPercentage: Double) {
        self.amount = amount
        self.tipPercentage = tipPercentage
    }
}//End of class
