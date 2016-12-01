//
//  Utils.swift
//  Session1
//
//  Created by Apple on 11/10/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import Foundation
import SpriteKit

extension CGPoint {
    func add(other: CGPoint) -> CGPoint {
        return CGPoint(x: self.x + other.x, y: self.y + other.y)
    }
    
    func add(x: CGFloat, y: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + x, y: self.y + y)
    }
    
    func add(vector: CGVector) -> CGPoint {
        return CGPoint(x: self.x + vector.dx, y: self.y + vector.dy)
    }
    
    func subtract(other: CGPoint) -> CGVector {
        return CGVector(dx: self.x - other.x, dy: self.y - other.y)
    }
    
    func distance(other: CGPoint) -> CGFloat {
        let dx = self.x - other.x
        let dy = self.y - other.y
        return sqrt(dx * dx + dy * dy)
    }
}

extension CGRect {
    var center : CGPoint
        {
        get {
            return CGPoint(x: self.midX, y: self.midY)
        }
    }
}

extension CGVector {
    func multiply(ratio: CGFloat) -> CGVector {
        return CGVector(dx: self.dx * ratio, dy: self.dy * ratio)
    }
    
    func divide(ratio: CGFloat) -> CGVector {
        return CGVector(dx: self.dx / ratio, dy: self.dy / ratio)
    }
    func length() -> CGFloat{
        return sqrt(self.dx*self.dx+self.dy*self.dy)
    }
}

extension SKAction {
    static func moveToTop(position: CGPoint, rect: CGRect, speed: CGFloat) -> SKAction {
        let distance = rect.height - position.y
        let time = distance / speed
        return SKAction.moveTo(y: rect.height, duration: TimeInterval(time))
    }
    
    static func moveToBottom(position: CGPoint, speed: CGFloat) -> SKAction {
        let distance = position.y
        let time = distance / speed
        return SKAction.moveTo(y: 0, duration: TimeInterval(time))
    }
    
    static func moveToBottomAndRemove(position: CGPoint, speed: CGFloat) -> SKAction {
        return SKAction.sequence([moveToBottom(position: position, speed: speed), SKAction.removeFromParent()])
    }
}
