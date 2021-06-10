//
//  ViewController.swift
//  PrepZ
//
//  Created by Difa N Pratama on 04/06/21.
//

import UIKit

class HomePageViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    @IBOutlet weak var recentlyViewedOutlet: UICollectionView!
    @IBOutlet weak var categoriesOutlet: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 228, height: 170)
        //Delegate data source Collection View
        recentlyViewedOutlet.dataSource = self
        recentlyViewedOutlet.delegate = self
        categoriesOutlet.dataSource = self
        categoriesOutlet.delegate = self
        
       
        
        //Sign Nib
        recentlyViewedOutlet.register(CategoriesCollectionViewCell.nib(), forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
        categoriesOutlet.register(CategoriesCollectionViewCell.nib(), forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
        // Do any additional setup after loading the view.
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.recentlyViewedOutlet {
            return 3 //recently viewed outlet
        }
        return 4 //categories outlet
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if collectionView == self.recentlyViewedOutlet {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as! CategoriesCollectionViewCell
            cell.configure(named: "Fruit", with: UIImage(named: "fruit")!)
            cell.onMoreButtonClick = {
                self.performSegue(withIdentifier: "homeToCategories", sender: nil)
            }
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as! CategoriesCollectionViewCell
            cell.configure(named: "Meat", with: UIImage(named: "meat")!)
            cell.onMoreButtonClick = {
                self.performSegue(withIdentifier: "homeToCategories", sender: nil)
                }
            return cell
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as! CategoriesCollectionViewCell
        cell.onMoreButtonClick = {
            print("Kepencet juga")
            self.performSegue(withIdentifier: "homeToCategories", sender: nil)
            
        }
        print("Pencet \(indexPath)")
        performSegue(withIdentifier: "homeToCategories", sender: nil)
    }

}

extension HomePageViewController: UICollectionViewDelegateFlowLayout{ //let specify what is the margin and padding between cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 228, height: 170)
    }
}
