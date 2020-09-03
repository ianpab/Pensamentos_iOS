//
//  Quote.swift
//  Pensamentos
//
//  Created by Ian Pablo on 01/09/20.
//  Copyright © 2020 pensamentos. All rights reserved.
//

import Foundation


struct Quote: Codable { //Encodable, Decodable
    
    let quote: String
    let author: String
    let image: String
    
    var quoteFormatted:String{
        return "〝" + quote + "〞"
    }
    
    var authorFormatted:String{
        return "- " + author + " -"
    }
    
    
}
