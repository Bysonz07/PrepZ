//
//  IngredientViewController.swift
//  ProjectMC2PrepZ
//
//  Created by Difa N Pratama on 20/06/21.
//

import UIKit

class IngredientViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    let models = [
        "New York",
        "London",
        "Hongkong",
        "Seatlle",
        "New York",
        "London",
        "Hongkong",
        "Seatlle",
        "New York",
        "London",
        "Hongkong",
        "Seatlle",
        "New York",
        "London",
        "Hongkong",
        "Seatlle",
        "New York",
        "London",
        "Hongkong",
        "Seatlle",
        "New York",
        "London",
        "Hongkong",
        "Seatlle"
    ]

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ingredientCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        self.title = "Chicken"
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.7960784314, green: 0.5607843137, blue: 0.4901960784, alpha: 1)
        let backButton = UIBarButtonItem()
        backButton.title = "Home"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.register(FactTableViewCell.nib(), forCellReuseIdentifier: FactTableViewCell.identifier)
        let header = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0,
                                                           width: view.frame.size.width,
                                                           height: view.frame.size.width))
        header.imageView.image = UIImage(named: "CHICKEN")
        tableView.tableHeaderView = header
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Food Safety Fact"
        } else if section == 1 {
            return "Things to Concern"
        }
        return "How To Prepare Chicken"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section <= 1 {
            return 1
        }
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath)
            cell.textLabel?.lineBreakMode = .byWordWrapping
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = "Chicken is prone to cross contamination when it comes into contact with any other food products, especially ones that are already cooked or ones that will be eaten raw, such as salad vegetables or greens."
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath)
            cell.textLabel?.lineBreakMode = .byWordWrapping
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = "1. Wash your hands for 20 secs before and after food preparation\n2. Use a separate cutting board.\n3. Clean and sanitize counter tops, cutting boards and utensils before and after food preparation."
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: FactTableViewCell.identifier, for: indexPath) as! FactTableViewCell
            
            cell.configure(with: "brining_chicken", title: "Brining Chicken", subTitle: "Breaking down a\nwhole chicken into pieces\nfor several meals.", timer: "30 Minutes")
            return cell
        }
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section > 1 {
            return 135
        }
        return 100
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .white
        if section == 2 {
            
            let header = view as! UITableViewHeaderFooterView
            header.textLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ingredientToPreview", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.tableHeaderView as? StretchyTableHeaderView else { return  }
        header.scrollViewDidScroll(scrollView: tableView)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
