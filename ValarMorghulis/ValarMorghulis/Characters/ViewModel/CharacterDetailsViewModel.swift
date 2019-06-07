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

struct CharacterDetailsViewModel: ViewModelType {
    
    private var person: PersonModel?

    internal struct Input {
        internal let loadView: Driver<Void>
    }
    
    internal struct Output {
        internal let data: Driver<PersonModel?>
    }
    
    init(person: PersonModel?) {
        self.person = person
    }
    
    func transform(input: Input) -> Output {
        let data = input.loadView.flatMap { () -> Driver<PersonModel?> in
            return Driver<PersonModel?>.just(self.person)
        }
        return Output(data: data)
    }
    
}
