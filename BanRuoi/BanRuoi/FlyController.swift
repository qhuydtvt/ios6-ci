//
//  FlyController.swift
//  BanRuoi
//
//  Created by Apple on 12/1/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit
class FlyController: Controller {
    
    let SPEED: CGFloat = 400
    var attacking = false
    init() {
        super.init(view: View(texture: Textures.ENEMY1 ))
    }
    
    override func config(position: CGPoint, parent: SKNode) {
        super.config(position: position, parent: parent)
        //configMove()
        configAnimation()
        configShoot()
        configPhysics()
    }
    
    func configPhysics() {
        view.physicsBody = SKPhysicsBody(rectangleOf: view.size)
        view.physicsBody?.categoryBitMask = BitMask.ENEMY
        view.physicsBody?.collisionBitMask = 0
        view.physicsBody?.contactTestBitMask = BitMask.PLAYER_BULLET
        view.handleContact = { other in
            other.removeFromParent()
            
            if let explosion = SKEmitterNode(fileNamed: "explosion.sks") {
                explosion.position = self.view.position
                self.parent.addChild(explosion)
            }
        }
    }
    
    func configShoot() {
        
    }
    
    func attack(destination: CGPoint) {
        self.attacking = true
        let path = UIBezierPath()
        path.move(to: self.view.position)
//        path.addLine(to: PlayerController.instance.view.position.add(x: -50, y: 0))
        path.addQuadCurve(to: destination, controlPoint: parent.frame.center)
        
        let followLine = SKAction.follow(path.cgPath, asOffset: false, orientToPath: true, speed: SPEED)
        let autoReverse = followLine.reversed()
        let flyToPlayer = SKAction.sequence([ followLine, autoReverse, .run { self.attacking = false }])
        view.run((flyToPlayer))
    }
    
    func configAnimation() {
        
        self.view.run(.repeatForever(.animate(with: [Textures.ENEMY1, Textures.ENEMY2], timePerFrame: 0.3)))
        
    }
    
    
}
