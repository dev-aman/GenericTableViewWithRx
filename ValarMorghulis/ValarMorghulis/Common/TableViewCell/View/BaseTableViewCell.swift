//
//  BaseTableViewCell.swift
//  ReactiveTableView
//
//  Created by Aman Gupta on 29/05/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import UIKit

// BaseTableViewCell is used as the base class for all the cell that we are making generic.
internal class BaseTableViewCell: UITableViewCell {

    // MARK:- overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /// Bind UI is used to bind view models of type `RowViewModelProtocol` with the generic cells.
    ///
    /// - Parameter viewModel: RowViewModelProtocol
    internal func bindUI(withRowViewModel viewModel: RowViewModelProtocol) {
        
    }
}
