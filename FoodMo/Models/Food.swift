//
//  Food.swift
//  Assignment03
//
//  Created by Chenuka Virajith on 2022-04-29.
//

import Foundation
import UIKit

class Food:NSObject{
    var prodTitle:String?
    var prodPrice:Double?
    var prodImage:UIImage
    var prodCode:String?
    var availability:Int?
    var prodDesc:String?
    
    init(productTitle: String, productPrice: Double, productImage: UIImage, productCode: String, availability: Int, productDescription: String) {
        self.prodTitle = productTitle
        self.prodPrice = productPrice
        self.prodImage = productImage
        self.prodCode = productCode
        self.availability = availability
        self.prodDesc = productDescription
    }
}
