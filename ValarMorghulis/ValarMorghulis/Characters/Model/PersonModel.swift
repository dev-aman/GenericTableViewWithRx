//
//  PersonModel.swift
//  ValarMorghulis
//
//  Created by Aman Gupta on 07/06/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import Foundation


/// PersonModel used as a Character.
internal struct PersonModel: Codable {
    
    var name: String?
    var status: String?
    var alive: Bool?
    var image: String?
    var gender: String?
    
    init(name: String?, alive: Bool?, image: String?, gender: Gender?) {
        self.name = name
        self.alive = alive
        if let alive = alive {
            self.status = alive ? "Alive" : "Dead"
        }
        self.image = image
        self.gender = gender?.rawValue
    }
}
