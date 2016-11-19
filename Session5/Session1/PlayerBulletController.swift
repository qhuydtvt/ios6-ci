//
//  PlayerController.swift
//  Session1
//
//  Created by Apple on 11/10/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit

class PlayerBulletController : Controller {

    let SPEED : CGFloat = 300
    
    init(angle: CGFloat) {
        
        super.init(view: View(texture: PLAYER_BULLET_TEXTURE))
        view.name = "player_bullet"
        
        view.physicsBody = SKPhysicsBody(rectangleOf: self.view.size)
        view.physicsBody?.categoryBitMask = PLAYER_BULLET_MASK
        view.physicsBody?.contactTestBitMask = ENEMY_MASK
        view.physicsBody?.collisionBitMask = 0
        
        let angleInRads = CGFloat(GLKMathDegreesToRadians(Float(angle)))
        
        let vector = CGVector(dx: SPEED * sin(angleInRads), dy: SPEED * cos(angleInRads))
        
        view.physicsBody?.velocity = vector
        
        view.handleContact = {
            otherView in
            
            otherView.removeFromParent()
        }
        
        view.zRotation = -angleInRads
    }
    
    override func config(position: CGPoint, parent: SKNode) {
        super.config(position: position, parent: parent)
//        let moveToTopAction = SKAction.moveToTop (
//            position: position,
//            rect: parent.frame,
//            speed: SPEED)
//        
//        view.run(SKAction.sequence([moveToTopAction, SKAction.removeFromParent()]))
    }
}














