//
//  ViewController.swift
//  07-TaskScrapping
//
//  Created by Carlos Daniel Pedrerol on 15/10/2020.
//  Copyright © 2020 Carlos Daniel Pedrerol. All rights reserved.
//

import UIKit
import Alamofire
import Kanna

class ViewController: UICollectionViewController {
    
    
    let urlName = "http://juangabrielgomila.com/blog"
    
    var factory : PostsFactory!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadItemsInCollectionView), name: NSNotification.Name("PostsUpdated"), object: nil)
        
        factory = PostsFactory(postsUrl: urlName)
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        
        return factory.posts.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.labelPost.text! = factory.posts[indexPath.row].title
        cell.imageViewPost.downloadedFrom(link: factory.posts[indexPath.row].imgUrl)
        return cell
    }
     
   override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let url = URL(string: factory.posts[indexPath.row].urlPost) {
            UIApplication.shared.open(url, options: [:]) { (success) in
                print("\(self.factory.posts[indexPath.row].urlPost)")
            }
        }
    }
    
        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: IndexPath) -> UICollectionReusableView {
        
            var headerView : HeaderView!
            
            if kind == UICollectionView.elementKindSectionHeader {
                headerView =
                collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                    withReuseIdentifier: "\(HeaderView.self)", for: indexPath) as? HeaderView
                
                }

            headerView.labelHeader.text = "Juan Gabriel Gomila Blog"
            
            return headerView
    }

    @objc func reloadItemsInCollectionView() {
        self.collectionView.reloadData()
        
    }
    
}

