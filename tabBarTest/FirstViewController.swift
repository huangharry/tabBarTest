//
//  FirstViewController.swift
//  tabBarTest
//
//  Created by Harry on 2015/1/7.
//  Copyright (c) 2015年 huangharry. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var firstInput: UITextField!
    var result = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if identifier == "seeResult" {
            if firstInput.text.isEmpty {
                let alert = UIAlertView()
                alert.title = "Imput empty"
                alert.message = "請輸入一個N"
                alert.addButtonWithTitle("OK")
                alert.show()
                
                return false
            }
            else {
                if var N: Int = firstInput.text.toInt()? {
                    result.removeAll(keepCapacity: false)
                    
                    for i in 1...N {
                        result.append(i)
                    }
                    for i in 0..<N {
                        let random = Int(arc4random_uniform(UInt32(N)))
                        
                        var temp = result[random]
                        result[random] = result[i]
                        result[i] = temp
                    }
                    println(result)
                    return true
                }
                else if var N: String = firstInput.text {
                    let alert = UIAlertView()
                    alert.title = "Imput error"
                    alert.message = "請輸入一個N"
                    alert.addButtonWithTitle("OK")
                    alert.show()
                    
                    return false
                }
            }
        }
        return false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "seeResult" {
            var resultPage = segue.destinationViewController as FirstTableViewController
            resultPage.result = self.result
        }
    }


}

