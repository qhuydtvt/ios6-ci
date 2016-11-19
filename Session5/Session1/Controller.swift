//
//  Controller.swift
//  Session1
//
//  Created by Apple on 11/12/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import SpriteKit

class Controller {
    
    let view: View
    var parent: SKNode!
    
    init(view: View) {
        self.view = view
    }
    
    func config(position: CGPoint, parent: SKNode) {
        self.view.position = position
        self.parent = parent
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
    
    var size : CGSize {
        get {
            return self.view.size
        }
    }
    
    var position : CGPoint {
        get {
            return self.view.position
        }
    }

}
