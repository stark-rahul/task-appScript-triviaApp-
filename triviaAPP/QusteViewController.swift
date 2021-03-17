//
//  QusteViewController.swift
//  triviaAPP
//
//  Created by Rahul on 16/03/21.
//

import UIKit

class QusteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    struct Question {
        let text: String
        let answers: [Answer]
    }
    
    struct Answer {
        let text: String
        let correct: Bool  //true or false//
    }
    //2.
    struct Model {
        let name: String
        let isselected: Bool
    }
    
    
    
    var appModels = [Question]()
    var currentQuestion: Question?
    
    @IBOutlet var label: UILabel!
    @IBOutlet var table: UITableView!
    @IBOutlet weak var tblView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        setupQuestions()
        // 0.2
        
        configureUI(question: appModels.first!)
        tblView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tblView.allowsMultipleSelectionDuringEditing = true
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
    
    private func configureUI(question: Question) {
        label.text = question.text
        currentQuestion = question
        table.reloadData()
    }
    private func fetchSelectedAns(answer: Answer, question: Question) -> Bool {
        return question.answers.contains(where: {$0.text == answer.text}) && answer.correct
        
    }
    
    private func setupQuestions(){
        appModels.append(Question(text: "Who is the best cricketer in the world?", answers: [
            Answer(text: "Sachin Tendulkar", correct: true),
            Answer(text: "Virat Kohili", correct: true),
            Answer(text: "Adam Gilchirst", correct: true),
            Answer(text: "Jacques Kallis", correct: true)
            
        ]))
        
        appModels.append(Question(text: "What are the colors in the Indian national flag? Select all:", answers: [
            Answer(text: "White", correct: true),
            Answer(text: "Yellow", correct: true),
            Answer(text: "Green", correct: true),
            Answer(text: "orange", correct: true)
            
        ]))
        
    }
        //table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuestion?.answers.count ?? 0
        
    }
    func tableView(_ tableView: UITableView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
        true
    }
    func tableView(_ tableView: UITableView,
                   didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {
        tblView.setEditing(true, animated: true)
    }
    func tableViewDidEndMultipleSelectionInteraction(_ tableView: UITableView) {
        print("\(#function)")
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = currentQuestion?.answers[indexPath.row].text
        return cell 
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let question = currentQuestion else {
            return
        }
        let answer = question.answers[indexPath.row]
        
        if fetchSelectedAns(answer: answer, question: question) {
            // correct
            if let index = appModels.firstIndex(where: {$0.text == question.text}) {
                if index < (appModels.count-1) {
                    //next question
                    let nextQuestion = appModels[index + 1]
                    print("\(nextQuestion.text)")
                    currentQuestion = nil
                    configureUI(question: nextQuestion)
                    
                }
                else{
                    //end of game return to from start
                    _ = ViewController()
                    return
                }
            }
        }
        else{
            let alert = UIAlertController(title: "fetched", message: "done", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            
        }
    }
    
}


