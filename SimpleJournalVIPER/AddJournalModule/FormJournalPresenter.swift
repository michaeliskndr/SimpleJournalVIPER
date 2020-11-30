//
//  AddJournalPresenter.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 13/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

final class FormJournalPresenter: FormJournalPresenterProtocol {
    
    var interactor: FormJournalInteractorProtocol?
    
    var router: FormJournalRouterProtocol?
    
    var reload: (() -> ())?
    
    var cells: [JournalCellPresenter] = []
    var cellBuilder: CellBuilder = CellBuilder()
    
    private var titleCellPresenter: JournalCellPresenter?
    private var detailCellPresenter: JournalCellPresenter?
    private var dateCellPresenter: JournalCellPresenter?
    private var moodCellPresenter: JournalCellPresenter?

    var numberOfRows: Int {
        return cells.count
    }
    
    func viewWillAppear() {
        setupCell()
    }
    
    func cellForRow(at indexPath: IndexPath) -> JournalCellPresenter {
        cells[indexPath.row]
    }
    
    func updateText(_ text: String, at indexPath: IndexPath) {
        let cellPresenter = cells[indexPath.row]
        cellPresenter.updateText(text)
    }
    
    //TODO: ADD JOURNAL CAPABILIITES NOT YET IMPLEMENTED
    func didAddJournal(from view: UIViewController) {
        guard let title = titleCellPresenter?.subtitle, let detail = detailCellPresenter?.subtitle, let date = dateCellPresenter?.date, let mood = moodCellPresenter?.happiness else {
            print("Empty JournalItem Data")
            return
        }
        let item = JournalItem(title: title, date: date, detail: detail, mood: .init(happiness: mood, mood: .init(value: mood)))
        interactor?.addJournal(item)
        router?.goBackToMainViewController(from: view)
    }
    
}

extension FormJournalPresenter {
    
    func setupCell() {
        guard let reload = reload else {
            fatalError("Reload function not yet existed")
        }
        
        titleCellPresenter = cellBuilder.makeJournalCellPresenter(cellType: .title)
        detailCellPresenter = cellBuilder.makeJournalCellPresenter(cellType: .detail)
        dateCellPresenter = cellBuilder.makeJournalCellPresenter(cellType: .date)
        moodCellPresenter = cellBuilder.makeJournalCellPresenter(cellType: .mood)
        
        guard let titleCell = titleCellPresenter, let detailCell = detailCellPresenter, let dateCell = dateCellPresenter, let moodCell = moodCellPresenter else {
            return
        }
        
        cells = [
            titleCell, detailCell, moodCell, dateCell
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
                    subtitle: "",
                    placeholder: "Describe your title here!",
                    type: .title
                )
        case .detail:
            return
                JournalCellPresenter(
                    title: "What's exactly happening today?",
                    subtitle: "",
                    placeholder: "Describe what's happening here!",
                    type: .detail
                )
        case .date:
            return
                JournalCellPresenter(
                    title: "Today's Date",
                    subtitle: "",
                    placeholder: "",
                    type: .date
                )
        case .mood:
            return
                JournalCellPresenter(
                    title: "Quantify your happiness!",
                    subtitle: "",
                    placeholder: "",
                    type: .mood
                )
        }
    }
}
