//
//  MainPageViewController.swift
//  Assignment03
//
//  Created by Chenuka Virajith on 2022-04-29.
//

import UIKit

class HomeViewController: BaseViewController {
    var featuredProductsArray:[Food] = [
        Food(productTitle: "Dosai", productPrice: 1.00, productImage: UIImage(named: "Dosai")!, productCode: "DOS145", availability: 9, productDescription: "Dosai lore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do "),
        
        Food(productTitle: "Pizza", productPrice: 1.00, productImage: UIImage(named: "Pizza")!, productCode: "PIZZ12", availability: 12, productDescription: "Pizza sit amet, consectetur adipiscing elit, sed do "),
        
        Food(productTitle: "Biryani", productPrice: 1.00, productImage: UIImage(named: "Biriyani")!, productCode: "BIR71", availability: 12, productDescription: "Biryani lore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do "),
        
        Food(productTitle: "Egg Rotti", productPrice: 1.00, productImage: UIImage(named: "Egg_Roti")!, productCode: "EGGR51", availability: 32, productDescription: "Egg Rotti ipsum dolor sit amet, consectetur adipiscing elit, sed do "),
        
        Food(productTitle: "Hoppers", productPrice: 1.00, productImage: UIImage(named: "Hoppers")!, productCode: "HOP12", availability: 12, productDescription: "Paratha lore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do "),
        
        Food(productTitle: "Lamprais", productPrice: 3.00, productImage: UIImage(named: "Lamprais")!, productCode: "LP712", availability: 4, productDescription: "Lamprais ipsum dolor sit amet, consectetur adipiscing elit, sed do "),
        
        Food(productTitle: "Submarine", productPrice: 3.00, productImage: UIImage(named: "Submarine")!, productCode: "SB6598", availability: 9, productDescription: "Submarine ipsum dolor sit amet, consectetur adipiscing elit, sed do "),
        
        Food(productTitle: "Burgers", productPrice: 3.00, productImage: UIImage(named: "Burger")!, productCode: "BK520", availability: 12, productDescription: "Burgers ipsum dolor sit amet, consectetur adipiscing elit, sed do ")
    ]
    
    var newProductsArray:[Food] = [
        Food(productTitle: "Hot Dogs", productPrice: 4.00, productImage: UIImage(named: "Hot_Dog")!, productCode: "HD720", availability: 43, productDescription: "Hot Dogs amet, consectetur adipiscing elit, sed do "),
        
        Food(productTitle: "Sandwiches", productPrice: 2.00, productImage: UIImage(named: "Sandwiches")!, productCode: "SAN56", availability: 23, productDescription: "Casual for men lore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do "),
        
        Food(productTitle: "Nasigoreng", productPrice: 4.00, productImage: UIImage(named: "Nasi_Goreng")!, productCode: "NG012", availability: 12, productDescription: "Nasigoreng consectetur adipiscing elit, sed do"),
        
        Food(productTitle: "Idly", productPrice: 4.00, productImage: UIImage(named: "Idly")!, productCode: "IDL12", availability: 32, productDescription: "Idly There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to"),
        
        Food(productTitle: "Chicken Fried Rice", productPrice: 4.00, productImage: UIImage(named: "Chicken_Fried_Rice")!, productCode: "CFR02", availability: 7, productDescription: "Chicken Fried Rice are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to "),
        
        Food(productTitle: "Chicken Kottu", productPrice: 4.00, productImage: UIImage(named: "Chicken_Koththu")!, productCode: "CK001", availability: 7, productDescription: "Kottu are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to ")
        
    ]
    
    @IBOutlet weak var featuredCollectionView: UICollectionView!
    @IBOutlet weak var newProductCollectionView: UICollectionView!
    @IBOutlet weak var featuredViewAllLabel: UILabel!
    @IBOutlet weak var newViewAllLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViews()
        // This function is taken from StackOverFlowers
        featuredViewAllLabel.addTapGestureRecognizer {
            
            let storyBoard = UIStoryboard(name: "Main", bundle: .main)
            guard let productsVC = storyBoard.instantiateViewController(withIdentifier: "product_list_vc") as? ProductListViewController else {
                return
            }
            productsVC.topNavigationTitle = "Featured Products"
            productsVC.productArray = self.featuredProductsArray
            self.navigationController?.pushViewController(productsVC, animated: true)
        }
        newViewAllLabel.addTapGestureRecognizer {
            let storyBoard = UIStoryboard(name: "Main", bundle: .main)
            guard let productsVC = storyBoard.instantiateViewController(withIdentifier: "product_list_vc") as? ProductListViewController else {
                return
            }
            productsVC.topNavigationTitle = "Featured Products"
            productsVC.productArray = self.newProductsArray
            self.navigationController?.pushViewController(productsVC, animated: true)
        }
    }
    
    func setupCollectionViews(){
        featuredCollectionView.delegate = self
        featuredCollectionView.dataSource = self
        newProductCollectionView.delegate = self
        newProductCollectionView.dataSource = self
        featuredCollectionView.register(ProductCollectionViewCell.nib(), forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        newProductCollectionView.register(ProductCollectionViewCell.nib(), forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == featuredCollectionView{
            if featuredProductsArray.count >= 4{
                return 4
            }else{
                return featuredProductsArray.count
            }
        }else{
            if newProductsArray.count >= 4{
                return 4
            }else{
                return newProductsArray.count
            }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == featuredCollectionView{
            let featuredCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
            
            let product = featuredProductsArray[indexPath.row]
            
            featuredCell.configure(with:product)
            
            return featuredCell
        }else{
            let newCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
            
            let product = newProductsArray[indexPath.row]
            
            newCell.configure(with:product)
            
            return newCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == featuredCollectionView{
            let product = featuredProductsArray[indexPath.row]
            
            let storyBoard = UIStoryboard(name: "Main", bundle: .main)
            guard let productListVC = storyBoard.instantiateViewController(withIdentifier: "single_product_vc") as? SingleProductViewController else {
                return
            }
            productListVC.product = product
            self.navigationController?.pushViewController(productListVC, animated: true)
            
            
        }else{
            let product = newProductsArray[indexPath.row]
            
            let storyBoard = UIStoryboard(name: "Main", bundle: .main)
            guard let productListVC = storyBoard.instantiateViewController(withIdentifier: "single_product_vc") as? SingleProductViewController else {
                return
            }
            productListVC.product = product
            self.navigationController?.pushViewController(productListVC, animated: true)
            
            
        }
    }
    
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let totalWidth: CGFloat = ((self.view.frame.width / 2))

            print(totalWidth) // this prints 106.666666667

        return CGSize(width:totalWidth, height:195)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 6
        }
}
