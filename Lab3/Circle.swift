//
//  Circle.swift
//  Lab3
//
//  Created by Leila on 2/19/21.
//  Copyright © 2021 Leila. All rights reserved.
//

import Foundation
import UIKit

class Circle: Shape{
    private var radius: CGFloat = 0.0
    private var circle_center: CGPoint
    private var color: UIColor
    private var stroke_width: CGFloat = 0.0
    private var isFilled: Bool
    
    init(p1: CGPoint, p2: CGPoint, color: UIColor, stroke_width: CGFloat, isFilled: Bool) {
        self.radius = sqrt(pow((p2.x-p1.x), 2)+pow((p2.y-p1.y), 2))/2
        self.circle_center = CGPoint(x:(p1.x+p2.x)/2,y:(p1.y+p2.y)/2)
        self.color = color
        self.stroke_width = stroke_width
        self.isFilled = isFilled
    }
    
    override func drawPath(){
        let path = UIBezierPath(arcCenter: circle_center, radius: radius, startAngle: 0, endAngle: 2*Double.pi.cg, clockwise:true)
        path.lineWidth = stroke_width
        color.set()
        (isFilled) ? (path.fill()) : (path.stroke())
       
    }
}
