//
//  ViewController.swift
//  Calculatrice
//
//  Created by Alejandro LOPEZ on 18/11/18.
//  Copyright © 2018 Alejandro LOPEZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //variable qui fait reference au label qui afiche le resultat
    @IBOutlet weak var resultLabel: UILabel!
    //Variable qui fait reference au label qui affiche la formula
    @IBOutlet weak var formulaLabel: UILabel!
    
    //variable contenant le resultat
    var resultValueString : String = "0"
    //variable contenant le valeur en cours
    var currentValueString : String = "0"
    //variable contenant le symbol
    var operatorSymbol : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //click listener pour le bouton de division
    @IBAction func divisionBtClick(_ sender: Any) {
        operatorSymbol="/"
        symbolTreatment()
    }
    //click listener pour le bouton de multiplicqtion
    @IBAction func multiplicationBtClick(_ sender: Any) {
        operatorSymbol="*"
        symbolTreatment()
    }
    //click listener pour le bouton d'adition
    @IBAction func sumBtClick(_ sender: Any) {
        operatorSymbol="+"
        symbolTreatment()
    }
    //click listener pour le bouton substraction
    @IBAction func substractionBtClick(_ sender: Any) {
        operatorSymbol="-"
        symbolTreatment()
    }
    //click listener pour le bouton 1
    @IBAction func oneBtClick(_ sender: Any) {
        insertChar(char: "1")
    }
    //click listener pour le bouton 2
    @IBAction func twoBtClick(_ sender: Any) {
        insertChar(char: "2")
    }
    //click listener pour le bouton 3
    @IBAction func threeBtClick(_ sender: Any) {
        insertChar(char: "3")
    }
    //click listener pour le bouton 4
    @IBAction func fourBtClick(_ sender: Any) {
        insertChar(char: "4")
    }
    //click listener pour le bouton 5
    @IBAction func fiveBtClick(_ sender: Any) {
        insertChar(char: "5")
    }
    //click listener pour le bouton 6
    @IBAction func sixBtClick(_ sender: Any) {
        insertChar(char: "6")
    }
    //click listener pour le bouton 7
    @IBAction func sevenBtClick(_ sender: Any) {
        insertChar(char: "7")
    }
    //click listener pour le bouton 8
    @IBAction func eightBtClick(_ sender: Any) {
        insertChar(char: "8")
    }
    //click listener pour le bouton 9
    @IBAction func nineBtClick(_ sender: Any) {
        insertChar(char: "9")
    }
    //click listener pour le bouton du point
    @IBAction func pointBtClick(_ sender: Any) {
        //control a fin d'eviter l'insertion de plusieurs points
        if (!currentValueString.contains(".")){
            insertChar(char: ".")
        }
    }
    //click listener pour le bouton zero
    @IBAction func zeroBtClick(_ sender: Any) {
        //control afin d'eviter l'ecriture de zeros a gauche
        if(resultLabel.text != "0" ){
            insertChar(char: "0")
        }
        
    }
    ////click listener pour le bouton egal
    @IBAction func equalsBtClick(_ sender: Any) {
        calcul()
    }
    //click listener pou le bouton CE
    //ce methode vide toutes les variables
    @IBAction func clearAll(_ sender: Any) {
        resultLabel.text = "0"
        formulaLabel.text = "0"
        resultValueString = "0"
        currentValueString = "0"
        operatorSymbol = ""
    }
    //methode pour suprimer le dernier character
    @IBAction func removeLast(_ sender: Any) {
        
        let labelText :String = formulaLabel.text ?? ""
        let lastChar = labelText.last
        //control afin d'eviter la suppresion du symbol d'operation
        if (lastChar != "/" && lastChar != "+" && lastChar != "-" && lastChar != "*"){
            //control afin d'eviter appeler removeLast() sur un chaine vide
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
    //inserstion a droite du chqrqcter
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
    //traitement declanche par l'insertion d'un symbole
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

