//
//  PlayerBulletController.swift
//  BanRuoi
//
//  Created by Apple on 12/1/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit

class PlayerBulletController: Controller {
    let SPEED: CGFloat = 200
    
    init() {
        super.init(view: View(texture: Textures.PLAYER_BULLET))
        configPhysics()
    }
    
    override func config(position: CGPoint, parent: SKNode) {
        super.config(position: position, parent: parent)
        let moveToTop = SKAction.moveToTop(position: self.view.position, rect: parent.frame, speed: SPEED)
        view.run(.sequence([moveToTop, .removeFromParent()]))
    }
    
    func configPhysics() {
        view.physicsBody = SKPhysicsBody(rectangleOf: view.size)
        view.physicsBody?.categoryBitMask = BitMask.PLAYER_BULLET
        view.physicsBody?.collisionBitMask = 0
        view.physicsBody?.contactTestBitMask = BitMask.ENEMY
        view.handleContact = { other in
            other.removeFromParent()
        }

    }
}
