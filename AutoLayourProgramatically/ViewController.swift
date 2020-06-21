//
//  ViewController.swift
//  AutoLayourProgramatically
//
//  Created by Maruf Howlader on 6/21/20.
//  Copyright © 2020 Creative Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
// let's void polluting viewDidLoad, {} is a clouser, or anon. function, last () use to call the clouser
    let logoImageView : UIImageView = {
    let myImage = UIImage(named: "tom")
    let imageView = UIImageView(image: myImage)
        imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
    }()
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "TOM & JERRY"
        textView.font = UIFont.boldSystemFont(ofSize: 30)
        textView.textAlignment = .center
        textView.textColor = .orange
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //view.backgroundColor = .yellow
        view.addSubview(logoImageView)
        view.addSubview(descriptionTextView)
        setupLayout()
    }
    
    private func setupLayout(){
        //imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200
        //This enable auto layout for our mageView programmatically
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 100).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
}

