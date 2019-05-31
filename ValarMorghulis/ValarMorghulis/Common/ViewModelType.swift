//
//  ViewModelType.swift
//  ReactiveTableView
//
//  Created by Aman Gupta on 29/05/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import Foundation

internal protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
