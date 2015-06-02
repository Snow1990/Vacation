//
//  Place.swift
//  Vacation
//
//  Created by SN on 15/5/18.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import Foundation

class Place {
    var name = ""
    var visited = false
    init(){}
    init(name:String){
        self.name = name
    }
    init(name:String,visited:Bool){
        self.name = name
        self.visited = visited
    }
}