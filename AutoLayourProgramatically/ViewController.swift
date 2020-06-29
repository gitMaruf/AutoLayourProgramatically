//
//  ViewController.swift
//  AutoLayourProgramatically
//
//  Created by Maruf Howlader on 6/21/20.
//  Copyright © 2020 Creative Young. All rights reserved.
//

import UIKit
extension UIColor{
    static var mainPink = UIColor.init(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}
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
        let attributedText = NSMutableAttributedString(string: "TOM & JERRY", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36), NSAttributedString.Key.foregroundColor: UIColor.brown])
        attributedText.append(NSMutableAttributedString(string: "\n\n\nWelcome to Tom and Jerry kids game. Here you can play your favourite eposode as games", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
        //textView.text = "TOM & JERRY"
        //textView.font = UIFont.boldSystemFont(ofSize: 30)
        //textView.textColor = .orange
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        //let pinkColor: UIColor = UIColor.init(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        button.setTitleColor(.mainPink, for: .normal)
        //button.backgroundColor = .brown
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 5
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    let nextButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("NEXT", for: .normal)
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        //let pinkColor: UIColor = UIColor.init(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        button.setTitleColor(.mainPink, for: .normal)
           //button.backgroundColor = .brown
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //view.backgroundColor = .yellow
        //view.addSubview(logoImageView)
        view.addSubview(descriptionTextView)
        setupLayout()
        setupBottomControls()
        print("ViewController")
    }
    fileprivate func setupBottomControls(){
        //view.addSubview(previousButton)
//        let yellowView = UIView()
//        yellowView.backgroundColor = .yellow
//        let greenView = UIView()
//        greenView.backgroundColor = .green
//        let blueView = UIView()
//        blueView.backgroundColor = .blue
        
        let bottomControlStackView: UIStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlStackView.distribution = .fillEqually
       // bottomControlStackView.axis = NSLayoutConstraint.Axis.vertical  //Click on the axis left hand side You will get UI Stack view propertise, on highlighted axis: NSLayoutConstraint.Axis, click on Axis you will get the enum case horizontal and vertical, according to last property you may used . propertise to access the enum value say .horizontal
        view.addSubview(bottomControlStackView)
        
        NSLayoutConstraint.activate([
        bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        bottomControlStackView.heightAnchor.constraint(equalToConstant: 60)
            
         /*
            previousButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            previousButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            previousButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            previousButton.heightAnchor.constraint(equalToConstant: 60)
        */
        ])
    }
    private func setupLayout(){
       let topImageContainer = UIView()
        //topImageContainer.backgroundColor = .brown
        view.addSubview(topImageContainer)
        topImageContainer.translatesAutoresizingMaskIntoConstraints = false // enable atuo layout
        topImageContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainer.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topImageContainer.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topImageContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topImageContainer.addSubview(logoImageView)
        logoImageView.centerXAnchor.constraint(equalTo: topImageContainer.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: topImageContainer.centerYAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: topImageContainer.heightAnchor, multiplier: 0.5).isActive = true
        
        /*
        //imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200
        //This enable auto layout for our mageView programmatically
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        */
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainer.bottomAnchor, constant: 10).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        //Add upper containter like div
        
        
        
        
        
        
    }
}

