//
//  MaleRowViewModel.swift
//  ValarMorghulis
//
//  Created by Aman Gupta on 31/05/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

internal struct MaleRowViewModel: RowViewModelProtocol {
   
    var cellIdentifier: String {
        return String(describing: MaleTableViewCell.self)
    }
    var personModel: PersonModel?
    let disposeBag: DisposeBag = DisposeBag()
    
    internal var openDetails: PublishRelay<MaleRowViewModel>
    
    init(name: String?, alive: Bool?, image: String?, gender: Gender?, openDetails: PublishRelay<MaleRowViewModel>) {
        
        self.personModel = PersonModel(name: name, alive: alive, image: image, gender: gender)
        self.openDetails = openDetails
    }

}
