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
    
    let player = SKSpriteNode(imageNamed: "plane")
    
    let PLAYER_SPEED = 150.0
    let BULLET_SPEED = 300.0
    let ENEMY_BULLET_SPEED = 150.0
    
    override func didMove(to view: SKView) {
        addBackground()
        addPlayer()
        addEnemies()
        configPhysics()
        print("FRAME: \(self.view?.frame)")
    }
    
    func configPhysics() {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        self.physicsWorld.contactDelegate = self
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        
        print("\(nodeA?.name), \(nodeB?.name)")
        
        // 0100 | 0010 => 0110
        // 0010 | 0100 => 0110
        
        if (contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask)
            == (ENEMY_MASK | PLAYER_BULLET_MASK) {
            // Enemy vs Player Bullet
            nodeA?.removeFromParent()
            nodeB?.removeFromParent()
        }
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        
    }
    
    func addEnemies() {
        let enemy = SKSpriteNode(imageNamed: "plane1")
        enemy.name = "enemy"
        enemy.position = CGPoint(x: self.size.width / 2,
                                 y: self.size.height)
        
        enemy.physicsBody = SKPhysicsBody(rectangleOf: enemy.size)
        enemy.physicsBody?.categoryBitMask = ENEMY_MASK
        enemy.physicsBody?.contactTestBitMask = PLAYER_BULLET_MASK
        enemy.physicsBody?.collisionBitMask = 0
        
        // Fly
        let flyAction = SKAction.moveTo(y: 0, duration: 3)
        let flyAndRemoveAction = SKAction.sequence([flyAction, SKAction.removeFromParent()])
        
        // Shot
        let shotAction = SKAction.run {
            // Add bullet
            let bullet = SKSpriteNode(imageNamed: "bullet-round")
            bullet.position = enemy.position.add(
                x: 0,
                y: -(enemy.size.height + bullet.size.height)/2)
            
            let flyToBottom = SKAction.moveTo(y: 0, duration: Double(self.size.height - bullet.position.y) / self.ENEMY_BULLET_SPEED)
            
            bullet.run(SKAction.sequence([flyToBottom, SKAction.removeFromParent()]))
            
            self.addChild(bullet)
        }
        
        enemy.run(flyAndRemoveAction)
        enemy.run(
            SKAction.repeatForever(
                SKAction.sequence([shotAction, SKAction.wait(forDuration: 1)])
            )
        )
        
        self.addChild(enemy)
    }
    
    func addPlayer() {
        player.position = CGPoint(x: self.size.width / 2, y: player.size.height / 2)
        
        let shootAction = SKAction.run(addBullet)
        
        let shootActionWithDelay = SKAction.sequence([shootAction, SKAction.wait(forDuration: 0.3)])
        
        let shootActionForever = SKAction.repeatForever(shootActionWithDelay)
        
        player.run(shootActionForever)
        
        self.addChild(player)
    }
    
    func addBullet() {
//        let bullet = SKSpriteNode(imageNamed: "bullet-single")
//        bullet.name = "bullet"
//        bullet.position = CGPoint(x: player.position.x, y:
//            player.position.y + (bullet.size.height + player.size.height) / 2)
//        
//        
//        bullet.physicsBody = SKPhysicsBody(rectangleOf: bullet.size)
//        bullet.physicsBody?.categoryBitMask = PLAYER_BULLET_MASK
//        bullet.physicsBody?.contactTestBitMask = ENEMY_MASK
//        bullet.physicsBody?.collisionBitMask = 0
//        
//        let moveToRoof = SKAction.moveTo(
//            y: self.size.height, duration:
//            Double(self.size.height - bullet.position.y) / BULLET_SPEED
//        )
//        
//        
//        bullet.run(SKAction.sequence([moveToRoof, SKAction.removeFromParent()]))
        
        let bulletController = PlayerBulletController(player: player, parent: self)
    
        
        self.addChild(bulletController.view)
        
    }
    
    func addBackground() {
        let background = SKSpriteNode(imageNamed: "background")
        background.anchorPoint = CGPoint.zero
        background.position = CGPoint.zero
        self.addChild(background)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan: count = \(touches.count)")
        
    }
    
    func move(point: CGPoint, vector: CGVector) -> CGPoint {
        return CGPoint(x: point.x + vector.dx, y: point.y + vector.dy)
    }
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let previousLocation = touch.previousLocation(in: self)
            
            let vector = CGVector(dx: location.x - previousLocation.x, dy: location.y - previousLocation.y)
            
            var nextPosition = self.move(point: player.position, vector: vector)
            
            if nextPosition.x > self.size.width {
                nextPosition.x = self.size.width
            }
            
            if nextPosition.x < 0 {
                nextPosition.x = 0
            }
            
            if nextPosition.y > self.size.height {
                nextPosition.y = self.size.height
            }
            
            if nextPosition.y < 0 {
                nextPosition.y = self.size.height
            }
            
            let move = SKAction.move(to: nextPosition, duration: 0.01)
            
            player.run(move)
            //
            print("location = \(location)")
        }
    }
}
