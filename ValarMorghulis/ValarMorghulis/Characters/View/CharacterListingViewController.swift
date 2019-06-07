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
    
    var selectedPersonTrigger: PublishSubject<IndexPath>?
        
    // MARK:- IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK:- overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "GOT"
        self.setupTableView()
        self.bindUI()
    }
    
    deinit {
        print("CharacterListingViewController deinit")
    }

}

extension CharacterListingViewController {
    
    private func bindUI() {
        let dataSource = RxTableViewSectionedReloadDataSource<GenericSectionModelType<RowViewModelProtocol>>(configureCell: { (dataSource, tableView, indexPath, item) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath) as! BaseTableViewCell
            cell.bindUI(withRowViewModel: item)
            return cell
        })
        selectedPersonTrigger = PublishSubject<IndexPath>.init()
        
        guard let selectedPersonDriver = selectedPersonTrigger?.asDriver(onErrorDriveWith: Driver.empty()) else { return }
        let output = self.viewModel.transform(input: CharacterListingViewModel.Input(getCharacters: Driver.just(()), selectedPerson: selectedPersonDriver))
        output.characters.drive(self.tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)

        output.openDetails.drive(onNext: { [weak self] (model) in
            self?.openDetailsPage(forPerson: model.personModel)
        }).disposed(by: disposeBag)
        
        output.openFemaleDetails.drive(onNext: { [weak self] (model) in
            self?.openDetailsPage(forPerson: model.personModel)
        }).disposed(by: disposeBag)
    }
}

extension CharacterListingViewController {
    
    private func openDetailsPage(forPerson person: PersonModel?) {
        let charaterViewController = CharacterDetailsViewController.init(nibName: String(describing: CharacterDetailsViewController.self), bundle: nil)
        let detailsViewModel = CharacterDetailsViewModel(person: person)
        charaterViewController.viewModel = detailsViewModel
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(charaterViewController, animated: true)
        }
    }
}


extension CharacterListingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedPersonTrigger?.onNext(indexPath)
    }
    
    private func setupTableView() {
        self.tableView.rx.setDelegate(self).disposed(by: disposeBag)
        self.tableView.register(UINib(nibName: String(describing: MaleTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MaleTableViewCell.self))
        self.tableView.register(UINib(nibName: String(describing: FemaleTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: FemaleTableViewCell.self))
    }
}
