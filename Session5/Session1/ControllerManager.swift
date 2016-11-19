//
//  ControllerManager.swift
//  Session1
//
//  Created by Apple on 11/19/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit

class ControllerManager {
    
    let SPAWN_DURATION : Double = 1
    
    static let instance = ControllerManager()
    
    private init() {
        
    }
    
    func config(parent: SKNode) -> Void {
        let spawnEnemy = SKAction.run {
            let enemyController = GreenEnemyController()
            enemyController.config(position: parent.frame.topMiddle, parent: parent)
        }
        
        let spawnEnemyWithDelay = SKAction.sequence([spawnEnemy, SKAction.wait(forDuration: SPAWN_DURATION)])
        
        parent.run(SKAction.repeatForever(spawnEnemyWithDelay))
    }
}

extension CGRect {
    var topMiddle : CGPoint {
        get {
            return CGPoint(x: self.midX, y: self.height)
        }
    }
}
