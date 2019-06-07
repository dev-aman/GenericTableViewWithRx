//
//  ViewModelType.swift
//  ReactiveTableView
//
//  Created by Aman Gupta on 29/05/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import Foundation


/// ViewModelType is used as the base set of rules for ViewModels.
/// inspiration from Tokopedia project.
internal protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
