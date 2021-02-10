//
//  ResultsViewController.swift
//  PersonalQuis
//
//  Created by Pandos on 09.02.2021.
//

import UIKit

class ResultsViewController: UIViewController {

    //MARK: - IBOutlets 
    @IBOutlet weak var EmojiLabel: UILabel!
    @IBOutlet weak var textAnimalLabel: UILabel!
    
    //MARK: - Properties
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        animalChoose()
    }
    
    //MARK: - Private Methods
    
    private func animalChoose() {
        var dictionary = [AnimalType: Int]()
        for item in answers {
            dictionary[item.type] = (dictionary[item.type] ?? 0) + 1
        }
        
        let maxResult = dictionary.max { $0.value > $1.value }
        guard let resultAnimal = maxResult?.key else { return }
        
        updateLabels(withAnimal: resultAnimal)
    }
    
    private func updateLabels(withAnimal: AnimalType) {
        EmojiLabel.text = "Вы - \(withAnimal.rawValue)!"
        textAnimalLabel.text = withAnimal.definition
    }
}

