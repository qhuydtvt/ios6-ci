//
//  View.swift
//  BanRuoi
//
//  Created by Apple on 12/1/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit
typealias HANDLECONTACT = (View) -> ()
class View: SKSpriteNode{
    var handleContact : HANDLECONTACT?
}
