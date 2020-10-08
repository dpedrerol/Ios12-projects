//
//  FirstViewController.swift
//  06-QuizApp
//
//  Created by Carlos Daniel Pedrerol on 22/09/2020.
//  Copyright © 2020 Carlos Daniel Pedrerol. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!

    
    var questionTopic : [String] = []
    
    
    let factory = QuestionsFactory()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
       // questionTopic = ["naturaleza", "ciencia", "humanidades"]
        
        for top in self.factory.questionsBank.questions {
            questionTopic.append(top.topic)
            
            questionTopic = questionTopic.removingDuplicates()
        
        }
    }
       
    
    // MARK: - Navigation

    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
   
        if segue.identifier == "showQuestionsForTopic" {
            
            let destinationVC = segue.destination as! ViewController
            let idx = self.tableView.indexPathForSelectedRow!.row
            destinationVC.topicQuestion = self.questionTopic[idx]
        }
    
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionTopic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topicCells", for: indexPath)
        
        cell.textLabel?.text = questionTopic[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let qTopic = questionTopic[row]
        print(qTopic)
    }
    
}
extension Array where Element: Hashable {
func removingDuplicates() -> [Element] {
    var addedDict = [Element: Bool]()

    return filter {
        addedDict.updateValue(true, forKey: $0) == nil
    }
    }
}


