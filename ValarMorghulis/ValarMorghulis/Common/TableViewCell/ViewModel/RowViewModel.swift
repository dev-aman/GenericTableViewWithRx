//
//  RowViewModel.swift
//  ValarMorghulis
//
//  Created by Aman Gupta on 31/05/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import Foundation


/// RowViewModelProtocol is used as the base set of rules for all the generic cell view model.
internal protocol RowViewModelProtocol {
    var cellIdentifier: String { get }
}
