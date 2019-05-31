//
//  SectionModelTypeErasure.swift
//  ReactiveTableView
//
//  Created by Aman Gupta on 30/05/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import Foundation
import RxDataSources

private class _AnySectionModelTypeBase<Item>: SectionModelType {
    var items: [Item]
    
    init(items: [Item]) {
        guard type(of: self) != _AnySectionModelTypeBase.self else {
            fatalError("_AnyRowBase<Model> instances can not be created; create a subclass instance instead")
        }
        self.items = items
    }
    
    required init(original: _AnySectionModelTypeBase<Item>, items: [Item]) {
        fatalError("_AnyRowBase<Model> instances can not be created; create a subclass instance instead")
    }
}


private final class _AnySectionModelTypeBox<Concrete: SectionModelType>: _AnySectionModelTypeBase<Concrete.Item> {

    var concrete: Concrete?
    
    init(_ concrete: Concrete) {
        self.concrete = concrete
        super.init(items: concrete.items)
    }
    
    required init(original: _AnySectionModelTypeBase<Item>, items: [Item]) {
        fatalError("_AnyCellViewModelBox<Concrete: BaseTableViewCellViewModelProtocol> is not to be implemented")
    }
}

final class GenericSectionModelType<Item>: SectionModelType {

    var items: [Item] {
        return box.items
    }
    
    private var box: _AnySectionModelTypeBase<Item> // Item-> RowViewModelProtocol
    
    // Initializer takes our concrete implementer of SectionModelType
    init<Concrete: SectionModelType>(_ concrete: Concrete) where Concrete.Item == Item {
        box = _AnySectionModelTypeBox(concrete)
    }
    
    required init(original: GenericSectionModelType<Item>, items: [Item]) {
        self.box = original.box
    }
}
