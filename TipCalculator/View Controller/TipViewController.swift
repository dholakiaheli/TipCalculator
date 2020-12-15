//
//  TipViewController.swift
//  TipCalculator
//
//  Created by Heli Bavishi on 12/14/20.
//

import UIKit

class TipViewController: UIViewController, UITextFieldDelegate {

    //MARK: - Outlets

    @IBOutlet weak var billAmountLabel: TipLabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipPercentageLabel: TipLabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    
    @IBOutlet weak var numberOfPeopleLabel: TipLabel!
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    
    @IBOutlet weak var totalAmountView: UIView!
    @IBOutlet weak var totalLabel: TipLabel!
    @IBOutlet weak var totalResultLabel: TipLabel!
    
    @IBOutlet weak var eachPersonView: UIView!
    @IBOutlet weak var eachLabel: TipLabel!
    @IBOutlet weak var eachPersonLabel: TipLabel!
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.becomeFirstResponder()
        updateUI()
    }
    
    var tipCalculator = TipCalculator(amount: 0, tipPercentage: 0.10)
    
    func calculateBill() {
        tipCalculator.amount = (billAmountTextField.text! as NSString).doubleValue
        tipCalculator.tipPercentage = Double(tipPercentageSlider.value)

        tipCalculator.tipAmount = (tipCalculator.amount * tipCalculator.tipPercentage) / 100
        tipCalculator.totalAmount = tipCalculator.tipAmount + tipCalculator.amount
        updateUI()
    }
    
    func updateUI() {
        self.totalResultLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount)
        let numberOfPeople: Int = Int(numberOfPeopleSlider.value)
        eachPersonLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount / Double(numberOfPeople))
        
        self.view.backgroundColor = .cardGray

        self.billAmountLabel.tintColor = UIColor.mainTextColor
        self.billAmountTextField.textColor = UIColor.spaceBlack
        
        self.tipPercentageLabel.tintColor = UIColor.mainTextColor
        
        self.numberOfPeopleLabel.tintColor = UIColor.mainTextColor
        
        self.totalAmountView.backgroundColor = .spaceGray
        self.totalLabel.tintColor = UIColor.mainTextColor
        self.totalResultLabel.tintColor = UIColor.subltleTextColor
        
        self.eachPersonView.backgroundColor = .spaceGray
        self.eachLabel.tintColor = .mainTextColor
        self.eachPersonLabel.tintColor = .subltleTextColor

    }
    
    //MARK: - Actions
    @IBAction func textfieldValueChanged(_ sender: Any) {
        calculateBill()
    }
    
    @IBAction func tipSliderValueChanged(_ sender: Any) {
        tipPercentageLabel.text = String(format: "Tip: %02d%%", Int(tipPercentageSlider.value))
        calculateBill()
    }
    
    @IBAction func numberOfPeopleValueChanged(_ sender: Any) {
        numberOfPeopleLabel.text = String(format: "Split: %2d%", Int(numberOfPeopleSlider.value))
        calculateBill()
    }
   
}//End of class
