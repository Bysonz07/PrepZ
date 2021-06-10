//
//  CategoriesViewController.swift
//  PrepZ
//
//  Created by Difa N Pratama on 04/06/21.
//

import UIKit

class CategoriesViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    

    @IBOutlet weak var categoriesOutlet: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setup collectionView
        categoriesOutlet.dataSource = self
        categoriesOutlet.delegate = self
        categoriesOutlet.register(CategoriesCollectionViewCell.nib(), forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as! CategoriesCollectionViewCell
        cell.configure(named: "Meat", with: UIImage(named: "meat")!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Pencet categories\(indexPath)")
        performSegue(withIdentifier: "categoriesToPreview", sender: nil)
    }
    
}

extension CategoriesViewController: UICollectionViewDelegateFlowLayout{ //let specify what is the margin and padding between cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 228, height: 170)
    }
}
