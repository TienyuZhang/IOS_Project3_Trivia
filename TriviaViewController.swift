//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Tienyu Zhang on 3/12/25.


import UIKit

class TriviaViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    // These are the buttons for options A, B, C, D
    @IBOutlet weak var optionA: UIButton!
    
    @IBOutlet weak var optionB: UIButton!
    
    @IBOutlet weak var optionC: UIButton!
    
    @IBOutlet weak var optionD: UIButton!
    
    
    // Define questions and answers
    let questions = [
        ("Which color do you prefer?", ["Red", "Yellow", "Green", "Blue"]),
        ("Which season do you prefer?", ["Spring", "Summer", "Fall", "Winter"]),
        ("Which direction do you like?", ["East", "West", "South", "North"])
    ]
    
    // Variable to keep track of current question index
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load the first question when the view loads
        loadQuestion()
    }
    
    // Function to load the current question and options
    func loadQuestion() {
        // Check if there are more questions to show
        guard currentQuestionIndex < questions.count else {
            // If no more questions, show a completion alert
            let alert = UIAlertController(title: "Quiz Complete", message: "You have answered all the questions.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        let currentQuestion = questions[currentQuestionIndex]
        questionLabel.text = currentQuestion.0
        
        // Set the options for the buttons
        optionA.setTitle(currentQuestion.1[0], for: .normal)
        optionB.setTitle(currentQuestion.1[1], for: .normal)
        optionC.setTitle(currentQuestion.1[2], for: .normal)
        optionD.setTitle(currentQuestion.1[3], for: .normal)
        
        // Re-enable the buttons in case the user has previously completed a question
        enableButtons()
    }
    
    func disableButtons() {
        optionA.isEnabled = false
        optionB.isEnabled = false
        optionC.isEnabled = false
        optionD.isEnabled = false
    }
    
    func enableButtons() {
        optionA.isEnabled = true
        optionB.isEnabled = true
        optionC.isEnabled = true
        optionD.isEnabled = true
    }
    
    // Button action for selecting an option
    @IBAction func optionTapped(_ sender: UIButton) {
        // Disable the buttons to prevent re-tapping
        disableButtons()
        
        // Increment the question index to load the next question
        currentQuestionIndex += 1
        
        // Load the next question (or show completion if all questions are answered)
        loadQuestion()
    }
}
