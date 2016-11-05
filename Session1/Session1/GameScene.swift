//
//  GameScene.swift
//  Session1
//
//  Created by Apple on 11/5/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let player = SKSpriteNode(imageNamed: "plane")
    
    let PLAYER_SPEED = 150.0
    let BULLET_SPEED = 300.0
    
    override func didMove(to view: SKView) {
        addBackground()
        addPlayer()
        print("FRAME: \(self.view?.frame)")
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
        let bullet = SKSpriteNode(imageNamed: "bullet-single")
        bullet.position = CGPoint(x: player.position.x, y:
            player.position.y + (bullet.size.height + player.size.height) / 2)
        let moveToRoof = SKAction.moveTo(
            y: self.size.height, duration:
            Double(self.size.height - bullet.position.y) / BULLET_SPEED
            )
        bullet.run(moveToRoof)
        self.addChild(bullet)
    }
    
    func addBackground() {
        let background = SKSpriteNode(imageNamed: "background")
        background.anchorPoint = CGPoint.zero
        background.position = CGPoint.zero
        self.addChild(background)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan: count = \(touches.count)")
        
        // Unwraping, nil = null (java)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let previousLocation = touch.previousLocation(in: self)
            
            let vector = CGVector(dx: location.x - previousLocation.x, dy: location.y - previousLocation.y)
            
            SKAction.removeFromParent()
            
            let move = SKAction.move(by: vector, duration: 0.5)
            player.run(move)
            
//            //            player.position = location
//            
//            let dx = location.x - player.position.x
//            let dy = location.y - player.position.y
//            let distance = sqrt(dx * dx + dy * dy)
//            let time = Double(distance) / PLAYER_SPEED
//            
//            let move = SKAction.move(to: location, duration: time)
//            player.run(move)
//            
            print("location = \(location)")
        }
    }
}
