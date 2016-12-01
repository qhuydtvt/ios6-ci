//
//  OtherGameScene.swift
//  DemoUnowned
//
//  Created by Apple on 12/1/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit

class OtherGameScene : SKScene {
    override func didMove(to view: SKView) {
        let label = SKLabelNode(text: "Haha")
        label.position = CGPoint(x: 0, y: 0)
        self.addChild(label)
    }
}
