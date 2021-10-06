//
//  ViewController.swift
//  FinalAssignmentWithCoreData
//
//  Created by shivam kumar on 28/09/21.
//

//
//  ViewController.swift
//  FinalAssignment
//
//  Created by shivam kumar on 27/09/21.
//

import UIKit
import Foundation

protocol DependencyInversion {
    
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
}

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, dataTransfer {
    
    @IBOutlet weak var segmentControl : UISegmentedControl!
    @IBOutlet weak var segmentControlActive : UISegmentedControl!
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var searchBar : UISearchBar!
    
    let searchController = UISearchController()
    var page : Int = 1
    var offset = 0
    var hasMore : Bool = true
    var limit = 20
    var i = 0
    var totalcount = 218
    var users = [BatchesListModel]()
    var count = 0
    var duplicate_array = [BatchesListModel]()
    var inactiveArray = [BatchesListModel]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        searchBar.delegate = self
        setup()
        configureNavigationBar()
        changeBottomLine()
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        if let url1 = Constants.get_data_link {
            self.get_data(url: url1)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        segmentControlActive.setTitle("Active(\(self.users.count))", forSegmentAt: 0)
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.index = users[indexPath.row]
        cell.delegate = self
        cell.configure(object: users[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if (indexPath.row == self.users.count-1) {
            if hasMore {
                self.moreData()
            }
        }
    }
}

// Functions For All Root View Controller













