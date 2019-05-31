//
//  CharacterResponseModel.swift
//  ValarMorghulis
//
//  Created by Aman Gupta on 31/05/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import Foundation

internal enum Gender: String, Codable {
    case Male
    case Female
}

internal struct CharacterResponseModel: Codable {
    var name: String?
    var alive: Bool?
    var image: String?
    var gender: Gender?
    
    init (name: String, alive: Bool?, image: String?, gender: Gender?) {
        self.name = name
        self.alive = alive
        self.image = image
        self.gender = gender
    }
}
