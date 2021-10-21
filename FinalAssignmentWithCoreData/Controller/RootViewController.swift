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

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, dataTransfer {
    
    @IBOutlet weak var segmentControl : UISegmentedControl!
    @IBOutlet weak var segmentControlActive : UISegmentedControl!
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var searchBar : UISearchBar!
    
    let searchController = UISearchController()
    var page : Int = Constants.PAGE_NUMBER
    var offset = Constants.DEFAULT_VALUE
    var hasMore : Bool = true
    var limit = Constants.LIMIT_PAGE
    var index = Constants.DEFAULT_VALUE
    var users = [BatchesListModel]()
    var count = Constants.DEFAULT_VALUE
    var duplicate_array = [BatchesListModel]()
    var inactiveArray = [BatchesListModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        setup()
        configureNavigationBar()
        changeBottomLine()
        let nib = UINib(nibName: StoryBoard.TABLE_VIEW_CELL, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: StoryBoard.CELL)
        if let url1 = Constants.get_data_link {
            self.get_data(url: url1)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        segmentControlActive.setTitle(Literals.ACTIVE + "(\(self.users.count))", forSegmentAt: Constants.DEFAULT_VALUE)
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: StoryBoard.CELL, for: indexPath) as? TableViewCell else{return UITableViewCell()}
        cell.index = users[indexPath.row]
        cell.delegate = self
        cell.configure(object: users[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row == self.users.count-Constants.LAST_ELEMENT) {
            if hasMore {
                self.moreData()
            }
        }
    }
}















