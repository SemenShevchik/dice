//
//  ViewController.swift
//  lessonOne
//
//  Created by Семен Шевчик on 06.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI
    
    private let backGroundImageView = UIImageView(nameImage: "GreenBackground")
    
    private let logoView = UIImageView(nameImage: "DiceeLogo")
    
    private let firstDice = UIImageView(nameImage: "DiceOne")
    private let secondtDice = UIImageView(nameImage: "DiceTwo")
    
    private lazy var buttonRoll: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("Roll", for: .normal)
        element.layer.cornerRadius = 20
        element.titleLabel?.font = .boldSystemFont(ofSize: 50)
        element.tintColor = .white
        element.backgroundColor = UIColor(red: 142/255, green: 41/255, blue: 38/255, alpha: 1)
        element.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    let imageList = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
    
    // MARK: - Life Cycle
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstrains()
        
    }
    
    @objc private func buttonTapped() {
        
        firstDice.image = UIImage(named: imageList.randomElement()!)
        secondtDice.image = UIImage(named: imageList.randomElement()!)
        
    }
}

// MARK: - Set Views and Constraints
extension ViewController {
    
    private func setupViews() {
        view.addSubview(backGroundImageView)
        view.addSubview(logoView)
        view.addSubview(firstDice)
        view.addSubview(secondtDice)
        view.addSubview(buttonRoll)
    }
    
    private func setupConstrains() {
        
        NSLayoutConstraint.activate([
            
            backGroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backGroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backGroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backGroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            logoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            firstDice.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            firstDice.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            firstDice.widthAnchor.constraint(equalToConstant: 100),
            firstDice.heightAnchor.constraint(equalToConstant: 100),
            
            secondtDice.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            secondtDice.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            secondtDice.widthAnchor.constraint(equalToConstant: 100),
            secondtDice.heightAnchor.constraint(equalToConstant: 100),
            
            buttonRoll.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonRoll.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            buttonRoll.widthAnchor.constraint(equalToConstant: 200),
            buttonRoll.heightAnchor.constraint(equalToConstant: 100)
            
        ])
        
    }
}

extension UIImageView {
    convenience init(nameImage: String) {
        self.init()
        self.image = UIImage(named: nameImage)
        self.contentMode = .scaleToFill
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
