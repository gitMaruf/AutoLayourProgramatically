//
//  PageCell.swift
//  AutoLayourProgramatically
//
//  Created by Maruf Howlader on 6/26/20.
//  Copyright © 2020 Creative Young. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page : Page? {
        didSet{
            //print("\(page!.image)")
            guard let unrapedPage = page else {return}
            logoImageView.image = UIImage(named: unrapedPage.image)
            let attributedText = NSMutableAttributedString(string: unrapedPage.title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24), NSAttributedString.Key.foregroundColor : UIColor.red ])
            
            attributedText.append(NSMutableAttributedString(string: "\n\n\n \(unrapedPage.description)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.gray]))

         descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    let logoImageView : UIImageView = {
    let myImage = UIImage()
    let imageView = UIImageView(image: myImage)
        imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
    }()
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
    
//        backgroundColor = .yellow
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout(){
       let topImageContainer = UIView()
        //topImageContainer.backgroundColor = .brown
        addSubview(topImageContainer)
        topImageContainer.translatesAutoresizingMaskIntoConstraints = false // enable atuo layout
        topImageContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainer.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        topImageContainer.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        topImageContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImageContainer.addSubview(logoImageView)
        logoImageView.centerXAnchor.constraint(equalTo: topImageContainer.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: topImageContainer.centerYAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: topImageContainer.heightAnchor, multiplier: 0.5).isActive = true
       
        addSubview(descriptionTextView)
       descriptionTextView.topAnchor.constraint(equalTo: topImageContainer.bottomAnchor, constant: 10).isActive = true
       descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
       descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
       descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
}
