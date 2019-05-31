//
//  BaseTableViewCell.swift
//  ReactiveTableView
//
//  Created by Aman Gupta on 29/05/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bindUI(withRowViewModel viewModel: RowViewModelProtocol) {
        
    }
}
