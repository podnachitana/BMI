//
//  ViewController.swift
//  BMI
//
//  Created by Tatiana Zudina on 20.04.2023.
//

import UIKit

class CalculateViewController: UIViewController {
	
	var calculatorBrain = CalculatorBrain()

	@IBOutlet weak var heightLabel: UILabel!
	@IBOutlet weak var weightLabel: UILabel!
	@IBOutlet weak var heightSlider: UISlider!
	@IBOutlet weak var weightSlider: UISlider!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func heightSliderAction(_ sender: UISlider) {
		var height = String(format: "%.2f", sender.value)
		heightLabel.text = "\(height)m"
	}
	@IBAction func weightSliderAction(_ sender: UISlider) {
		var weight = String(format: "%.0f", sender.value)
		weightLabel.text = "\(weight)kg"

	}
	@IBAction func calculatePressed(_ sender: UIButton) {
		let height = heightSlider.value
		let weight = weightSlider.value
		
		calculatorBrain.calculateBMI(weight: weight, height: height)
		
		self.performSegue(withIdentifier: "goToResult", sender: self)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "goToResult" {
			let destinationVC = segue.destination as! ResultViewController
			destinationVC.bmiValue = calculatorBrain.getBMIValue()
			destinationVC.advice = calculatorBrain.getAdvice()
			destinationVC.color = calculatorBrain.getColor()
		}
	}
	
	
	
}

