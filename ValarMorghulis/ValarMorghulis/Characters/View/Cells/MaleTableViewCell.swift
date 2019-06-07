//
//  MaleTableViewCell.swift
//  ValarMorghulis
//
//  Created by Aman Gupta on 31/05/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import UIKit
import RxSwift

class MaleTableViewCell: BaseTableViewCell {

    let disposeBag: DisposeBag = DisposeBag()
    
    // MARK:- IBOutlets
    @IBOutlet private weak var displayPictureImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var openDetails: UIButton!
    
    // MARK:- overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func bindUI(withRowViewModel viewModel: RowViewModelProtocol) {
        guard let rowModel = viewModel as? MaleRowViewModel else {
            return
        }
        self.refreshUI(withRowViewModel: rowModel)
        self.openDetails.rx.tap.asDriver().drive(onNext: { [rowModel] () in
            print("Rx tap on cell next")
            rowModel.openDetails.accept(rowModel)
        }).disposed(by: disposeBag)
    }
        
    // MARK:- Refresh UI methods
    
    private func refreshUI(withRowViewModel viewModel: MaleRowViewModel) {
        self.nameLabel.text = viewModel.personModel?.name
        self.statusLabel.text = viewModel.personModel?.status
        if let imageName = viewModel.personModel?.image {
            self.displayPictureImageView.image = UIImage(named: imageName)
        }
    }
}
