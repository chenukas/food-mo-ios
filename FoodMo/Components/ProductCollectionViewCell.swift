//
//  ProductCollectionViewCell.swift
//  Assignment03
//
//  Created by Ravidu Dilhara on 2022-04-29.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var cellContainerView: UIView!
    
    static let identifier = "productCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        productImageView.layer.cornerRadius = 5
        cellContainerView.layer.cornerRadius = 5
        addToCartButton.layer.cornerRadius = 5
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "ProductCollectionViewCell", bundle: nil)
    }
    
    func configure(with product:Food){
        productImageView.image = product.prodImage
        titleLabel.text = product.prodTitle
        if let price = product.prodPrice{
            priceLabel.text = "$\(price)"
        }
    }

}
