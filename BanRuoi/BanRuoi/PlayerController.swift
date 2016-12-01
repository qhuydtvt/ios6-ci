//
//  PlayerController.swift
//  BanRuoi
//
//  Created by Apple on 12/1/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit

class PlayerController: Controller{
    let SPEED:CGFloat=100
    static let instance = PlayerController()
    
    init(){
        super.init(view: View(texture: Textures.PLAYER))
        
    }
    override func config(position: CGPoint, parent: SKNode) {
        super.config(position: position, parent: parent)
        configContraints()
        //configShoot()
        configPhysics()
    }
    
    func configPhysics() {
        view.physicsBody = SKPhysicsBody(rectangleOf: view.size)
        view.physicsBody?.categoryBitMask = BitMask.PLAYER
        view.physicsBody?.collisionBitMask = 0
        view.physicsBody?.contactTestBitMask = BitMask.ENEMY_BULLET | BitMask.ENEMY
        view.handleContact = { other in
            other.removeFromParent()
        }
    }
    
    func configShoot() {
        let shootAction = SKAction.run {
            let playerBullet = PlayerBulletController()
            playerBullet.config(position: self.view.position.add(x: 0, y: self.view.size.height / 2 + playerBullet.view.size.height / 2), parent: self.parent)
        }
        let shootWithDelay = SKAction.sequence([shootAction, .wait(forDuration: 0.5)])
        self.view.run(.repeatForever(shootWithDelay))
    }
    
    func configContraints() ->(){
        let xRange = SKRange(lowerLimit: 0, upperLimit: parent.frame.width)
        let yRange = SKRange(lowerLimit: 0, upperLimit: parent.frame.height)
        view.constraints = [SKConstraint.positionX(xRange,y: yRange)]
        
        
    }
    func moveVector(vector:CGVector){
        
        view.run(.move(by: vector, duration: Double(vector.length()/SPEED)))
    }
    
}
