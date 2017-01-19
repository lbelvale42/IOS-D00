//
//  ViewController.swift
//  D00
//
//  Created by Lucas BELVALETTE on 10/3/16.
//  Copyright © 2016 Lucas BELVALETTE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var firstOperand = "0";
    var intResult:Float = 0;
    var currentOperator = "";
    var operatorJustPressed = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Float.infinity);
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numFunc(_ sender: UIButton) {
        if (operatorJustPressed == false) {
            if (resultLabel.text! != "0") {
                resultLabel.text! += sender.currentTitle!;
            }
            else {
                resultLabel.text = sender.currentTitle;
            }
        }
        else {
            resultLabel.text = sender.currentTitle;
            operatorJustPressed = false;
        }
        print("Button " + sender.currentTitle! + " pressed");
    }

    @IBAction func otherFunc(_ sender: UIButton) {
        if (sender.currentTitle! == "AC") {
            resultLabel.text = "0";
            firstOperand = "0";
            intResult = 0;
            currentOperator = "";
            operatorJustPressed = false;
        }
        else if (sender.currentTitle! == "NEG") {
            operatorJustPressed = true;
            if (resultLabel.text != "0") {
                if (resultLabel.text!.characters.first != "-") {
                    resultLabel.text!.insert("-", at: resultLabel.text!.startIndex);
                }
                else {
                    resultLabel.text!.remove(at: resultLabel.text!.startIndex);
                }
            }
        }
    }
    @IBAction func operandFunc(_ sender: UIButton) {
        switch currentOperator {
        case "+":
            intResult = Float(firstOperand)! + Float(resultLabel.text!)!;
            resultLabel.text! = String(intResult);
            currentOperator = "";
        case "-":
            intResult = Float(firstOperand)! - Float(resultLabel.text!)!;
            resultLabel.text! = String(intResult);
            currentOperator = "";
        case "*":
            if (Float(firstOperand)! * Float(resultLabel.text!)! <= Float.infinity) {
                intResult = Float(firstOperand)! * Float(resultLabel.text!)!;
                resultLabel.text! = String(intResult);
            }
            currentOperator = "";
        case "/":
            if (resultLabel.text! == "0" || resultLabel.text! == "0.0") {
                intResult = 0;
                resultLabel.text! = "0";
                currentOperator = "";
                let alertController = UIAlertController(title: "", message: "You can't divide by 0", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
            else if (firstOperand == "0") {
                intResult = 0;
                resultLabel.text! = "0";
                currentOperator = "";
            }
            else {
                intResult = Float(firstOperand)! / Float(resultLabel.text!)!;
                resultLabel.text! = String(intResult);
                currentOperator = "";
            }
        default:
            print();
        }
        if (sender.currentTitle! != "=") {
            firstOperand = resultLabel.text!;
            currentOperator = sender.currentTitle!;
            operatorJustPressed = true;
        }
        if (resultLabel.text! == "inf") {
            print("inf");
            resultLabel.text! = "0";
            let alertController = UIAlertController(title: "", message: "Not a number !", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        print("Button " + sender.currentTitle! + " pressed");
    }
}
