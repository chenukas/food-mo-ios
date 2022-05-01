//
//  SingleProductViewController.swift
//  Assignment03
//
//  Created by Chenuka Virajith on 2022-04-29.
//

import UIKit

class SingleProductViewController: BaseViewController {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productCodeLabel: UILabel!
    @IBOutlet weak var avalibilityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceWithTaxLabel: UILabel!
    @IBOutlet weak var productDescriptionTextBox: UITextView!
    @IBOutlet weak var topNavigationBarView: TopNavigationView!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var currentCountLabel: UILabel!
    
    
    var product:Food!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSinglePage(with: product)
       topNavigationBarView.titleLabel.text = "Product Page"
        topNavigationBarView.backButton.addTarget(self, action: #selector(self.goToPreviousVC(_:)), for: .touchUpInside)
        productImageView.layer.cornerRadius = 5
        addToCartButton.layer.cornerRadius = 5
    }
    
    @IBAction func reduceCartAction(_ sender: Any) {
        let currentCount = currentCountLabel.text
        let currentCountInt = Int(currentCount!)
        if currentCountInt! > 0{
            let newCount = currentCountInt! - 1
            currentCountLabel.text = String(newCount)
        }
    }
    
    @IBAction func plusCartAction(_ sender: Any) {
        let currentCount = currentCountLabel.text
        let currentCountInt = Int(currentCount!)
        if currentCountInt! < 10{
            let newCount = currentCountInt! + 1
            currentCountLabel.text = String(newCount)
        }else{
            displayAlert(title: "We are sorry", message: "Maximum number of items is limited to 10")
        }
    }
    
    func configureSinglePage(with product:Food){
        productImageView.image = product.prodImage
        productTitleLabel.text = product.prodTitle
        self.topNavigationBarView.titleLabel.text = product.prodTitle
        if let productCode = product.prodCode{
            productCodeLabel.text = "Code : \(productCode)"
        }
        if let availUnits = product.availability{
            avalibilityLabel.text = "\(availUnits) Available"
        }
        if let price = product.prodPrice{
            priceLabel.text = "$\(price)"
            let priceWithTax = price + (price * (5/100))
            priceWithTaxLabel.text = "$\(String(format: "%.2f", priceWithTax)) incl. GST"
        }
        productDescriptionTextBox.text = product.prodDesc
        
    }

}
