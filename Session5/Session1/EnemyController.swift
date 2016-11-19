//
//  EnemyController.swift
//  Session1
//
//  Created by Apple on 11/12/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit

class EnemyController: Controller {
    let SPEED : CGFloat = 100
    let SHOOT_INTERVAL : Double = 1
    var hp = 10
    
    init() {
        super.init(view: View(texture: ENEMY_TEXTURE))
    }
    
    override func config(position: CGPoint, parent: SKNode) {
        super.config(position: position, parent: parent)
        configMove()
        configShoot()
        configPhysics()
    }
    
    func configPhysics() -> Void {
        view.physicsBody = SKPhysicsBody(texture: ENEMY_TEXTURE, size: ENEMY_TEXTURE.size())
        view.physicsBody?.categoryBitMask = ENEMY_MASK
        view.physicsBody?.contactTestBitMask = PLAYER_BULLET_MASK
        view.physicsBody?.collisionBitMask = 0
        
        view.handleContact = {
            otherView in
            
            otherView.removeFromParent()
            
            self.hp -= 1
            if self.hp <= 0 {
                self.view.removeFromParent()
            }
        }
    }
    
    func configMove() {
        let moveToBottomAction = SKAction.moveToBottom(position: self.position, speed: SPEED)
        
        self.view.run(SKAction.sequence([moveToBottomAction, SKAction.removeFromParent()]))
    }
    
    func configShoot() -> Void {
        let shootAction = SKAction.run {
            let enemyBulletController = EnemyBulletController()
            let startPosition = CGPoint(x: self.position.x, y: self.position.y - (self.height + enemyBulletController.height) / 2)
            enemyBulletController.config(position: startPosition, parent: self.parent)
        }
        
        let shootWithDelayAction = SKAction.sequence([shootAction, SKAction.wait(forDuration: self.SHOOT_INTERVAL
            )])
        
        self.view.run(SKAction.repeatForever(shootWithDelayAction))
    }
}
