////
////  Utils.swift
////  13.1 Netflix
////
////  Created by Apple  on 14/12/22.
////
//
//import Foundation
//
//class Utils{
//    static let jsonDecoder:JSONDecoder = {
//        let jsonDecoder = JSONDecoder()
//        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//        jsonDecoder.dateDecodingStrategy = .custom(dateFormatter)
//        return jsonDecoder
//    }()
//    
//    static let dateFormatter:DateFormatter = {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-mm-dd"
//        return dateFormatter
//    }()
//}
