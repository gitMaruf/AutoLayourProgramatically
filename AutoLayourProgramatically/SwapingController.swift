//
//  SwapingController.swift
//  AutoLayourProgramatically
//
//  Created by Maruf Howlader on 6/23/20.
//  Copyright © 2020 Creative Young. All rights reserved.
//

import UIKit

class SwapingController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
   
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            if self.pageControl.currentPage == 0{
                self.collectionView.contentOffset.x = .zero
            }else{
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }) { (_) in
            
        }
    }
    var pages: [Page] = [
        Page(image: "Artboard 1", title: "TOM AND JERRY 1", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
         Page(image: "Artboard 2", title: "TOM AND JERRY 2", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
          Page(image: "Artboard 2 copy", title: "TOM AND JERRY 3", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
           Page(image: "Artboard 2 copy 2", title: "TOM AND JERRY 4", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
            Page(image: "Artboard 2 copy 3", title: "TOM AND JERRY 5", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
    ]
    
   // let imagesAre = ["Artboard 1", "Artboard 2 copy 2", "Artboard 2 copy 2", "Artboard 2 copy 2", "Artboard 2"]
    
   let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 5 //pages.count
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        //let pinkColor: UIColor = UIColor.init(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        button.setTitleColor(.mainPink, for: .normal)
        //button.backgroundColor = .brown
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
   @objc private func handlePrev(){
          
          let currentPage = max(pageControl.currentPage - 1, 0)
          let indexPath = IndexPath(item: currentPage, section: 0)
          collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
          pageControl.currentPage = currentPage
          print("handleNext", currentPage)
      }
    let nextButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("NEXT", for: .normal)
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        //let pinkColor: UIColor = UIColor.init(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        button.setTitleColor(.mainPink, for: .normal)
           //button.backgroundColor = .brown
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()
    
    @objc private func handleNext(){
        
        let currentPage = min(pageControl.currentPage + 1, pages.count-1)
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentPage
        print("handleNext", currentPage)
    }
   
    fileprivate func setupBottomControls(){
               let bottomControlStackView: UIStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
               bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
               bottomControlStackView.distribution = .fillEqually
               view.addSubview(bottomControlStackView)
               NSLayoutConstraint.activate([
               bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
               bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
               bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
               bottomControlStackView.heightAnchor.constraint(equalToConstant: 60)
               ])
           }
    
    override func viewDidLoad() {
           super.viewDidLoad()
//            collectionView.collectionViewLayout.invalidateLayout()
           //collectionView.backgroundColor = .green
           collectionView.register(PageCell.self, forCellWithReuseIdentifier: "CellId")
           collectionView.isPagingEnabled = true
            setupBottomControls()
           print("SwapingController")
       }
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let contentXOffset = targetContentOffset.pointee.x, frameWidth = view.frame.width
        pageControl.currentPage = Int(contentXOffset / frameWidth)
        print(contentXOffset, frameWidth, contentXOffset/frameWidth)
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! PageCell
//        let currentImage = imagesAre[indexPath.item]
//        cell.logoImageView.image = UIImage(currentImage)
        
        /* //this code will work before making data model page on PageCell
        let currentSlide = pages[indexPath.item]
        cell.logoImageView.image = UIImage(named: currentSlide.image)
        
        let attributedText = NSMutableAttributedString(string: currentSlide.title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24), NSAttributedString.Key.foregroundColor : UIColor.red ])
        
        attributedText.append(NSMutableAttributedString(string: "\n\n\n \(currentSlide.description)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        cell.descriptionTextView.attributedText = attributedText
        cell.descriptionTextView.textAlignment = .center
        cell.descriptionTextView.isEditable = false
        cell.descriptionTextView.isScrollEnabled = false*/
        
        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .orange
        cell.page = pages[indexPath.row] //Here we can access set private propertise
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
//        return CGSize(width: preferredWidth, height: floor(preferredHeight))
//        return CGSize(width: view.frame.width , height: view.frame.height - (view.safeAreaInsets.top + view.safeAreaInsets.bottom))

    }
}
