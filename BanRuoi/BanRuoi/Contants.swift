//
//  Contants.swift
//  BanRuoi
//
//  Created by Apple on 12/1/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit

struct Textures {
    static let PLAYER = SKTexture(imageNamed: "player-1")
    static let ENEMY1 = SKTexture(imageNamed: "fly-1-1")
    static let ENEMY2 = SKTexture(imageNamed: "fly-1-2")
    static let PLAYER_BULLET = SKTexture(imageNamed: "bullet-1")
    static let ENEMY_BULLET = SKTexture(imageNamed: "bullet-2")
}
struct BitMask{
    static let PLAYER = UInt32(1 << 0)
    static let ENEMY = UInt32(1 << 1)
    static let PLAYER_BULLET = UInt32(1 << 2)
    static let ENEMY_BULLET = UInt32(1 << 3)
}
