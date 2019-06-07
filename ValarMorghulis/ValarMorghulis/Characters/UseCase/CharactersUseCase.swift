//
//  CharactersUseCase.swift
//  ValarMorghulis
//
//  Created by Aman Gupta on 31/05/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import Foundation
import RxSwift


/// This protocol is used as a set of rules to create CharactersUseCase.
protocol CharactersUseCaseProtocol {
    func getCharacters() -> Observable<[CharacterResponseModel]>
}


/// Characters use case contains business logic related Characters.
class CharactersUseCase: CharactersUseCaseProtocol {
    
    
    func getCharacters() -> Observable<[CharacterResponseModel]> {
        return PublishSubject<[CharacterResponseModel]>.just(getMockedCharacters())
    }
    
    private func getMockedCharacters() -> [CharacterResponseModel] {
        var characters: [CharacterResponseModel] = []
        characters.append(CharacterResponseModel(name: "Daenerys Targaryen", alive: false, image: "dany", gender: .Female))
        characters.append(CharacterResponseModel(name: "Jon Snow", alive: true, image: "jon", gender: .Male))
        characters.append(CharacterResponseModel(name: "Arya Stark", alive: true, image: "arya", gender: .Female))
        characters.append(CharacterResponseModel(name: "Bran", alive: true, image: "bran", gender: .Male))
        characters.append(CharacterResponseModel(name: "Sandor Clegane", alive: false, image: "hound", gender: .Male))
        characters.append(CharacterResponseModel(name: "Cersei Lannister", alive: false, image: "cersie", gender: .Female))
        characters.append(CharacterResponseModel(name: "Jamie Lannister", alive: false, image: "jamie", gender: .Male))
        characters.append(CharacterResponseModel(name: "Sansa Stark", alive: true, image: "sansa", gender: .Female))
        characters.append(CharacterResponseModel(name: "Tyrion Lannister", alive: true, image: "bonna", gender: .Male))
        characters.append(CharacterResponseModel(name: "Melisandre", alive: false, image: "missan", gender: .Female))
        characters.append(CharacterResponseModel(name: "Brienne of Tarth", alive: true, image: "biglady", gender: .Female))
        return characters
    }
}



