//
//  PostFactory.swift
//  07-TaskScrapping
//
//  Created by Carlos Daniel Pedrerol on 16/10/2020.
//  Copyright © 2020 Carlos Daniel Pedrerol. All rights reserved.
//

import Foundation
import Alamofire
import Kanna

class PostsFactory {

    var posts  = [Post]()

    var postsUrl : String

    var titleClean = ""
    var imgUrl = ""
    var urlPost = ""
    var post = Post(title: "", urlPost: "", imgUrl: "")
    var title = ""
    
    init(postsUrl : String){
        self.postsUrl = postsUrl
        scrapeURL()
    }
    
    func scrapeURL(){
        AF.request(self.postsUrl).responseString { response in
                    switch response.result {
                    case .success(_):
                        if let htmlString = response.value {
                            self.parseHTML(html: htmlString)
                        }
     //                   if let htmlString = response.value {
    //                        self.parseHTML(html: htmlString)
                           
                        
                    case .failure(_):
                        print(Error.self)
                    }
                }
        }
    
    func parseHTML(html: String){
    
        do{
        
            let doc = try Kanna.HTML(html: html, encoding: String.Encoding.utf8)
            print(doc.title)
        
            for div in doc.css("div"){
            if div["class"] == "entry-featured" {
                for a in div.css("a") {
                   if a["class"] == "entry-thumb" {
                      for img in a.css("img") {
                       imgUrl = img["src"]!
                      }

                   }
                    
                   urlPost = a["href"]!
                    let titlePost = a["title"]!.replacingOccurrences(of: "Permalink to: \"", with: "")
                    title = String(titlePost.dropLast(1))

                    post = Post(title: title, urlPost: urlPost, imgUrl: imgUrl)
                    self.posts.append(post)
              
                    }
                }
            }
        }catch{
            print(error)
        }
       NotificationCenter.default.post(name: NSNotification.Name("PostsUpdated"), object: nil)
        
    }

     
}
