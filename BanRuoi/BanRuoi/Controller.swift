//
//  Controller.swift
//  BanRuoi
//
//  Created by Apple on 12/1/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit
class Controller{
    var view : View
    weak var parent: SKNode!
    init(view:View) {
        self.view = view
    }
    func config(position:CGPoint, parent:SKNode){
        view.position = position
        self.parent = parent
        parent.addChild(view)
    }
}

