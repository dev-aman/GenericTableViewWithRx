//
//  CharacterDetailsViewModel.swift
//  ValarMorghulis
//
//  Created by Aman Gupta on 07/06/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources


/// This view model will be used to construct view for CharacterDetailsView.
struct CharacterDetailsViewModel: ViewModelType {
    
    // MARK:- Internal properties.
    
    private var person: PersonModel?
    
    
    // MARK:- initializers
    
    init(person: PersonModel?) {
        self.person = person
    }
    
    
    // MARK:- ViewModelType methods and structs.

    internal struct Input {
        internal let loadView: Driver<Void>
    }
    
    internal struct Output {
        internal let data: Driver<PersonModel?>
    }
    
    func transform(input: Input) -> Output {
        let data = input.loadView.flatMap { () -> Driver<PersonModel?> in
            return Driver<PersonModel?>.just(self.person)
        }
        return Output(data: data)
    }
    
}
