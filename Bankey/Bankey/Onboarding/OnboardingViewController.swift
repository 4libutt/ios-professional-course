//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Ali Butt on 09/12/2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let stackview = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()
    
    let heroImageName: String
    let titleText: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        
    }
    
    init(heroImageName: String, titleText: String) {
        self.heroImageName = heroImageName
        self.titleText = titleText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension OnboardingViewController {
    
    private func style() {
        view.backgroundColor = .systemBackground
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing = 20
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: heroImageName)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = titleText
        
    }
    
    private func layout() {
        
        stackview.addArrangedSubview(imageView)
        stackview.addArrangedSubview(label)
        
        view.addSubview(stackview)
        
        NSLayoutConstraint.activate([
            stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackview.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackview.trailingAnchor, multiplier: 1)
        ])
        
    }
}
