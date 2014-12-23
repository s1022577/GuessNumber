//
//  ViewController.swift
//  gm
//
//  Created by Joanna on 2014/12/10.
//  Copyright (c) 2014年 ClassroomM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var zero: UIButton!
    
    @IBOutlet weak var aOutput: UILabel!
    @IBOutlet weak var bOutput: UILabel!
    @IBOutlet weak var record: UIButton!
    @IBOutlet weak var restart: UIButton!
    @IBOutlet weak var result: UILabel!
   
    @IBOutlet weak var answer: UILabel!
    var tempStr = ""
    var ans = [Int]()
    var ansPrint = [0, 0, 0, 0]
    var userInput = [Int]()
    var count = 0
    var a = 0
    var b = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func restart(sender: AnyObject) {
            self.setUp()
    }
    
    @IBAction func oneTouch(sender: AnyObject) {
        one.enabled = false
        detect("1")
    }
    
    @IBAction func twoTouch(sender: AnyObject) {
        two.enabled = false
        detect("2")
    }
    
    @IBAction func threeTouch(sender: AnyObject) {
        three.enabled = false
        detect("3")
    }
    
    @IBAction func fourTouch(sender: AnyObject) {
        four.enabled = false
        detect("4")
    }
    
    @IBAction func fiveTouch(sender: AnyObject) {
        five.enabled = false
        detect("5")
    }
    
    @IBAction func sixTouch(sender: AnyObject) {
        six.enabled = false
        detect("6")
    }
    
    @IBAction func sevenTouch(sender: AnyObject) {
        seven.enabled = false
        detect("7")
    }
    
    @IBAction func eightTouch(sender: AnyObject) {
        eight.enabled = false
        detect("8")
    }
    
    @IBAction func nineTouch(sender: AnyObject) {
        nine.enabled = false
        detect("9")
    }
    
    @IBAction func zeroTouch(sender: AnyObject) {
        zero.enabled = false
        detect("0")
    }
    
    func detect(touchWatch: String){
        if count < 4 {
            count++
            tempStr += touchWatch
            result.text = tempStr
        }

        if  count == 4 {
            //userAns = Array(tempStr)
            for c in tempStr {
                userInput.append(String(c).toInt()!)
            }
            for i in 0...3 {
                for j in 0...3 {
                    if ans[i] == userInput[j] {
                        if i == j {
                            println("a++")
                            a++
                        }
                        b++
                        println("b++")
                    }
                }
            }
            b = b-a
            aOutput.text = String(a)
            bOutput.text = String(b)
            self.reset()
            println(userInput)
        }
    }
    
    func setUp() {
        for i in 0...9 {
            ans.append(i)
        }
        for i in 0...9 {
            let random = Int(arc4random_uniform(UInt32(10)))
            var tepm = ans[random]
            ans[random] = ans[i]
            ans[i] = tepm
        }
        for d in 0...3 {
            ansPrint[d] = ans[d]
            println(ansPrint[d])
        }
        answer.text = "\(ansPrint)"
    }
    
    func reset() {
        one.enabled = true
        two.enabled = true
        three.enabled = true
        four.enabled = true
        five.enabled = true
        six.enabled = true
        seven.enabled = true
        eight.enabled = true
        nine.enabled = true
        zero.enabled = true
        count = 0
        tempStr = ""
        a = 0
        b = 0
        userInput.removeAll(keepCapacity: false)
    }
    
}

