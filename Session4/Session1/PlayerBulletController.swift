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
    
    init() {
        super.init(view: View(texture: PLAYER_BULLET_TEXTURE))
        view.name = "player_bullet"
        
        view.physicsBody = SKPhysicsBody(texture: PLAYER_BULLET_TEXTURE, size: view.size)
        view.physicsBody?.categoryBitMask = PLAYER_BULLET_MASK
        view.physicsBody?.contactTestBitMask = ENEMY_MASK
        view.physicsBody?.collisionBitMask = 0
        
        view.handleContact = {
            otherView in
//            self.view.removeFromParent()
        }
    }
    
    override func config(position: CGPoint, parent: SKNode) {
        super.config(position: position, parent: parent)
        let moveToTopAction = SKAction.moveToTop (
            position: position,
            rect: parent.frame,
            speed: SPEED)
        
        view.run(SKAction.sequence([moveToTopAction, SKAction.removeFromParent()]))
    }
}














