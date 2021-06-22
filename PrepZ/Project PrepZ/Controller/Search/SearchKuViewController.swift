//
//  HomePageViewController.swift
//  HomeKuCoba
//
//  Created by Jenny Callista on 15/06/21.
//

import UIKit

class SearchKuViewController : UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchBarDelegate{
  
    

    @IBOutlet weak var searchTable: UITableView!
  
    
    var ingredients:[String] = ["Apple","Avocado","Beef Defros","Beef Aging","Beef Poundering","Beef Trimming","Bok Choy Chopping","Chicken Brinning","Chichken Sectioning","Mango Slicing","Onion Chpping","Rib Boning","Rib Frenching","Watermelon Slicing"]
    var searchedIng = [String]()
    var searching = false
    let searchController = UISearchController(searchResultsController: nil)
    
    var sectionTitle = [String]()
    var ingredientsDict = [String:[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search Ingredients"
        
//        searchBar.delegate = self
//        filterData = ingredients
        searchTable.delegate = self
        searchTable.dataSource = self
        sectionTitle = Array(Set(ingredients.compactMap({String($0.prefix(1))})))
        sectionTitle.sort()
        
        for stitle in sectionTitle {
            ingredientsDict[stitle] = [String]()
        }
        
        for ingredient in ingredients{
            ingredientsDict[String(ingredient.prefix(1))]?.append(ingredient)
        }
        print(ingredientsDict)
        print(sectionTitle)
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if searching{
            return  0
        }
        else {
            return 20
        }
    }
    //Mark: Tabel View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                    if searching{
                        return searchedIng.count
                    }else {
                    return ingredientsDict[sectionTitle[section]]?.count ?? 0
                    //return ingredients.count
                        
                    }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                if searching {
                    cell.textLabel?.text = searchedIng[indexPath.row]
                } else {
                cell.textLabel?.text = ingredientsDict[sectionTitle[indexPath.section]]?[indexPath.row]
                //  cell.textLabel?.text = ingredients[indexPath.row]
                }
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if searching {
            return 1
        }else{
            return sectionTitle.count
        }

        //return sectionTitle.count

    }
    
    //indicator
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if searching {
            return []
        }
        return sectionTitle
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if searching {
            
           return String(searchController.searchBar.text!.prefix(1))
        }else{
            return sectionTitle[section]
        }
        //return sectionTitle[section]
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty{
            searching = true
            searchedIng.removeAll()
            for ing in ingredients{
                if ing.lowercased().contains( searchText.lowercased()){
                    searchedIng.append(ing)
                }
            }
        }else{
            searching = false
            searchedIng.removeAll()
            searchedIng = ingredients
        }
        searchTable.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchedIng.removeAll()
        searchTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "searchToPreview", sender: nil)
    }
}



//class HomePageViewController: UIViewController, UISearchResultsUpdating {
//
//
//
//    let searchController = UISearchController()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "PrepZ"
//        searchController.searchResultsUpdater = self
//        navigationItem.searchController = searchController
//    }
//
//    func updateSearchResults(for searchController: UISearchController) {
//        guard let text = searchController.searchBar.text else {
//            return
//        }
//
//        print(text)
//    }
//
//
//}
