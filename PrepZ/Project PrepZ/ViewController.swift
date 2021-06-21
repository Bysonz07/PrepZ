//
//  ViewController.swift
//  ProjectMC2PrepZ
//
//  Created by Difa N Pratama on 17/06/21.
//

import UIKit

//MARK: - Result VC for Search Controller
class ResultVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    let tableView = UITableView()
    var data = [String]()
    var filteredData = [String]()
    var sectionTitle = [String]()
    var ingredientsDict = [String:[String]]()
    var ingredients:[String] = ["Apple","Avocado","Beef Defros","Beef Aging","Beef Poundering","Beef Trimming","Bok Choy Chopping","Chicken Brinning","Chichken Sectioning","Mango Slicing","Onion Chpping","Rib Boning","Rib Frenching","Watermelon Slicing"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        
        //OnBoarding
        let defaults = UserDefaults.standard
        defaults.setValue(true, forKey: "onBoarding")
        
        setUpData()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self

        sectionTitle = Array(Set(ingredients.compactMap({String($0.prefix(1))})))
        sectionTitle.sort()
        
        for stitle in sectionTitle {
            ingredientsDict[stitle] = [String]()
        }
        
        for ingredient in ingredients{
            ingredientsDict[String(ingredient.prefix(1))]?.append(ingredient)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    //MARK: - Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = ingredients[indexPath.row]
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
        return sectionTitle
    }
    
    //Prepopulate data
    private func setUpData(){
        data.append("Apple Slicing & Storing")
        data.append("Avocado Slicing")
        data.append("Beef Defrost")
        data.append("Rib Boning")
        data.append("Rib Frenching")
        data.append("Sectioning Chicken")
        data.append("Chicken Boning")
        data.append("Mango Slicing")
        data.append("Tenderizing Beef")
        data.append("Dry Aging Beef")
        data.append("Cutting Spinach")
        data.append("Chopping Bok Choy")
    }
    
}
//MARK: End of Result VC-

//MARK: - View Controller
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    //Declare Outlet
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: ResultVC())
    
    //Declare model
    var models = [Model]()
    
    var categories = ["HOME_CHICKEN", "HOME_BEEF", "HOME_FRUITS", "HOME_VEGETABLES"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Recently
        models.append(Model(imageName: "HOME_CHICKEN"))
        models.append(Model(imageName: "HOME_BEEF"))
        models.append(Model(imageName: "HOME_FRUITS"))
        
        //SearchController
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        //TableView
        tableView.register(ProductTableViewCell.nib(), forCellReuseIdentifier: ProductTableViewCell.identifier)
        tableView.register(CategoryTableViewCell.nib(), forCellReuseIdentifier: CategoryTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        // Do any additional setup after loading the view.
    }

    
    //MARK: - TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        //MARK: Return how many section
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //MARK:  Setting section title
        if section == 0 {
            return "Recently Viewed"
        }
        return "Product"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //Background Color Header
        view.tintColor = .white
        
        //Header Font Set
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //MARK: Return how many item per section
        if section == 0 {
            return 1
        } else {
            return 4
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //MARK: Setting that each section have different cell
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as! ProductTableViewCell
            cell.configure(with: models)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as! CategoryTableViewCell
            cell.ctImageView.image = UIImage(named: categories[indexPath.row])!
            if indexPath.row <= 4 {
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
                
            }
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //MARK: Setting height
        if indexPath.section == 0 {
            return 170
        }
        return 175
    }
    //MARK: End of Table -
    
    //MARK: - SearchBarController
    func updateSearchResults(for searchController: UISearchController) {
        //FIXME: The tableview doesn't preload
        guard let text = searchController.searchBar.text else { return  }
        print(text)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "homeToIngredient", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //MARK: End of searchBarController -
}

//MARK: - Model
struct Model {
    let imageName: String
}

struct Categori {
    let imageName: String
}
