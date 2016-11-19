//
//  EnemyBulletController.swift
//  Session1
//
//  Created by Apple on 11/12/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit

class EnemyBulletController : Controller {
    
    let SPEED : CGFloat = 150
    
    init() {
        super.init(view: View(texture: ENEMY_BULLET_TEXTURE))
        
        view.physicsBody = SKPhysicsBody(texture: ENEMY_BULLET_TEXTURE, size: view.size)
        view.physicsBody?.categoryBitMask = ENEMY_BULLET_MASK
        view.physicsBody?.contactTestBitMask = PLAYER_MASK
        view.physicsBody?.collisionBitMask = 0
    }
    
    override func config(position: CGPoint, parent: SKNode) {
        super.config(position: position, parent: parent)
        
        let moveToBottom = SKAction.moveToBottom(position: view.position, speed: SPEED)
        
        self.view.run(moveToBottom)
    }
}
