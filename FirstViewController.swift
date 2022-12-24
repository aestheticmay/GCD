//
//  FirstViewController.swift
//  GCD
//
//  Created by Майя Калицева on 24.12.2022.
//

import UIKit

class FirstViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Go to image page", for: .normal)
        button.backgroundColor = UIColor.systemMint
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onButtonTap(_:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life-Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    // MARK: - Private Methods
    
    private func setupLayout() {
        view.backgroundColor = UIColor.white
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func onButtonTap(_ sender: UIButton) {
        let secondViewController = SecondViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}

