//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    var businesses: [Business]!
    var searchBar: UISearchBar = UISearchBar()
    
    @IBOutlet weak var tableView: UITableView!
    
    func filterByType(type: String) {
        Business.searchWithTerm(term: type, completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            self.businesses = businesses
            self.tableView.reloadData()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 250/255, green: 5/255, blue: 5/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.searchBar.sizeToFit()
        self.searchBar.delegate = self
    
        self.navigationItem.titleView = self.searchBar
        
        tableView.delegate = self
        tableView.dataSource = self
        
        filterByType(type: "Thai")
        
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange: String) {
        let text = self.searchBar.text
        
        filterByType(type: text!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if businesses != nil {
            return businesses.count
        } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
        
        let business = businesses[indexPath.row]
        
        cell.business = business
        
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
