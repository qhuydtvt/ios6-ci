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
    
    init() {
        super.init(view: View(texture: PLAYER_TEXTURE))
    }
    
    override func config(position: CGPoint, parent: SKNode) {
        super.config(position: position, parent: parent)
        self.configContraints()
        self.configShoot()
    }
    
    func configContraints() {
        let xRange = SKRange(lowerLimit: 0, upperLimit: parent.frame.width)
        let yRange = SKRange(lowerLimit: 0, upperLimit: parent.frame.height)
        view.constraints = [SKConstraint.positionX(xRange, y: yRange)]
    }
    
    func configShoot() {
        let shootAction = SKAction.run {
            let bulletController = PlayerBulletController()
            
            let startPosition = CGPoint(x: self.position.x, y: self.position.y + 0.5 * (self.height + bulletController.height))
            
            bulletController.config(position: startPosition, parent: self.parent)
        }
        
        let shootWithDelayAction = SKAction
            .sequence([shootAction, SKAction.wait(forDuration: self.SHOOT_INTERVAL)])
        
        view.run(SKAction.repeatForever(shootWithDelayAction))
    }
    
    func move(vector: CGVector) {
        view.position = view.position.add(vector: vector)
    }
}
