//
//  ViewController.swift
//  Bingo
//
//  Created by 吳佩玟 on 2022/2/8.
//

import UIKit

var a = RandomNum().getNums()
var n = RandomNum().presentNum()

class ViewController: UIViewController {

    var i = 0
    let yellow = UIColor.systemYellow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var twoLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    @IBOutlet weak var fourLabel: UILabel!
    @IBOutlet weak var fiveLabel: UILabel!
    @IBOutlet weak var sixLabel: UILabel!
    @IBOutlet weak var sevenLabel: UILabel!
    @IBOutlet weak var eightLabel: UILabel!
    @IBOutlet weak var nineLabel: UILabel!
    
    @IBAction func start(_ sender: Any) {
    
        changeColor()
        BingoLine()
    }

    private func setup() {
        
        print(a)
        
        oneLabel.text = String(a[0])
        oneLabel.backgroundColor = yellow
        twoLabel.text = String(a[1])
        twoLabel.backgroundColor = yellow
        threeLabel.text = String(a[2])
        threeLabel.backgroundColor = yellow
        fourLabel.text = String(a[3])
        fourLabel.backgroundColor = yellow
        fiveLabel.text = String(a[4])
        fiveLabel.backgroundColor = yellow
        sixLabel.text = String(a[5])
        sixLabel.backgroundColor = yellow
        sevenLabel.text = String(a[6])
        sevenLabel.backgroundColor = yellow
        eightLabel.text = String(a[7])
        eightLabel.backgroundColor = yellow
        nineLabel.text = String(a[8])
        nineLabel.backgroundColor = yellow
    }
    
    private func changeColor() {
        
        print(n)
        
        if i < 9 {
            let nLine = n[i]
            print("i=", i)
            print(nLine)
            
            let index = a.firstIndex(of: nLine)

            print(index)

            switch index {
            case 0:
                oneLabel.backgroundColor = UIColor.red
                break
            case 1:
                twoLabel.backgroundColor = UIColor.red
                break
            case 2:
                threeLabel.backgroundColor = UIColor.red
                break
            case 3:
                fourLabel.backgroundColor = UIColor.red
                break
            case 4:
                fiveLabel.backgroundColor = UIColor.red
                break
            case 5:
                sixLabel.backgroundColor = UIColor.red
                break
            case 6:
                sevenLabel.backgroundColor = UIColor.red
                break
            case 7:
                eightLabel.backgroundColor = UIColor.red
                break
            case 8:
                nineLabel.backgroundColor = UIColor.red
                break
            default:
                break
            }
            i += 1
        } else {
            print("no number can choose")
        }
    }
    
    private func BingoLine() {
        
        let one = oneLabel.backgroundColor == UIColor.red
        let two = twoLabel.backgroundColor == UIColor.red
        let three = threeLabel.backgroundColor == UIColor.red
        let four = fourLabel.backgroundColor == UIColor.red
        let five = fiveLabel.backgroundColor == UIColor.red
        let six = sixLabel.backgroundColor == UIColor.red
        let seven = sevenLabel.backgroundColor == UIColor.red
        let eight = eightLabel.backgroundColor == UIColor.red
        let nine = nineLabel.backgroundColor == UIColor.red
        
        
        func skew() -> Bool {
            
            if (one && five && nine) || (three && five && seven) == true {
                return true
            } else {
                return false
            }
        }
        
        func column() -> Bool {
            
            if (one && four && seven) || (two && five && eight) || (three && six && nine) == true {
                return true
            } else {
                return false
            }
        }
        
        func row() -> Bool {
            
            if (one && two && three) || (four && five && six) || (seven && eight && nine) == true {
                return true
            } else {
                return false
            }
        }

        if skew() || column() || row() == true {

            let alert = UIAlertController(title: "Bingo", message: "Congratalations!", preferredStyle: .alert)
            let tryAgain = UIAlertAction(title: "Try Again", style: .default,
                                         handler: {(action: UIAlertAction!) -> Void in
                a = RandomNum().getNums()
                n = RandomNum().presentNum()
                self.i = 0
                self.setup()
            })
            alert.addAction(tryAgain)
            present(alert, animated: true, completion: nil)
            
        } else {
            print("Continuing...")
        }
        
    }

}

