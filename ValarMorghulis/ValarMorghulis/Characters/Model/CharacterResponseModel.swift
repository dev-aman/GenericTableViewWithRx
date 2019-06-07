//
//  CharacterResponseModel.swift
//  ValarMorghulis
//
//  Created by Aman Gupta on 31/05/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import Foundation

// This enum is used to provide type for Gender for the characters.
internal enum Gender: String, Codable {
    case Male
    case Female
}

/// This model is used as a response model for Characters.
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
