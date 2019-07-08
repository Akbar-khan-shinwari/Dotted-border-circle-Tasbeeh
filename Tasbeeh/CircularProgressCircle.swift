//
//  CircularProgressCircle.swift
//  Doctors365
//
//  Created by Akbar Khan on 01/07/2019.
//  Copyright © 2019 AkbarKhan. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable class ActivityIndicatorCircle: UIView {
    
    // pi/π = 3.14159265358979
    var  timerInterval: Double = 0.1
    var timer : Timer?
    var endAngle: CGFloat = 0.0
    var angleStep = CGFloat.pi / 20.0
    let angleOffset = -CGFloat.pi / 2.0
    
    var shapeLayer = CAShapeLayer()
    var bgColor : UIColor!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func startAnimating(_ color: UIColor) {
        //superview?.bringSubviewToFront(self)
        self.bgColor = color
        layer.cornerRadius = frame.width / 2
        self.clipsToBounds = true
        
        isHidden = false
        timer?.invalidate()
        timer = nil
        
        timer = Timer.scheduledTimer(timeInterval: 0.00001,
                                     target: self,
                                     selector: #selector(self.updateCircle),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    func stopAnimating() {
        //  isHidden = true
        timer?.invalidate()
        timer = nil
    }
    
    var i = 1
    // endAngle -= CGFloat.pi * 1.48
    // pi = 3.1428571429
    // pi*2 = 6.2857142858
    @objc func updateCircle() {
        endAngle += angleStep
        print(endAngle)
        if endAngle > CGFloat.pi * 2.0 {
            // here we subtract 6.2857142858 from endAngle or we can say that here we are reseting engAngle
            endAngle -= CGFloat.pi * 2.0
        }
        
        if self.endAngle == 0.9424777960769379 {
         self.endAngle = 1.0995574287564276
        }
        if self.endAngle == 1.7278759594743862{
            self.endAngle = 1.8849555921538759
        }
        if self.endAngle == 2.5132741228718345 {
            self.endAngle = 2.670353755551324
        }
        if self.endAngle == 3.4557519189487724{
            self.endAngle = 3.612831551628262
        }
        if self.endAngle == 4.39822971502571{
            self.endAngle = 4.5553093477052
        }
        if self.endAngle == 5.183627878423159{
            self.endAngle = 5.340707511102648
        }

        if self.endAngle == 6.126105674500097{
            endAngle = 6.283185307179586
        }
        
        DispatchQueue.main.async {
            self.shapeLayer.removeFromSuperlayer() // remove the previous version
            
            let lineWidth: CGFloat = 18
            let radius = self.bounds.size.width / 2.0 // if the view is square, this gives us center as well
            
            
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: radius,y: radius), radius: radius - (lineWidth - 8), startAngle: self.angleOffset, endAngle: self.endAngle + self.angleOffset, clockwise: true)
            print("angel After Adding",self.endAngle + self.angleOffset)
            self.shapeLayer.path = circlePath.cgPath
            self.shapeLayer.position = CGPoint(x: 0, y: 0)
            
            self.shapeLayer.lineWidth = lineWidth
            self.shapeLayer.lineCap = CAShapeLayerLineCap.round
            let one : NSNumber = 0.07
            let two : NSNumber = 22.80
            self.shapeLayer.lineDashPattern = [one, two]
            self.shapeLayer.strokeColor = self.bgColor.cgColor
            self.shapeLayer.fillColor = UIColor.clear.cgColor
            
            self.layer.addSublayer(self.shapeLayer)
            print(self.endAngle)
            print("Steps",self.angleStep)
           // if self.i == 5 {
             //   self.i += 2
            //}
            self.i += 1
            print("count",self.i)
            //6.283185307179586
            if self.endAngle == 6.283185307179586{
                self.stopAnimating()
            }
        }
    }
}

/*
class activityCircle : UIViewController{
    @IBOutlet weak var circularView: ActivityIndicatorCircle!
    @IBOutlet weak var circularView2: ActivityIndicatorCircle!
    @IBOutlet weak var countLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        circularView.startAnimating(.gray)
        
    }
    
    @IBAction func tappedCircle(_ sender: UIButton) {
        print("tapped")
        circularView2.bgColor = .red
        circularView2.updateCircle()
        countLabel.text = "Counts: \(circularView2.i)"
    }
}
*/
