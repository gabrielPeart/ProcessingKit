//
//  Graphics.swift
//  PxSwift
//
//  Created by AtsuyaSato on 2017/08/09.
//  Copyright © 2017年 Atsuya Sato. All rights reserved.
//

import Foundation

public protocol Graphics {
    func rect(x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat)
    func ellipse(x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat)
    func background(_ color: UIColor)
    
    func fill(_ color: UIColor)
    func stroke(_ color: UIColor)
    func strokeWeight(_ weight: CGFloat)
    func noFill()
    func noStroke()
}

extension PxView: Graphics {
    
    public func rect(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        let g = UIGraphicsGetCurrentContext()
        g?.setFillColor(fill_.cgColor)
        g?.setStrokeColor(stroke_.cgColor)
        g?.setLineWidth(strokeWeight_)
        g?.stroke(CGRect(x: x, y: y, width: width, height: height))
        g?.fill(CGRect(x: x, y: y, width: width, height: height))
    }
    
    public func ellipse(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        let g = UIGraphicsGetCurrentContext()
        g?.setFillColor(fill_.cgColor)
        g?.setStrokeColor(stroke_.cgColor)
        g?.setLineWidth(strokeWeight_)
        
        g?.strokeEllipse(in: CGRect(x: x - width / 2, y: y - height / 2, width: width, height: height))
        g?.fillEllipse(in: CGRect(x: x - width / 2, y: y - height / 2, width: width, height: height))
    }
    
    public func background(_ color: UIColor) {
        let g = UIGraphicsGetCurrentContext()
        g!.clear(self.bounds);
        self.backgroundColor = color
    }
    
    public func fill(_ color: UIColor) {
        self.fill_ = color
    }
    
    public func stroke(_ color: UIColor) {
        self.stroke_ = color
    }
    
    public func strokeWeight(_ weight: CGFloat) {
        self.strokeWeight_ = weight
    }
    
    public func noFill() {
        self.fill_ = UIColor.clear
    }
    
    public func noStroke() {
        self.stroke_ = UIColor.clear
        self.strokeWeight_ = 0.0
    }
}