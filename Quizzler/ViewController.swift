
//
//  QuestionBank.swift
//  Quizzler
//
//  Created by An Nguyen on 10/4/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestions = QuestionBank()
    var pickAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            pickAnswer = true
        }
        else if sender.tag == 2 {
            pickAnswer = false
        }
        
        checkAnswer()
        
        questionNumber = questionNumber + 1
        
        nextQuestion()
        
        
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "Score : \(score)"
        
        progressLabel.text = "\(questionNumber + 1)/13"
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
        
    }
    

    func nextQuestion() {
        
        if questionNumber <= 12{
            
            
            
            questionLabel.text = allQuestions.list[questionNumber].questionText
            
            updateUI()
            
        }
        else {
            
            let alert = UIAlertController(title: "Great", message: "You've finished all the questions, would you like to start over", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func checkAnswer() {
        
            let correctAnswer = allQuestions.list[questionNumber].answer
            
            if correctAnswer == pickAnswer {
                ProgressHUD.showSuccess("Correct")
                score += 1
            }
            else {
                ProgressHUD.showError("Wrong :(")
            }
    }
    
    
    func startOver() {
        questionNumber = 0
        nextQuestion()
        score = 0
        questionNumber = 0
    }
    

    
}
