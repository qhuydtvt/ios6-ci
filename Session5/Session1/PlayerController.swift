//
//  PlayerController.swift
//  Session1
//
//  Created by Apple on 11/12/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit

class PlayerController: Controller {
    
    let SHOOT_INTERVAL = 0.3
    let SHOOT_ACTION_KEY = "ShootAction"
    
    static let instance = PlayerController()
    var shootAction : SKAction?
    
    private init() {
        super.init(view: View(texture: PLAYER_TEXTURE))
    }
    
    override func config(position: CGPoint, parent: SKNode) {
        super.config(position: position, parent: parent)
        self.configContraints()
        self.configShoot(powerUp: false)
        self.configPhysics()
    }
    
    func configPhysics() -> Void {
        self.view.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.view.physicsBody?.categoryBitMask = PLAYER_MASK
        self.view.physicsBody?.contactTestBitMask = GIFT_MASK | ENEMY_BULLET_MASK
        self.view.physicsBody?.collisionBitMask = 0
        
        self.view.handleContact = {
            otherView in
            otherView.removeFromParent()
        }
        
        self.view.handlePowerup = {
            print("Handle power up")
            self.configShoot(powerUp: true)
        }
    }
    
    func configContraints() {
        let xRange = SKRange(lowerLimit: 0, upperLimit: parent.frame.width)
        let yRange = SKRange(lowerLimit: 0, upperLimit: parent.frame.height)
        view.constraints = [SKConstraint.positionX(xRange, y: yRange)]
    }
    
    func configShoot(powerUp: Bool) {
        
        view.removeAction(forKey: SHOOT_ACTION_KEY)
        
        if powerUp {
            shootAction = SKAction.run {
                let bulletController = PlayerBulletController(angle: 0)
                let bulletController1 = PlayerBulletController(angle: 30)
                let bulletController2 = PlayerBulletController(angle: -30)
                
                let startPosition = CGPoint(x: self.position.x, y: self.position.y + 0.5 * (self.height + bulletController.height))
                
                bulletController.config(position: startPosition, parent: self.parent)
                bulletController1.config(position: startPosition, parent: self.parent)
                bulletController2.config(position: startPosition, parent: self.parent)
            }
        }
        else {
            shootAction = SKAction.run {
                let bulletController = PlayerBulletController(angle: 0)
                
                let startPosition = CGPoint(x: self.position.x, y: self.position.y + 0.5 * (self.height + bulletController.height))
                
                bulletController.config(position: startPosition, parent: self.parent)
            }
        }
        
        let shootWithDelayAction = SKAction
            .sequence([shootAction!, SKAction.wait(forDuration: self.SHOOT_INTERVAL)])
        
        view.run(SKAction.repeatForever(shootWithDelayAction), withKey: SHOOT_ACTION_KEY)
    }
    
    func move(vector: CGVector) {
        view.position = view.position.add(vector: vector)
    }
}
