//
//  CalculatorBrain.swift
//  BMI
//
//  Created by Tatiana Zudina on 01.05.2023.
//

import UIKit

struct CalculatorBrain {
	
	var bmi: BMI?
	
	func getBMIValue() -> String {
		
		let bmiToDecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
		return bmiToDecimalPlace
		
	}
	
	func getAdvice() -> String {
		return bmi?.advice ?? "No advice for you("
	}
	
	func getColor() -> UIColor {
		return bmi?.color ?? UIColor.white
	}
	
	mutating func calculateBMI(weight: Float, height: Float) {
		let bmiValue = weight / (height * height)
		
		if bmiValue < 18.5 {
			bmi = BMI(value: bmiValue, advice: "Eat more pies!🍰", color: UIColor.blue)
		} else if bmiValue < 24.9 {
			bmi = BMI(value: bmiValue, advice: "Fir as a fiddle!🎻", color: UIColor.green)
		} else {
			bmi = BMI(value: bmiValue, advice: "Eat less pies!‼️", color: UIColor.orange)
		}
	}
	
	
}
