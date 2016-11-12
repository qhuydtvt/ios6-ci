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
    
    func distance(other: CGPoint) -> CGFloat {
        let dx = self.x - other.x
        let dy = self.y - other.y
        return sqrt(dx * dx + dy * dy)
    }
}

extension SKAction {
    static func moveToTop(position: CGPoint, rect: CGRect, speed: CGFloat) -> SKAction {
        let distance = rect.height - position.y
        let time = distance / speed
        return SKAction.moveTo(y: rect.height, duration: TimeInterval(time))
    }
}














