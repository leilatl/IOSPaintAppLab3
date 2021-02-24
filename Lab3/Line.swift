//
//  Line.swift
//  Lab3
//
//  Created by Leila on 2/20/21.
//  Copyright © 2021 Leila. All rights reserved.
//

import Foundation
import UIKit
class Line: Shape{
    private var p1: CGPoint
    private var p2: CGPoint
    private var color: UIColor
    private var stroke_width: CGFloat = 0.0
    init(p1: CGPoint, p2: CGPoint, color: UIColor, stroke_width: CGFloat, isFilled: Bool) {
        self.p1 = p1
        self.p2 = p2
        self.color = color
        self.stroke_width = stroke_width
    }
    override func drawPath(){
        let path = UIBezierPath()
        color.set()
        path.lineWidth = stroke_width
        path.move(to: p1)
        path.addLine(to: p2)
        path.stroke()
        
    }
}
