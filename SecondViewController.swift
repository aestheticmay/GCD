//
//  SecondViewController.swift
//  GCD
//
//  Created by Майя Калицева on 24.12.2022.
//

import UIKit

final class SecondViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var imageView: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = UIColor.lightGray
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private var imageURL: URL?
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    private let activityIndicator: UIActivityIndicatorView = {
        let ind = UIActivityIndicatorView(style: .large)
        ind.color = UIColor.white
        ind.translatesAutoresizingMaskIntoConstraints = false
        return ind
    }()
    
    // MARK: - Life-Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        fetchData()
    }

    // MARK: - Private Methods
    
    private func setupLayout() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(imageView)
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        imageView.heightAnchor.constraint(equalToConstant: 300),
        
        activityIndicator.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
        activityIndicator.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
        activityIndicator.widthAnchor.constraint(equalToConstant: 40),
        activityIndicator.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func fetchData() {
        self.imageURL = URL(string: "https://loveincorporated.blob.core.windows.net/contentimages/gallery/6a985aaa-8a95-4382-97a9-91cdf96f43d3-Moraine_Lake_Dennis_Frates_Alamy_Stock_Photo.jpg")
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            guard let url = self.imageURL, let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
        }
    }
}
