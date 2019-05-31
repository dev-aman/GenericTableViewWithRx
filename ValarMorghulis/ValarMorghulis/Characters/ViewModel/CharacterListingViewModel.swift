//
//  CharacterListingViewModel.swift
//  ValarMorghulis
//
//  Created by Aman Gupta on 31/05/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

struct CharacterListingViewModel: ViewModelType {
    
    private let useCase = CharactersUseCase()
    
    internal struct Input {
        public let getCharacters: Driver<Void>
    }
    
    internal struct Output {
        internal let characters: Driver<[GenericSectionModelType<RowViewModelProtocol>]>
    }
    
    func transform(input: Input) -> Output {
        
        let res: Driver<[GenericSectionModelType<RowViewModelProtocol>]> = input.getCharacters.flatMapLatest { [useCase] () -> Driver<[CharacterResponseModel]> in
                return useCase.getCharacters().asDriver(onErrorJustReturn: [])
            }.map { (characters) -> [GenericSectionModelType<RowViewModelProtocol>] in
                return self.processCharaterResponse(characters: characters)
            }
        return Output(characters: res)
    }
    
    private func processCharaterResponse(characters: [CharacterResponseModel]) -> [GenericSectionModelType<RowViewModelProtocol>] {
        let items = characters.map { (character) -> RowViewModelProtocol in
            guard character.gender == Gender.Male else {
                return FemaleRowViewModel(name: character.name, alive: character.alive, image: character.image, gender: character.gender)
            }
            return MaleRowViewModel(name: character.name, alive: character.alive, image: character.image, gender: character.gender)
        }
        return [GenericSectionModelType<RowViewModelProtocol>(SectionViewModel(header: "", items: items))]
    }
}

