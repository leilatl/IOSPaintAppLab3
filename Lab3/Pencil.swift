//
//  Pencil.swift
//  Lab3
//
//  Created by Leila on 2/20/21.
//  Copyright © 2021 Leila. All rights reserved.
//

import Foundation
import UIKit
class Pencil: Shape{
    private var points: [CGPoint]
    private var p1: CGPoint
    private var color: UIColor
    private var stroke_width: CGFloat = 0.0
    init(points: [CGPoint], p1: CGPoint, color: UIColor, stroke_width: CGFloat) {
        self.points = points
        self.p1 = p1
        self.color = color
        self.stroke_width = stroke_width
    }
    override func drawPath(){
        let path = UIBezierPath()
        color.set()
        path.lineWidth = stroke_width
        path.move(to: p1)
        for point in points{
            path.addLine(to: point)
        }
        
        path.stroke()
        
    }
}
