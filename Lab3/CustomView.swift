//
//  CustomView.swift
//  Lab3
//
//  Created by Leila on 2/18/21.
//  Copyright © 2021 Leila. All rights reserved.
//

import UIKit

class CustomView: UIView {
    var point1: CGPoint?
    var point2: CGPoint!
    var color: UIColor = .red
    var shape: String = "r"
    var pencilPoints = [CGPoint]()
    var shapes = [Shape]()

    @IBAction func redBtn(_ sender: Any) {
        color = .red
    }
    
    @IBAction func yellBtn(_ sender: Any) {
        color = .yellow
    }
    
    
    @IBAction func geenBtn(_ sender: Any) {
        color = .green
    }
    
    @IBAction func blueBtn(_ sender: Any) {
        color = .blue
    }
    
    
    @IBAction func rectBtn(_ sender: Any) {
        shape = "r"
    }
    
    @IBAction func circleBtn(_ sender: Any) {
        shape = "c"
    }
    @IBAction func lineBtn(_ sender: Any) {
        shape = "l"
    }
    @IBAction func triBtn(_ sender: Any) {
        shape = "t"
    }
    
    @IBAction func penBtn(_ sender: Any) {
        shape = "p"
    }
    
    @IBAction func returnBtn(_ sender: Any) {
        shapes.removeLast()
        for shape in shapes{
            shape.drawPath()
        }
        //setNeedsDisplay()
    }
    
    @IBOutlet weak var mySwitch: UISwitch!
    override func draw(_ rect: CGRect) {
    
        if shape == "r"{
            if let p1 = point1{
                let rect = Rectangle(p1: p1, p2: point2, color: color, stroke_width: 3, isFilled: mySwitch.isOn)
                shapes.append(rect)
            }
        }else if shape == "c"{
            if let p1 = point1{
                let circle = Circle(p1: p1, p2: point2, color: color, stroke_width: 3, isFilled: mySwitch.isOn)
                shapes.append(circle)
            }
        }else if shape == "l"{
            if let p1 = point1{
                let line = Line(p1: p1, p2: point2, color: color, stroke_width: 3, isFilled: mySwitch.isOn)
                shapes.append(line)
            }
        }else if shape == "t"{
            if let p1 = point1{
                let tri = Triangle(p1: p1, p2: point2, color: color, stroke_width: 3, isFilled: mySwitch.isOn)
                shapes.append(tri)
                
            }
        }else if shape == "p"{
            
            if let p1 = point1{
                let pen = Pencil(points: pencilPoints, p1: p1, color: color, stroke_width: 3)
                shapes.append(pen)
            }
        }
        
        for shape in shapes{
            shape.drawPath()
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        pencilPoints.removeAll()
        if let touch = touches.first{
            point1 = touch.location(in: self)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if shape == "p"{
            if let touch = touches.first{
                let location = touch.location(in: self)
                pencilPoints.append(location)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            point2 = touch.location(in: self)
        }
        
        setNeedsDisplay()
    }
    

}
extension Double{
    var cg: CGFloat{
        return CGFloat(self)
    }
}
