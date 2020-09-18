//
//  AnswerToQuestionCell.swift
//  Migrant Handbook
//
//  Created by Mairambek on 9/1/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

class AnswerToQuestionCell: UITableViewCell {

    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var answerImageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    public func setupCell(question: FAQModel) -> AnswerToQuestionCell {
        let questionImage = AppSettings.currentLanguage == "ru" ? #imageLiteral(resourceName: "title_quastion") : #imageLiteral(resourceName: "title_quastion_kg")
        let answerImage = AppSettings.currentLanguage == "ru" ? #imageLiteral(resourceName: "title_answer") : #imageLiteral(resourceName: "title_answer_kg")
        questionImageView.image = questionImage
        answerImageView.image = answerImage
        questionLabel.text = question.question
        answerLabel.text = question.answer
        
        return self
    }
    
}
