//
//  FemaleRowViewModel.swift
//  ValarMorghulis
//
//  Created by Aman Gupta on 31/05/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import Foundation


/// This view model will be used to construct FemaleTableViewCell
internal struct FemaleRowViewModel: RowViewModelProtocol {

    
    // MARK:- RowViewModelProtocol properties.

    var cellIdentifier: String {
        return String(describing: FemaleTableViewCell.self)
    }
    
    
    // MARK:- instance properties.

    var personModel: PersonModel?

    
    // MARK:- initializers

    init(name: String?, alive: Bool?, image: String?, gender: Gender?) {
        self.personModel = PersonModel(name: name, alive: alive, image: image, gender: gender)
    }
}
