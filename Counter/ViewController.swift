//
//  ViewController.swift
//  Counter
//
//  Created by Alex on 21.02.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "0"
        dateStatus.text = "История изменений:\n"
        plusButtonStatus.tintColor = .red
        minusButtonStatus.tintColor = .blue
        resetButtonStatus.tintColor = .systemTeal
        plusButtonStatus.setTitle("Плюс 1", for: .normal)
        minusButtonStatus.setTitle("Минус 1", for: .normal)
        resetButtonStatus.setTitle("Сброс", for: .normal)
        plusButtonStatus.setImage(UIImage(systemName: "plus.rectangle"), for: .normal)
        minusButtonStatus.setImage(UIImage(systemName: "minus.rectangle"), for: .normal)
        resetButtonStatus.setImage(UIImage(systemName: "trash"), for: .normal)
        plusButtonStatus.frame = CGRect(x: 212, y: 509, width: 122, height: 60)
        minusButtonStatus.frame = CGRect(x: 61, y: 509, width: 122, height: 60)
        resetButtonStatus.frame = CGRect(x: 135, y: 577, width: 122, height: 60)
        counterLabel.frame = CGRect(x: 148, y: 416, width: 100, height: 55)
        dateStatus.frame = CGRect(x: 25, y: 83, width: 350, height: 300)
        counterLabel.font = UIFont.systemFont(ofSize: 50.0)
    }
    
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .short
        return formatter
    }()
    
    @IBOutlet weak private var plusButtonStatus: UIButton!
    @IBOutlet weak private var minusButtonStatus: UIButton!
    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var resetButtonStatus: UIButton!
    @IBOutlet weak private var dateStatus: UITextView!
    
    private var counter = 0
    
    @IBAction private func plusButton(_ sender: Any) {
        counter += 1
        counterLabel.text = String(counter)
        dateStatus.insertText("[\(formatter.string(from: Date.now))]: значение изменено на +1\n")
    }
    
    @IBAction private func minusButton(_ sender: Any) {
        if counter == 0 {
            dateStatus.insertText("[\(formatter.string(from: Date.now))]: попытка уменьшить значение счётчика ниже 0\n")
        } else {
            counter -= 1
            counterLabel.text = String(counter)
            dateStatus.insertText("[\(formatter.string(from: Date.now))]: значение изменено на -1\n")
        }
    }
    
    @IBAction private func resetButton(_ sender: Any) {
        if counter != 0 {
            counter = 0
            counterLabel.text = String(counter)
            dateStatus.insertText("[\(formatter.string(from: Date.now))]: значение сброшено\n")
        }
    }
    
}

