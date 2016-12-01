//
//  PostionHolder.swift
//  DemoUnowned
//
//  Created by Apple on 12/1/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit

class PositionHolder {
    var firstTouchLocation : CGPoint?
    var currentTouchLocation : CGPoint?
    var gameEnd = false
    
    init() {
        
    }
    
    func touchesBegan(location: CGPoint) -> Void {
        
        if self.firstTouchLocation == nil {
            print(">> PositionHolder: touchesBegan")
            self.firstTouchLocation = location
        }
    }
    
    func touchesMoved(location: CGPoint) -> Void {
        print(">> PositionHolder: touchesMoved")
        self.currentTouchLocation = location
    }
    
    func touchesEnded() -> Void {
        print(">> PositionHolder: touchesEnded")
        self.gameEnd = true
        print("Game over")
    }
    
}
