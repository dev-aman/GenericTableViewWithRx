//
//  FemaleTableViewCell.swift
//  ValarMorghulis
//
//  Created by Aman Gupta on 31/05/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import UIKit


/// This view is used as the view for Female cell.
class FemaleTableViewCell: BaseTableViewCell {
    
    // MARK:- IBOutlets
    
    @IBOutlet private weak var displayPictureImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!

    // MARK:- overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func bindUI(withRowViewModel viewModel: RowViewModelProtocol) {
        guard let rowModel = viewModel as? FemaleRowViewModel else {
            return
        }
        self.refreshUI(withRowViewModel: rowModel)
    }
}


// MARK:- Refresh UI methods
extension FemaleTableViewCell {
    
    private func refreshUI(withRowViewModel viewModel: FemaleRowViewModel) {
        self.nameLabel.text = viewModel.personModel?.name
        self.statusLabel.text = viewModel.personModel?.status
        if let imageName = viewModel.personModel?.image {
            self.displayPictureImageView.image = UIImage(named: imageName)
        }
    }
}
