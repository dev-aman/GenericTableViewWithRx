//
//  MaleRowViewModel.swift
//  ValarMorghulis
//
//  Created by Aman Gupta on 31/05/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import Foundation

internal struct MaleRowViewModel: RowViewModelProtocol {
    var cellIdentifier: String {
        return String(describing: MaleTableViewCell.self)
    }
    var name: String?
    var status: String?
    var image: String?
    var gender: String?
    
    init(name: String?, alive: Bool?, image: String?, gender: Gender?) {
        self.name = name
        if let alive = alive {
            self.status = alive ? "Alive" : "Dead"
        }
        self.image = image
        self.gender = gender?.rawValue
    }
}
