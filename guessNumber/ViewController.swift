//
//  ViewController.swift
//  guessNumber
//
//  Created by CheChenLiu on 2021/8/31.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var guessWrongCountLabel: UILabel!
    @IBOutlet weak var guessButton: UIButton!
    
    var answer = Int.random(in: 1...100)
    var guessWrongCount = 0
    var minNumber = 0
    var maxNumber = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("answer = \(answer)")
    }

    @IBAction func guess(_ sender: Any) {
        let numberText = numberTextField.text!
        let number = Int(numberText)
        
        if number != nil, number! < maxNumber, number! > minNumber {
            print("line33")
            let guessNumber = number!
            
            if guessNumber == answer {
                print("line37")
                resultLabel.text = "恭喜猜中了！ 就是 \(guessNumber)!"
                numberTextField.text = ""
                numberTextField.isEnabled = false
                guessButton.isEnabled = false
                
            } else if guessNumber < answer {
                print("line43")
                minNumber = guessNumber
                resultLabel.text = "\(minNumber) ~ \(maxNumber) 之間"
                numberTextField.text = ""
                guessWrongCount += 1
                
            } else if guessNumber > answer {
                print("line50")
                maxNumber = guessNumber
                resultLabel.text = "\(minNumber) ~ \(maxNumber) 之間"
                numberTextField.text = ""
                guessWrongCount += 1
                
            }
            print(minNumber, maxNumber)
            guessWrongCountLabel.text = "剩餘 \(4 - guessWrongCount) 次機會"
            
        } else if number != nil, number! >= maxNumber || number! <= minNumber {
            print("line61")
            numberTextField.text = ""
            resultLabel.text = "請輸入\(minNumber) ~ \(maxNumber) 之間的數字!!!"

        } else if number == nil {
            print("line66")
            numberTextField.text = ""
            resultLabel.text = "請輸入\(minNumber) ~ \(maxNumber) 之間的數字!!!"
            
        } else if number == 0 || number == 100 {
            print("line71")
            numberTextField.text = ""
            resultLabel.text = "請輸入\(minNumber) ~ \(maxNumber) 之間的數字!!!"
            
        }
                
        if guessWrongCount == 4 {
            resultLabel.text = "再來一次吧，正確答案是 \(answer)"
            numberTextField.isEnabled = false
            guessButton.isEnabled = false
        }
        
        numberTextField.endEditing(true)
        
    }
    
    @IBAction func replay(_ sender: Any) {
        
        answer = Int.random(in: 1...100)
        print("answer = \(answer)")
        numberTextField.text = ""
        resultLabel.text = "請輸入0~100之間的數字"
        minNumber = 0
        maxNumber = 100
        guessWrongCount = 0
        guessWrongCountLabel.text = "剩餘 \(4 - guessWrongCount) 次機會"
        numberTextField.isEnabled = true
        
    }
    
}

