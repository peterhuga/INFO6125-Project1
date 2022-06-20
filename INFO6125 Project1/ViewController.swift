//
//  ViewController.swift
//  INFO6125 Project1
//
//  Created by Jason Wang on 2022-06-17.
//

import UIKit

class ViewController: UIViewController {
    let wordList: [String] = ["WATER", "PLANE", "PETER"]
    let answer: [Character] = [Character]("WAAER")
    var word: [Character] = []
    var inputKey: String = ""
    var columnCounter: Int = 0
    var rowCounter: Int = 1
    var letterBoxRow: [UILabel] = []
    
    
    @IBOutlet var firstRowLetters: [UILabel]!
    
    
    @IBOutlet var secondRowLetters: [UILabel]!
    
    @IBOutlet var thirdRowLetters: [UILabel]!
    
    @IBOutlet var fourthRowLetters: [UILabel]!
    
    @IBOutlet var fifthRowLetters: [UILabel]!
    @IBOutlet var sixthRowLetters: [UILabel]!
    @IBOutlet var bottomRowButtons: [UIButton]!
    
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

// highlight the next box and set text in the same color to hide it.
//        firstRowLetters[0].textColor = UIColor.darkGray
//        firstRowLetters[0].backgroundColor = UIColor.darkGray
        
        submitButton.isEnabled = false
        
    }
    
// Every keyboard button is connected to this action.
    @IBAction func onButtonTapped(_ sender: UIButton) {
        if columnCounter < 5 {
        let letter: Character = Character(sender.titleLabel!.text!)
            if word.count < 5 {
        word.append(letter)
            }
        
        switch(rowCounter) {
        case 1: letterBoxRow = firstRowLetters
        case 2: letterBoxRow = secondRowLetters
        case 3: letterBoxRow = thirdRowLetters
        case 4: letterBoxRow = fourthRowLetters
        case 5: letterBoxRow = fifthRowLetters
        case 6: letterBoxRow = sixthRowLetters
        print(rowCounter)
        print(letterBoxRow)
            
            
        default: print("rowCounter out of range")
        }
        let letterBox: UILabel = letterBoxRow[columnCounter]
        letterBox.text = sender.titleLabel?.text
        letterBox.textColor = UIColor.black
            if columnCounter == 4 {
                submitButton.isEnabled = true
            }
            
        
        columnCounter = columnCounter + 1
            print(word)
        }
//
        
        
        
    }
    @IBAction func onDeleteTapped(_ sender: UIButton) {
        //tested good
        if columnCounter > 0 {
            letterBoxRow[columnCounter-1].textColor = UIColor.lightGray
            word.removeLast()
            columnCounter = columnCounter - 1
            submitButton.isEnabled = false
        }
    }
    
    @IBAction func onSubmitButtonTapped(_ sender: UIButton) {
        
        var tempAnswer: [Character] = answer
        var tempWord: [Character] = word
        

        
//        for c in word {
            
            
            
//            let index = tempWord.firstIndex(of: c)!
            
            
            

//            if tempAnswer.firstIndex(of: c) != nil && index == tempAnswer.firstIndex(of: c) {
//
//                tempWord.remove(at: index) //mask first instance
//                tempAnswer.remove(at: index)
//                print(word + tempAnswer)
//                changeLetterBox(index: index, c: c, color: UIColor.green)
//            }
//            for c in word {
//            if tempAnswer.contains(c){
//             word[index] = "0" //mask first instance
//            tempAnswer[index] = "0"
//             changeLetterBox(index: index, c: c, color: UIColor.orange)
//
//            }else {
////               word[index] = "0" //mask this element because only first index can be found.
//                firstRowLetters[index].backgroundColor = UIColor.darkGray
//                firstRowLetters[index].text = String(c)
//                firstRowLetters[index].textColor = UIColor.white
//
//            }
//            }
            
       // }
        
        for i in 0...4 {
            if word[i] == answer[i] {
                changeLetterBox(letterRow: letterBoxRow, index: i, c: word[i], color: UIColor.green)
                
            }
        }
        
        word = []
        //tempAnswer = answer
        rowCounter = rowCounter + 1
        if rowCounter == 7 {
            rowCounter = 1
        }
        columnCounter = 0
        submitButton.isEnabled = false
        
    }
    
    func changeLetterBox(letterRow: [UILabel], index: Int, c: Character, color: UIColor) -> Void {
        letterRow[index].backgroundColor = color
        letterRow[index].text = String(c)
        letterRow[index].textColor = UIColor.white
    }
}

