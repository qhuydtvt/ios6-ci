//
//  GiftController.swift
//  Session1
//
//  Created by Apple on 11/19/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit

class GiftController: Controller {
    
    let SPEED : CGFloat = 100
    
    init() {
        super.init(view: View(imageNamed: "power-up"))
    }
    
    override func config(position: CGPoint, parent: SKNode) {
        super.config(position: position, parent: parent)
        self.view.run(SKAction.moveToBottomAndRemove(position:position, speed: SPEED))
        
        configPhysics()
    }
    
    func configPhysics() -> Void {
        self.view.physicsBody = SKPhysicsBody(rectangleOf: self.view.size)
        
        self.view.physicsBody?.categoryBitMask = GIFT_MASK
        self.view.physicsBody?.contactTestBitMask = PLAYER_MASK
        self.view.physicsBody?.collisionBitMask = 0
        
        self.view.handleContact = {
            otherView in
            print("Contacted")
            if otherView.physicsBody?.categoryBitMask == PLAYER_MASK {
                print("Contacted with player")
                otherView.handlePowerup?()
            }
            
        }
    }
}
