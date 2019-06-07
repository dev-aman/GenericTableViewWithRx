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


/// This view model ius responsible to construct the CharacterListingView.
struct CharacterListingViewModel: ViewModelType {
    
    // MARK:- Internal properties
    
    private let useCase = CharactersUseCase()
    
    // MARK:- ViewModelType methods and structs.
    
    internal struct Input {
        public let getCharacters: Driver<Void>
        public let selectedPerson: Driver<IndexPath>
    }
    
    internal struct Output {
        internal let characters: Driver<[GenericSectionModelType<RowViewModelProtocol>]>
        internal let openDetails: Driver<MaleRowViewModel>
        internal let openFemaleDetails: Driver<FemaleRowViewModel>
    }
    
    func transform(input: Input) -> Output {
        
        let openDetails = PublishRelay<MaleRowViewModel>.init()
        let openDetailsDriver: Driver<MaleRowViewModel> = openDetails.asDriver(onErrorDriveWith: Driver<MaleRowViewModel>.empty())

        let characterDriver: Driver<[GenericSectionModelType<RowViewModelProtocol>]> = input.getCharacters.flatMapLatest { [useCase] () -> Driver<[CharacterResponseModel]> in
                return useCase.getCharacters().asDriver(onErrorJustReturn: [])
            }.map { (characters) -> [GenericSectionModelType<RowViewModelProtocol>] in
                return self.processCharaterResponse(characters: characters, openDetailsPublishRelay: openDetails)
            }

        let openFemaleDetailsDriver: Driver<FemaleRowViewModel> = input.selectedPerson.flatMap { [characterDriver] (indexPath) -> Driver<FemaleRowViewModel> in
            return characterDriver.map({ (sections) -> RowViewModelProtocol in
                return sections[indexPath.section].items[indexPath.row]
            }).filter({ (rowViewModel) -> Bool in
                guard let _ = rowViewModel as? FemaleRowViewModel else { return false }
                return true
            }).map({ (viewModel) -> FemaleRowViewModel in
                return viewModel as! FemaleRowViewModel
            })
        }
        
        return Output(characters: characterDriver, openDetails: openDetailsDriver, openFemaleDetails: openFemaleDetailsDriver)
    }
    
    
    /// This method is used to process the Characters received from the use case
    /// and generate the section model array
    /// to construct datasource for the table view
    ///
    /// - Parameters:
    ///   - characters: [CharacterResponseModel], characters received from the use case
    ///   - openDetailsPublishRelay: PublishRelay<MaleRowViewModel>, this observer will be assigned to MaleRowViewModel to get the events from Cell to View controllers view model.
    /// - Returns: [GenericSectionModelType<RowViewModelProtocol>]
    private func processCharaterResponse(characters: [CharacterResponseModel], openDetailsPublishRelay: PublishRelay<MaleRowViewModel>) -> [GenericSectionModelType<RowViewModelProtocol>] {
        let items = characters.map { (character) -> RowViewModelProtocol in
            guard character.gender == Gender.Male else {
                return FemaleRowViewModel(name: character.name, alive: character.alive, image: character.image, gender: character.gender)
            }
            return MaleRowViewModel(name: character.name, alive: character.alive, image: character.image, gender: character.gender, openDetails: openDetailsPublishRelay)
        }
        return [GenericSectionModelType<RowViewModelProtocol>(SectionViewModel(header: "", items: items))]
    }
}

