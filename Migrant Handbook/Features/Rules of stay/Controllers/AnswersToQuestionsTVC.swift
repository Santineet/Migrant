//
//  AnswersToQuestionsTVC.swift
//  Migrant Handbook
//
//  Created by Mairambek on 9/1/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

class AnswersToQuestionsTVC: UITableViewController {

    public var question = FAQModel()
    public var showGoOverButton: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    private func setupTableView() {
        tableView.separatorStyle = .none
        tableView.tableHeaderView = UIView()
        tableView.register(GoOverCell.nib, forCellReuseIdentifier: GoOverCell.identifier)
        tableView.register(AnswerToQuestionCell.nib,
                           forCellReuseIdentifier: AnswerToQuestionCell.identifier)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showGoOverButton ? 2 : 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeue(cellClass: AnswerToQuestionCell.self, forIndexPath: indexPath)
            return cell.setupCell(question: question)
        } else {
            let cell = tableView.dequeue(cellClass: GoOverCell.self, forIndexPath: indexPath)
            return cell.setupCell(delegate: self)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension AnswersToQuestionsTVC: GoOverCellDelegate {
    func goOver() {
        //TODO
    }
}
