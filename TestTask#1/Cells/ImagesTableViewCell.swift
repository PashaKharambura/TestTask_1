//
//  ImagesTableViewCell.swift
//  TestTask#1
//
//  Created by Pavlo Kharambura on 11/2/18.
//  Copyright © 2018 Pavlo Kharambura. All rights reserved.
//

import UIKit

class ImagesTableViewCell: UITableViewCell, UIScrollViewDelegate  {

    @IBOutlet weak var scrolMain: UIScrollView!
    @IBOutlet weak var pageContr: UIPageControl!
    @IBOutlet weak var greyView: UIView!
    
    fileprivate var images = [UIImage]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        loadScrollView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    fileprivate func loadScrollView() {
        guard let image = UIImage(named: "image") else {return}
        images = [image,image,image]
        
        let pageCount = CGFloat(images.count)
        
        scrolMain.backgroundColor = UIColor.clear
        scrolMain.delegate = self
        scrolMain.isPagingEnabled = true
        scrolMain.contentSize = CGSize(width: self.frame.size.width * pageCount, height: self.frame.size.height)
        scrolMain.showsHorizontalScrollIndicator = false
        pageContr.numberOfPages = Int(pageCount)
        pageContr.addTarget(self, action:  #selector(self.pageChanged), for: .valueChanged)
        
        for i in 0..<Int(pageCount) {
            let image = UIImageView(frame: CGRect(x: self.scrolMain.frame.size.width * CGFloat(i), y: 0, width: self.frame.size.width, height: self.frame.size.height))
            image.image = images[i]
            image.contentMode = .scaleToFill
            self.scrolMain.addSubview(image)
        }
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let viewWidth: CGFloat = scrollView.frame.size.width
        let pageNumber = floor((scrollView.contentOffset.x - viewWidth / 50) / viewWidth) + 1
        pageContr.currentPage = Int(pageNumber)
    }
    
    @objc
    fileprivate func pageChanged() {
        let pageNumber = pageContr.currentPage
        var frame = scrolMain.frame
        frame.origin.x = frame.size.width * CGFloat(pageNumber)
        frame.origin.y = 0
        scrolMain.scrollRectToVisible(frame, animated: true)
    }
    
}
