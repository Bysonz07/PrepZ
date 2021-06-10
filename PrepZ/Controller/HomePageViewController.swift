//
//  ViewController.swift
//  PrepZ
//
//  Created by Difa N Pratama on 04/06/21.
//

import UIKit

class HomePageViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource{

   
    var RVImageArr = [UIImage(named: "Ayam"),UIImage(named: "Buah"),UIImage(named: "Ikan"),UIImage(named: "Sayur")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RVImageArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RVImageCollectionViewCell", for: indexPath) as! RVImageCollectionViewCell
        
        cell.RVImg.image = RVImageArr[indexPath.row]
        return cell
    }

}

