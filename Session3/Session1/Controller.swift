//
//  Controller.swift
//  Session1
//
//  Created by Apple on 11/12/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit

class Controller {
    let view: SKSpriteNode
    
    init(view: SKSpriteNode) {
        self.view = view
    }
    
    func config(position: CGPoint, parent: SKNode) {
        self.view.position = position
        parent.addChild(self.view)
    }
    
    var width : CGFloat {
        get {
            return self.view.size.width
        }
    }
    
    var height : CGFloat {
        get {
            return self.view.size.height
        }
    }
    
    var position : CGPoint {
        get {
            return self.view.position
        }
    }

}
