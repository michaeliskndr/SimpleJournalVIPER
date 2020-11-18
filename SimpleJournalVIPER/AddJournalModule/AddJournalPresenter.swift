//
//  AddJournalPresenter.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 13/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import Foundation

final class AddJournalPresenter: AddJournalPresenterProtocol {
    
    var interactor: AddJournalInteractorProtocol?
    
    var router: AddJournalRouterProtocol?
    
    var reload: (() -> ())?
    
    var cells: [JournalCellPresenter] = []
    var cellBuilder: CellBuilder = CellBuilder()

    var numberOfRows: Int {
        return cells.count
    }
    
    func viewWillAppear() {
        setupCell()
    }
    
    func cellForRow(at indexPath: IndexPath) -> JournalCellPresenter {
        cells[indexPath.row]
    }
    
    
}

extension AddJournalPresenter {
    
    func setupCell() {
        guard let reload = reload else {
            fatalError("Reload function not yet existed")
        }
        
        let titleCell = cellBuilder.makeJournalCellPresenter(cellType: .title)
        let detailCell = cellBuilder.makeJournalCellPresenter(cellType: .detail)
        let dateCell = cellBuilder.makeJournalCellPresenter(cellType: .date)
        
        cells = [
            titleCell, detailCell, dateCell
        ]
        reload()
    }
}

struct CellBuilder {
    
    func makeJournalCellPresenter(cellType: JournalCellPresenter.FormType) -> JournalCellPresenter {
        switch cellType {
        case .title:
            return
                JournalCellPresenter(
                    title: "What's your title of the day?",
                    titlePlaceholder: "Describe your title here!",
                    type: .title
                )
        case .detail:
            return
                JournalCellPresenter(
                    title: "What's exactly happening today?",
                    titlePlaceholder: "Describe what's happening here!",
                    type: .detail
                )
        case .date:
            return
                JournalCellPresenter(
                    title: "Today's Date",
                    titlePlaceholder: "",
                    type: .date
                )
        }
    }
}
