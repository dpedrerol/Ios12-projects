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
    
    
    var urlName = "http://juangabrielgomila.com/blog"
    
    var urlName2 = "http://juangabrielgomila.com/blog/page/2/"
    
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
        return CGSize(width: collectionView.frame.size.width, height: 200)
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
    
    func prepareHeaderAndFooter(){
        
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")
        
        collectionView.register(FooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "FooterView")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: IndexPath) -> UICollectionReusableView {
            
            if kind == UICollectionView.elementKindSectionHeader {
              let headerView =
                    (collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                            withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView)
                
                headerView.labelHeader.text = "Juan Gabriel Blog"
                
                return headerView
       
            }else if kind ==  UICollectionView.elementKindSectionFooter {
    
                let footerView =
                    collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FooterView", for: indexPath) as! FooterView
                

                return footerView
    
    }
            fatalError()
}
    
    

    
    
    @objc func reloadItemsInCollectionView() {
        self.collectionView.reloadData()
        
    }
    
}

