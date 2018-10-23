//
//  ViewController.swift
//  simple-calc-ios
//
//  Created by Arman Shah on 10/19/18.
//  Copyright © 2018 Arman Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var historyOfInputs: [String] = []
    
    func userEq(uInput: String) -> [String] {
        var uInputStrings : [String] = []
        
        var equationContents : [String] = uInput.components(separatedBy: " ")
        print(equationContents)
        
        if equationContents[0] == "" {
            equationContents.removeFirst()
        }
        
        if equationContents[equationContents.count-1] == "" {
            equationContents.removeLast()
        }
        print(equationContents)
        var finalIndex : Int = equationContents.count - 1
        var i : Int = 0
        
        while i < finalIndex {
            print(i)
            let indexChar = equationContents[i]
            if indexChar == "-" {
                if i == 0 || (i > 0 && Int(equationContents[i - 1]) == nil) {
                    equationContents[i+1] = indexChar + equationContents[i + 1]
                    equationContents.remove(at: i)
                    finalIndex -= 1
                    i -= 1
                }
            }
            i += 1
        }
        print(equationContents)
        
        switch equationContents[1] {
        case "avg":
            for index in 0...equationContents.count - 1 {
                
                if equationContents[index] != "avg" && equationContents[index] != "count" {
                    uInputStrings.append(equationContents[index])
                }
                
            }
            equationContents[1] == "avg" ? uInputStrings.append("avg") : uInputStrings.append("count")
            break
        default:
            for index in 0...equationContents.count-1 {
                if Int(equationContents[index]) != nil {
                    uInputStrings.append(equationContents[index])
                }
            }
            uInputStrings.append(equationContents[1])
            break
        }
        
        return uInputStrings
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // reference to the text box to display results
    @IBOutlet weak var labelReference: UILabel!
    
    @IBAction func buttonPressed(_ sender: Any) {
        let eqInput : String = (sender as AnyObject).titleLabel!!.text!
        var historyEq: String = ""
            
            switch eqInput {
                case "=":
                    let inputString : [String] = userEq(uInput: labelReference.text!)
                    historyEq = labelReference.text! + " = "
                    
                    switch inputString[inputString.count - 1] {
                    case "avg":
                        var average : Int = 0
                        
                        for i in 0...inputString.count-2 {
                            let toAdd : Int = Int(inputString[i])!
                            average += toAdd
                        }
                        
                        labelReference.text = String(average / (inputString.count - 1))
                        historyEq += String(average / (inputString.count - 1))
                        break
                    case "count":
                        labelReference.text = String(inputString.count - 1)
                        historyEq += String(inputString.count - 1)
                        break
                    case "fact":
                        let number : Int = abs(Int(inputString[0])!)
                        var factorialResult : Int = 1
                        if number == 1 || number == 0 {
                            labelReference.text = String(1)
                            break
                        } else {
                            for i in stride(from: number, to: 1, by: -1) {
                                factorialResult *= i
                            }
                        }
                        labelReference.text = String(Int(inputString[0])! > 0 ? factorialResult : -factorialResult)
                        historyEq += String(Int(inputString[0])! > 0 ? factorialResult : -factorialResult)
                    case "/":
                        let number1 : Int = Int(inputString[0])!
                        let number2 : Int = Int(inputString[1])!
                        labelReference.text = String(number1 / number2)
                        historyEq += String(number1 / number2)
                    case "-":
                        let number1 : Int = Int(inputString[0])!
                        let number2 : Int = Int(inputString[1])!
                        labelReference.text = String(number1 - number2)
                        historyEq += String(number1 - number2)
                    case "%":
                        let number1 : Int = Int(inputString[0])!
                        let number2 : Int = Int(inputString[1])!
                        labelReference.text = String((number1 % number2 + number2) % number2)
                        historyEq += String((number1 % number2 + number2) % number2)
                    case "+":
                        let number1 : Int = Int(inputString[0])!
                        let number2 : Int = Int(inputString[1])!
                        labelReference.text = String(number1 + number2)
                        historyEq += String(number1 + number2)
                    case "*":
                        let number1 : Int = Int(inputString[0])!
                        let number2 : Int = Int(inputString[1])!
                        labelReference.text = String(number1 * number2)
                        historyEq += String(number1 * number2)
                        
                    default:
                        labelReference.text = ""
                }
                
            // Clear the label
            case "C":
                labelReference.text = ""
                
            default:
                if Int(eqInput) != nil {
                    labelReference.text = labelReference.text! + eqInput
                } else {
                    labelReference.text = labelReference.text! + " " + eqInput + " "
                }
            }
            if historyEq != "" {
                self.historyOfInputs.append(historyEq)
            }
        }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "tohistory" {
                let secondVC = segue.destination as! HistoryViewController
                secondVC.stringOfInputs = self.historyOfInputs
                
            }
        }
    
    
}
    


