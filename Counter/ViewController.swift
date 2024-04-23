//
//  ViewController.swift
//  Counter
//
//  Created by Evgeniy Kuzin on 22.04.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private var counter: Int = 0
    private var counterLabelText: String {
        "Значение счетчика: \(counter)"
    }
    
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var historyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = counterLabelText
    }
    
    private func updateLabelText() {
        counterLabel.text = counterLabelText
    }
    
    private func addToTextField(someDescription: String) {
        historyTextView.text += "\n" + Date().formatted() + someDescription
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.tag == 1 && counter > 0 {
            counter -= 1
            addToTextField(someDescription: " : значение изменено на -1")
        } else if sender.tag == 1 && counter == 0 {
            addToTextField(someDescription: " : попытка уменьшить значение счётчика ниже 0")
        } else if sender.tag == 2 {
            counter += 1
            addToTextField(someDescription: " : значение изменено на +1")
        } else if sender.tag == 0 && counter > 0 {
            counter = 0
            addToTextField(someDescription: " : значение сброшено")
        }
        updateLabelText()
    }
}
