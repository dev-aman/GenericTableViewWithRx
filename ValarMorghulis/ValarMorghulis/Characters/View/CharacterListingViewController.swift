//
//  CharacterListingViewController.swift
//  ValarMorghulis
//
//  Created by Aman Gupta on 31/05/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class CharacterListingViewController: UIViewController {

    // MARK:- Instance properties
    
    private let disposeBag = DisposeBag()
    var viewModel = CharacterListingViewModel()

    // MARK:- IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:- overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "GOT"
        self.setupTableView()
        self.bindUI()
    }

}

extension CharacterListingViewController {
    
    func bindUI() {
        
        let dataSource = RxTableViewSectionedReloadDataSource<GenericSectionModelType<RowViewModelProtocol>>(configureCell: { (dataSource, tableView, indexPath, item) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath) as! BaseTableViewCell
            cell.bindUI(withRowViewModel: item)
            return cell
        })
        
        let output = self.viewModel.transform(input: CharacterListingViewModel.Input(getCharacters: Driver.just(())))
        output.characters.drive(self.tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
    }
}


extension CharacterListingViewController {
    
    func setupTableView() {
        self.tableView.register(UINib(nibName: String(describing: MaleTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MaleTableViewCell.self))
        self.tableView.register(UINib(nibName: String(describing: FemaleTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: FemaleTableViewCell.self))
    }
}
