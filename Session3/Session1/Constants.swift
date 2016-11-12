//
//  Constants.swift
//  Session1
//
//  Created by Apple on 11/10/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit

let PLAYER_MASK         = UInt32(1 << 0)
let PLAYER_BULLET_MASK  = UInt32(1 << 1)
let ENEMY_MASK          = UInt32(1 << 2)
let ENEMY_BULLET_MASK   = UInt32(1 << 3)

let PLAYER_BULLET_TEXTURE = SKTexture(imageNamed: "bullet-single")
let ENEMY_BULLET_TEXTURE = SKTexture(imageNamed: "bullet-round")
