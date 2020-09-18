//
//  WebViewHorizontalScrolling.swift
//  Migrant Handbook
//
//  Created by Sagyndyk Akzholov on 9/16/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import Foundation
import UIKit

class WebViewHorizontalScrolling: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private var images = [String]()
    var content: String?
    
    fileprivate func setupContentImages(_ content: String) {
        let htmlContent = content.replacingOccurrences(of: "file:///android_res/raw/", with: "\"")
        var imagesByHtml = htmlContent.components(separatedBy: "\">")
        imagesByHtml.removeLast()
        var str2Array = [String]()
        
        for image in imagesByHtml {
            str2Array.append(contentsOf: image.components(separatedBy: "src=\""))
        }
        
        for i in 0...str2Array.count {
            if i % 2 != 0 {
                if str2Array.indices.contains(i) {
                    images.append(str2Array[i])
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let content = self.content else { return }
        setupContentImages(content)
        pageControl.currentPage = 0
        pageControl.numberOfPages = images.count
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        imagesCollectionView.isPagingEnabled = true
        imagesCollectionView.register(WebCollectionViewCell.nib, forCellWithReuseIdentifier: WebCollectionViewCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(cellClass: WebCollectionViewCell.self, forIndexPath: indexPath)
        cell.webViewImageView.image = UIImage(named: images[indexPath.row])
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.pageControl.currentPage = Int(scrollView.contentOffset.x / imagesCollectionView.frame.width)
    }
}
extension WebViewHorizontalScrolling: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
