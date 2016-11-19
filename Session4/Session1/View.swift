//
//  View.swift
//  Session1
//
//  Created by Apple on 11/17/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit

typealias HandleContactType = (View) -> ()

class View : SKSpriteNode {
    var handleContact: HandleContactType!
}
