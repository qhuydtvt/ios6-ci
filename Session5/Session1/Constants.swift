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
let GIFT_MASK           = UInt32(1 << 4)

let PLAYER_BULLET_TEXTURE = SKTexture(imageNamed: "bullet-single")
let ENEMY_BULLET_TEXTURE = SKTexture(imageNamed: "bullet-round")

let PLAYER_TEXTURE = SKTexture(imageNamed: "plane")
let ENEMY_TEXTURE = SKTexture(imageNamed: "plane1")

let ENEMY_GREEN_1_TEXTURE = SKTexture(imageNamed: "enemy-green-1")
let ENEMY_GREEN_2_TEXTURE = SKTexture(imageNamed: "enemy-green-2")
let ENEMY_GREEN_3_TEXTURE = SKTexture(imageNamed: "enemy-green-3")

let ENEMY_GREEN_TEXTURES = [ENEMY_GREEN_1_TEXTURE,ENEMY_GREEN_2_TEXTURE,ENEMY_GREEN_3_TEXTURE]
