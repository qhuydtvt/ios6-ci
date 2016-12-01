//
//  Foo.swift
//  DemoUnowned
//
//  Created by Apple on 12/1/16.
//  Copyright © 2016 TechKids. All rights reserved.
//



class Foo {
    
    var myClosure : (() -> ())!
    var name = "OK"
    
    init() {
        print("Foo inited")
    }
    
    func test() {
        myClosure = {
            [unowned self] in
            self.name = "YES"
        }
    }
    
    deinit {
        print("Foo deinited")
    }
}
