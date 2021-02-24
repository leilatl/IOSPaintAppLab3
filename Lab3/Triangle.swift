//
//  Triangle.swift
//  Lab3
//
//  Created by Leila on 2/20/21.
//  Copyright © 2021 Leila. All rights reserved.
//

import Foundation
import UIKit
class Triangle:Shape{
    private var p1: CGPoint
    private var p2: CGPoint
    private var color: UIColor
    private var stroke_width: CGFloat = 0.0
    private var isFilled: Bool = false
    init(p1: CGPoint, p2: CGPoint, color: UIColor, stroke_width: CGFloat, isFilled: Bool) {
        self.p1 = p1
        self.p2 = p2
        self.color = color
        self.stroke_width = stroke_width
        self.isFilled = isFilled
    }
    override func drawPath(){
        let path = UIBezierPath()
        color.set()
        path.lineWidth = stroke_width
        
        path.move(to: p1)
        path.addLine(to: CGPoint(x: p1.x,y: p2.y))
        path.addLine(to: p2)
        path.close()
        
        path.stroke()
        (isFilled) ? (path.fill()) : (path.stroke())
    }
}
