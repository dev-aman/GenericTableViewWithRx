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


/// This view model will be used to construct MaleTableViewCell
internal struct MaleRowViewModel: RowViewModelProtocol {
   
    
    // MARK:- RowViewModelProtocol properties.
    
    var cellIdentifier: String {
        return String(describing: MaleTableViewCell.self)
    }
    
    
    // MARK:- instance properties.
    
    var personModel: PersonModel?
    let disposeBag: DisposeBag = DisposeBag()
    
    
    // MARK:- Event subscribers
    
    internal var openDetails: PublishRelay<MaleRowViewModel>
    
    
    // MARK:- initializers
    
    init(name: String?, alive: Bool?, image: String?, gender: Gender?, openDetails: PublishRelay<MaleRowViewModel>) {
        
        self.personModel = PersonModel(name: name, alive: alive, image: image, gender: gender)
        self.openDetails = openDetails
    }

}
