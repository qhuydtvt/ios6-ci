//
//  GreenEnemyController.swift
//  Session1
//
//  Created by Apple on 11/19/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit

class GreenEnemyController: Controller {
    
    let SPEED : CGFloat = 100
    
    init() {
        super.init(view: View(texture: ENEMY_GREEN_1_TEXTURE, size: ENEMY_GREEN_1_TEXTURE.size()))
    }
    
    override func config(position: CGPoint, parent: SKNode) {
        super.config(position: position, parent: parent)
        
        
        let animate = SKAction.animate(with: ENEMY_GREEN_TEXTURES, timePerFrame: 0.1)
        
        self.view.run(SKAction.repeatForever(animate))
        
        self.view.run(SKAction.sequence([
            SKAction.moveToBottom(position: self.position,
                                  speed: self.SPEED), SKAction.removeFromParent()]))
        
        
        configPhysics()
    }
    
    func configPhysics() -> Void {
        self.view.physicsBody =
            SKPhysicsBody(rectangleOf: self.view.size)
        
        self.view.physicsBody?.categoryBitMask = ENEMY_MASK
        self.view.physicsBody?.contactTestBitMask = PLAYER_BULLET_MASK
        self.view.physicsBody?.collisionBitMask = 0
        
        self.view.handleContact = {
            otherView in
            print("handleContact of Green enemy")
            otherView.removeFromParent()
            let giftController = GiftController()
            giftController.config(position: self.position,
                                  parent: self.parent)
        }
    }
}
