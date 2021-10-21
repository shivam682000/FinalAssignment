//
//  RootViewControllers.swift
//  FinalAssignmentWithCoreData
//
//  Created by shivam kumar on 06/10/21.
//

import Foundation
import UIKit
extension RootViewController : UISearchBarDelegate, TableViewCellDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == Constants.EMPTY_STRING {
            self.users = self.duplicate_array
        } else {
            self.users = self.duplicate_array
            self.users = self.users.filter{
                ($0.name.lowercased().starts(with: searchText.lowercased()))
            }
        }
        self.tableView.reloadData()
    }
    
    func get_data(url:URL) {
        let object = ApiServices()
        object.getApiData(requestUrl: url, resultType: ResponseModel.self) { [self]
            (result) in
            if result.data.totalBatches.count != Constants.DEFAULT_VALUE {
                self.users.append(contentsOf: result.data.totalBatches)
                self.duplicate_array.append(contentsOf: result.data.totalBatches)
            } else {
                self.hasMore = false
            }
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
    }
    
    func configureNavigationBar() {
        navigationItem.title = Literals.EMPLOYEE_RECORDS
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:#selector(navigate))
    }
    
    func tranfer2(data: NewBatch,batchcode:String) {
        let index = self.users.firstIndex(where: {$0.batchCode == batchcode})
        self.users[index!].batchCode = data.batchCode
        self.users[index!].createdDate = data.batchStartDate
        self.users[index!].name = data.batchName
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func transfer() {
        let object = ApiServices()
        object.getApiData(requestUrl: Constants.get_data_link!, resultType:
                            ResponseModel.self) { [self]
            (result) in
            self.users.insert(result.data.totalBatches[Constants.DEFAULT_VALUE], at: Constants.DEFAULT_VALUE)
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
    }
    
    @objc func navigate() {
        let AddEmployeee = self.storyboard?.instantiateViewController(withIdentifier: StoryBoard.ADD_EMPLOYEE_VIEW_CONTROLLER ) as! AddEmployeeViewController
        AddEmployeee.delegate = self
        AddEmployeee.navigationItem.title = Literals.CREATE
        AddEmployeee.dataInject(text: Literals.CREATE_BATCH)
        self.navigationController?.pushViewController(AddEmployeee, animated: true)
    }
    
    func setup() {
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor = UIColor(red: CGFloat(Constants.RED_COLOR_VALUE), green: CGFloat(Constants.GREEN_COLOR_VALUE), blue: CGFloat(Constants.BLUE_COLOR_VALUE), alpha: CGFloat(Constants.ALPHA_VALUE))
        navigationController?.navigationBar.tintColor = .white
    }
    
    func changeBottomLine() {
        segmentControl.addUnderlineForSelectedSegment()
        segmentControlActive.addUnderlineForSelectedSegment()
    }
    
    @IBAction func segmentedChange1(_ sender: UISegmentedControl) {
        segmentControlActive.changeUnderlinePosition()
    }
    
    @IBAction func segmentedChange(_ sender: UISegmentedControl) {
        segmentControl.changeUnderlinePosition()
    }
    
    func moreData() {
        self.index = self.limit
        self.offset = self.offset+self.limit
        let urlstring = Constants.baseUrl + Constants.LIMIT + "\(self.offset)" + Constants.SORT
        self.get_data(url: URL(string: urlstring)!)
    }
    
    func tableViewCell(_ tableViewCell: TableViewCell, subscribeButtonTappedFor index: BatchesListModel ) {
        print(index)
        let optionMenu = UIAlertController(title: nil, message:  Literals.CHOOSE_OPTION, preferredStyle: .actionSheet)
        let editAction = UIAlertAction(title: Literals.EDIT_EMPLOYEE, style: .default, handler:
                                        {
                                            (alert: UIAlertAction!) -> Void in
                                            let AddEmployeee = self.storyboard?.instantiateViewController(withIdentifier: StoryBoard.ADD_EMPLOYEE_VIEW_CONTROLLER) as! AddEmployeeViewController
                                            AddEmployeee.navigationItem.title = Literals.EDIT1
                                            AddEmployeee.dataInject(text: Literals.EDIT_BATCH)
                                            AddEmployeee.configure(data : index)
                                            AddEmployeee.isUpdate = true
                                            AddEmployeee.delegate = self
                                            self.navigationController?.pushViewController(AddEmployeee, animated: true)
                                        })
        let deleteAction = UIAlertAction(title: Literals.DELETE_EMPLOYEE, style: .default, handler:
                                            {
                                                (alert: UIAlertAction!) -> Void in
                                                let object = ApiServices()
                                                let url = Constants.DELETE + index.batchCode
                                                let index = self.users.firstIndex(where: {$0.batchCode == index.batchCode})
                                                self.users.remove(at: index!)
                                                let url1 = URL(string: url)
                                                object.deleteApiData(requestUrl: url1!,resultType: Decodable2.self) {
                                                    (result) in
                                                    if result.status == Constants.SUCCESS {
                                                        DispatchQueue.main.async {
                                                            self.tableView.reloadData()
                                                        }
                                                    } else {
                                                    }
                                                }
                                            })
        let cancelAction = UIAlertAction(title: Literals.CANCEL, style: .cancel, handler:
                                            {
                                                (alert: UIAlertAction!) -> Void in
                                            })
        let inactiveAction = UIAlertAction(title: Literals.MAKE_IT_INACTIVE, style: .default, handler:
                                            {
                                                (alert: UIAlertAction!) -> Void in
                                                
                                            })
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(editAction)
        optionMenu.addAction(inactiveAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
}
