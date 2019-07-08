//
//  SecondViewController.swift
//  SalamApp
//
//  Created by Akbar Khan on 24/06/2019.
//  Copyright © 2019 AkbarKhan. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet var countBtn: UIButton!
    @IBOutlet var resetBtn: UIButton!
    @IBOutlet var label: UILabel!
    
    @IBOutlet weak var circularView: ActivityIndicatorCircle!
    @IBOutlet weak var circularView2: ActivityIndicatorCircle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        countBtn.clipsToBounds = true
        countBtn.layer.cornerRadius = 50
        
        label.text = "0"
        circularView.startAnimating(#colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1))
        
    }
    
    @IBAction func countActionBtn(sender: AnyObject) {
        
        
        print("tapped")
        if circularView2.i <= 99 {
            circularView2.bgColor = #colorLiteral(red: 0.4509803922, green: 0.7490196078, blue: 0.2705882353, alpha: 1)
            circularView2.updateCircle()
            label.text = "\(circularView2.i)"
        }
        
    }

    
    @IBAction func resetActionBtn(sender: AnyObject) {
        circularView2.i = 1
        label.text = "0"
        circularView2.endAngle = 0.0
        
        circularView2.shapeLayer.removeFromSuperlayer()
        
        
    }
}
