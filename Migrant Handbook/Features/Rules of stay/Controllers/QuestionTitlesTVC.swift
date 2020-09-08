//
//  QuestionTitlesTVC.swift
//  Migrant Handbook
//
//  Created by Mairambek on 9/1/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

class QuestionTitlesTVC: UITableViewController {

    private var frequentlyAskedQuestions = Database.shared.frequentlyAskedQuestions
    
    private var questions: [String] {
        let questions = frequentlyAskedQuestions.map({ $0.question })
        return questions
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupNavigationItem()
    }
    
    private func setupNavigationItem() {
        navigationItem.title = "Часто задаваемые вопросы"
    }

    private func setupTableView() {
        tableView.register(QuestionTitleCell.nib,
                           forCellReuseIdentifier: QuestionTitleCell.identifier)
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9843137255, blue: 0.9921568627, alpha: 1)
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: QuestionTitleCell.self, forIndexPath: indexPath)
        return cell.setupCell(title: questions[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let answerToQuestionVC = AnswersToQuestionsTVC()
        answerToQuestionVC.showGoOverButton = indexPath.row == 0
        answerToQuestionVC.question = frequentlyAskedQuestions[indexPath.row]
        navigationController?.pushViewController(answerToQuestionVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
