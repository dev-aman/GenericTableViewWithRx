//
//  CharacterDetailsViewController.swift
//  ValarMorghulis
//
//  Created by Aman Gupta on 06/06/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CharacterDetailsViewController: UIViewController {
    
    // MARK:- Instance properties
    
    private let disposeBag = DisposeBag()
    var viewModel: CharacterDetailsViewModel?

    // MARK:- IBOutlets
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK:- overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Character Details"
        self.bindUI()
    }
    
}

extension CharacterDetailsViewController {
    
    private func bindUI() {
        let output = self.viewModel?.transform(input: CharacterDetailsViewModel.Input(loadView: Driver<Void>.just(())))
        output?.data.drive(onNext: { [weak self] (person) in
            self?.refreshUI(withPersonModel: person)
        }).disposed(by: disposeBag)
    }
    
    private func refreshUI(withPersonModel person: PersonModel?) {
        if let imageName = person?.image {
            self.imageView.image = UIImage(named: imageName)
        }
        self.nameLabel.text = person?.name
        if let alive = person?.alive {
            self.view.backgroundColor = alive ? .green : .red
        }
    }
}
