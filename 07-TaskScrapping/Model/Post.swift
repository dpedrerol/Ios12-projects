//
//  Post.swift
//  07-TaskScrapping
//
//  Created by Carlos Daniel Pedrerol on 16/10/2020.
//  Copyright © 2020 Carlos Daniel Pedrerol. All rights reserved.
//

import Foundation

class Post {
    
//    var uuid : String
    var title : String
    var imgUrl : String
    var urlPost : String
//    var imageDownloaded = false
    
    init(title : String, urlPost : String, imgUrl : String = "http://juangabrielgomila.com/wp-content/uploads/2014/06/normales.png" ) {


        self.title = title
        self.imgUrl = imgUrl
        self.urlPost = urlPost
        
//        self.uuid = UUID().uuidString
    }
    
    
}
