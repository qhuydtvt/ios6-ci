//
//  GameScene.swift
//  Session1
//
//  Created by Apple on 11/5/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let playerController = PlayerController()
    
    override func didMove(to view: SKView) {
        addBackground()
        configPhysics()
        
        let playerPosition = CGPoint(
            x: self.size.width / 2,
            y: playerController.height / 2)
        
        playerController.config(position: playerPosition,
                                parent: self)
        
        addEnemies()
    }
    
    func addEnemies() -> Void {
        let enemyController = EnemyController()
        enemyController.config(position: CGPoint(x: self.size.width / 2, y: self.size.height), parent: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let previousLocation = touch.previousLocation(in: self)
            
            let movementVector = CGVector(dx: location.x - previousLocation.x,
                                          dy: location.y - previousLocation.y)
            playerController.move(vector: movementVector)
        }
    }
    
    func configPhysics() {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsWorld.contactDelegate = self
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        guard let viewA = contact.bodyA.node as? View, let viewB = contact.bodyB.node as? View
        else {
            return
        }
        
        viewA.handleContact(viewB)
        viewB.handleContact(viewA)
    }
    
    func addBackground() {
        let background = SKSpriteNode(imageNamed: "background")
        background.anchorPoint = CGPoint.zero
        background.position = CGPoint.zero
        self.addChild(background)
    }
}
