//
//  SectionViewModel.swift
//  ValarMorghulis
//
//  Created by Aman Gupta on 31/05/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import Foundation
import RxDataSources

internal struct SectionViewModel {
    
    var header: Codable?
    var items: [Item]
}

extension SectionViewModel: SectionModelType {
    typealias Item = RowViewModelProtocol
    
    init(original: SectionViewModel, items: [Item]) {
        self = original
        self.items = items
    }
}
