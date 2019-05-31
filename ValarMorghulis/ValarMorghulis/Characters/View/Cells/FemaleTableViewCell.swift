//
//  FemaleTableViewCell.swift
//  ValarMorghulis
//
//  Created by Aman Gupta on 31/05/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import UIKit

class FemaleTableViewCell: BaseTableViewCell {
    
    // MARK:- IBOutlets
    @IBOutlet weak var displayPictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!

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
    
    // MARK:- Refresh UI methods
    
    private func refreshUI(withRowViewModel viewModel: FemaleRowViewModel) {
        self.nameLabel.text = viewModel.name
        self.statusLabel.text = viewModel.status
        if let imageName = viewModel.image {
            self.displayPictureImageView.image = UIImage(named: imageName)
        }
    }
}
