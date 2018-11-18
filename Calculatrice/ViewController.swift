//
//  ViewController.swift
//  Calculatrice
//
//  Created by Alejandro LOPEZ on 18/11/18.
//  Copyright © 2018 Alejandro LOPEZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var formulaLabel: UILabel!
    
    
    var resultValueString : String = "0"
    var currentValueString : String = "0"
    var operatorSymbol : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func divisionBtClick(_ sender: Any) {
        operatorSymbol="/"
        symbolTreatment()
    }
    
    @IBAction func multiplicationBtClick(_ sender: Any) {
        operatorSymbol="*"
        symbolTreatment()
    }
    @IBAction func sumBtClick(_ sender: Any) {
        operatorSymbol="+"
        symbolTreatment()
    }
    @IBAction func substractionBtClick(_ sender: Any) {
        operatorSymbol="-"
        symbolTreatment()
    }
    
    @IBAction func oneBtClick(_ sender: Any) {
        insertChar(char: "1")
    }
    
    @IBAction func twoBtClick(_ sender: Any) {
        insertChar(char: "2")
    }
    
    @IBAction func threeBtClick(_ sender: Any) {
        insertChar(char: "3")
    }
    
    @IBAction func fourBtClick(_ sender: Any) {
        insertChar(char: "4")
    }
    
    @IBAction func fiveBtClick(_ sender: Any) {
        insertChar(char: "5")
    }
    
    @IBAction func sixBtClick(_ sender: Any) {
        insertChar(char: "6")
    }
    
    @IBAction func sevenBtClick(_ sender: Any) {
        insertChar(char: "7")
    }
    
    @IBAction func eightBtClick(_ sender: Any) {
        insertChar(char: "8")
    }
    
    @IBAction func nineBtClick(_ sender: Any) {
        insertChar(char: "9")
    }
    
    @IBAction func pointBtClick(_ sender: Any) {
        if (!currentValueString.contains(".")){
            insertChar(char: ".")
        }
    }
    @IBAction func zeroBtClick(_ sender: Any) {
        if(resultLabel.text != "0" ){
            insertChar(char: "0")
        }
        
    }
    
    @IBAction func equalsBtClick(_ sender: Any) {
        calcul()
    }
    @IBAction func clearAll(_ sender: Any) {
        resultLabel.text = "0"
        formulaLabel.text = "0"
        resultValueString = "0"
        currentValueString = "0"
        operatorSymbol = ""
    }
    
    @IBAction func removeLast(_ sender: Any) {
        
        let labelText :String = formulaLabel.text ?? ""
        let lastChar = labelText.last
        if (lastChar != "/" && lastChar != "+" && lastChar != "-" && lastChar != "*"){
            if (!labelText.isEmpty){
                formulaLabel.text?.removeLast()
            }
            if (!currentValueString.isEmpty){
                currentValueString.removeLast()
            }
            
            calcul()
        }
    }
    
    func calcul() {
        let val1 : Double = Double(resultValueString) ?? 0
        let val2 : Double = Double(currentValueString) ?? 0
        let result : Double
        if(val1 == 0){
            return
        }
        switch operatorSymbol {
        case "/":
            if(val2 == 0) {return}
            result=val1/val2
        case "*":
            result=val1*val2
        case "+":
            result=val1+val2
        case "-":
            result=val1-val2
        default:
            return
        }
        resultValueString=String(result)
        resultLabel.text=String(result)
    }
    
    func insertChar(char : String){
        var formulaLabelText : String = ""
        
        if (currentValueString == "0" ){
            currentValueString = char
        }else{
            currentValueString.append(char)
        }
        if (resultValueString != "0"){
            formulaLabelText.append(resultValueString)
        }
        if (operatorSymbol != ""){
            formulaLabelText.append(operatorSymbol)
        }
        formulaLabelText.append(currentValueString)
        formulaLabel.text = formulaLabelText
        print(formulaLabelText)
        print("result "+resultValueString)
        calcul()
    }
    
    func symbolTreatment(){
        var formulaLabelText : String
        if (resultValueString == "0"){
            resultValueString=currentValueString
            formulaLabelText = formulaLabel.text ?? "0"
        }else{
            calcul()
            formulaLabelText=resultValueString
        }
        formulaLabelText.append(operatorSymbol)
        formulaLabel.text=formulaLabelText
        currentValueString="0"
        
    }
}

