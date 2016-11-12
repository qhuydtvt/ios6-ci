//
//  PlayerController.swift
//  Session1
//
//  Created by Apple on 11/10/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit

class PlayerBulletController {
    let view : SKSpriteNode = SKSpriteNode(imageNamed: "bullet-single")
    
    let SPEED : CGFloat = 300
    
    init(position : CGPoint, parent: SKNode) {
        // Configure properties
        view.position = position
        view.name = "player_bullet"
        
        // Physics
        view.physicsBody = SKPhysicsBody(rectangleOf: view.size)
        view.physicsBody?.categoryBitMask = PLAYER_BULLET_MASK
        view.physicsBody?.contactTestBitMask = ENEMY_MASK
        view.physicsBody?.collisionBitMask = 0
        
        // Actions
        let moveToTopAction = SKAction.moveToTop (
            position: position,
            rect: parent.frame,
            speed: SPEED)
        
        view.run(SKAction.sequence([moveToTopAction, SKAction.removeFromParent()]))
    }

}














