//
//  SecondViewController.swift
//  tabBarTest
//
//  Created by Harry on 2015/1/7.
//  Copyright (c) 2015年 huangharry. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondInput: UITextField!
   // var result = [Int]()
    var customResult = [String]()
    var count = 0 //計算使用者輸入的幾筆資料
    
    @IBAction func next(sender: AnyObject) {
        if secondInput.text.isEmpty {
            let alert = UIAlertView()
            alert.title = "Imput empty"
            alert.message = "請輸入"
            alert.addButtonWithTitle("OK")
            alert.show()
        }
        
        else{
            customResult.append(secondInput.text)
            count++
            println(customResult)
            secondInput.text = ""
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if identifier == "seeResult2" {
            if secondInput.text.isEmpty  && count == 0{
                let alert = UIAlertView()
                alert.title = "Imput empty"
                alert.message = "請輸入"
                alert.addButtonWithTitle("OK")
                alert.show()
                
                return false
            }
            else {
                    for i in 0..<count {
                        let random = Int(arc4random_uniform(UInt32(count)))
                        var temp = customResult[random]
                        customResult[random] = customResult[i]
                        customResult[i] = temp
                    }
                    //println(result)
                    return true
            }
        }
        return false
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "seeResult2" {
            var resultPage = segue.destinationViewController as SecondTableViewController
            resultPage.customResult = self.customResult
        }
    }



}

