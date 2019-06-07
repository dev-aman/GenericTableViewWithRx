//
//  SectionViewModel.swift
//  ValarMorghulis
//
//  Created by Aman Gupta on 31/05/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import Foundation
import RxDataSources


/// SectionViewModel is used as a generic Section view model
/// where there is provision to assign header model to a Codable type
internal struct SectionViewModel {
    
    var header: Codable?
    var items: [Item]
}


// MARK: - this mextension is used to conform to SectionModelType.
/// SectionModelType belongs to RxDataSource
extension SectionViewModel: SectionModelType {
    typealias Item = RowViewModelProtocol
    
    init(original: SectionViewModel, items: [Item]) {
        self = original
        self.items = items
    }
}
