//
//  FemaleRowViewModel.swift
//  ValarMorghulis
//
//  Created by Aman Gupta on 31/05/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import Foundation

internal struct FemaleRowViewModel: RowViewModelProtocol {
    
    var cellIdentifier: String {
        return String(describing: FemaleTableViewCell.self)
    }
    var personModel: PersonModel?

    init(name: String?, alive: Bool?, image: String?, gender: Gender?) {
        self.personModel = PersonModel(name: name, alive: alive, image: image, gender: gender)
    }
}
