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
        if searchText == "" {
            
            self.users = self.duplicate_array
        }
        else {
            self.users = self.duplicate_array
            self.users = self.users.filter{
                ($0.name.lowercased().starts(with: searchText.lowercased()))
            }
        }
        self.tableView.reloadData()
    }
    
    func get_data(url:URL) {
        
        let object = ApiServices()
        //        object = DependencyInversion.self as! DependencyInversion
        object.getApiData(requestUrl: url, resultType: ResponseModel.self) { [self]
            (result) in
            if result.data.totalBatches.count != 0 {
                
                self.users.append(contentsOf: result.data.totalBatches)
                self.duplicate_array.append(contentsOf: result.data.totalBatches)
            }
            else {
                
                self.hasMore = false
            }
            
            
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
    }
    
    func configureNavigationBar() {
        
        navigationItem.title = "Employee Records"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:#selector(navigate))
    }
    
    func tranfer2(data: NewBatch,batchcode:String) {
        
        let index = self.users.firstIndex(where: {$0.batchCode == batchcode})
        self.users[index!].batchCode = data.batchCode
        self.users[index!].createdDate = data.batchStartDate
        self.users[index!].name = data.batchName
        print(index,"hello")
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
      
        
        
    }
    
    func transfer() {
        
        let object = ApiServices()
        
        object.getApiData(requestUrl: Constants.get_data_link!, resultType:
                            ResponseModel.self) { [self]
            (result) in
            
            self.users.insert(result.data.totalBatches[0], at: 0)
            DispatchQueue.main.async {
                tableView.reloadData()
            }
            
        }
        
    }
    
    @objc func navigate() {
        let AddEmployeee = self.storyboard?.instantiateViewController(withIdentifier: "AddEmployeeViewController") as! AddEmployeeViewController
        AddEmployeee.delegate = self
        AddEmployeee.navigationItem.title = "Create"
        AddEmployeee.dataInject(text: "Create Batch !")
        self.navigationController?.pushViewController(AddEmployeee, animated: true)
        
    }
    
    func setup() {
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.0275, green: 0.6627, blue: 0.9373, alpha: 1.0)
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
        self.i = self.limit
        
        self.offset = self.offset+self.limit
        let urlstring = Constants.baseUrl + "batches/details?limit=20&offset=\(self.offset)&sortBy=createdAt"
        self.get_data(url: URL(string: urlstring)!)
    }
    
    func tableViewCell(_ tableViewCell: TableViewCell, subscribeButtonTappedFor index: BatchesListModel ) {
        print(index)
        
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        
        let editAction = UIAlertAction(title: "Edit Employee", style: .default, handler:
                                        {
                                            (alert: UIAlertAction!) -> Void in
                                            let AddEmployeee = self.storyboard?.instantiateViewController(withIdentifier: "AddEmployeeViewController") as! AddEmployeeViewController
                                            AddEmployeee.navigationItem.title = "Edit"
                                            AddEmployeee.dataInject(text: "Edit Batch !")
                                            AddEmployeee.configure(data : index)
                                            AddEmployeee.isUpdate = true
                                            AddEmployeee.delegate = self
                                            self.navigationController?.pushViewController(AddEmployeee, animated: true)
                                            
                                            
                                            
                                        })
        
        let deleteAction = UIAlertAction(title: "Delete Employee", style: .default, handler:
                                            {
                                                (alert: UIAlertAction!) -> Void in
                                                let object = ApiServices()
                                                let url = "https://store.amarendra.dev.classplus.co/batches/" + index.batchCode
                                                let index = self.users.firstIndex(where: {$0.batchCode == index.batchCode})
                                                self.users.remove(at: index!)
                                                
                                                let url1 = URL(string: url)
                                                object.deleteApiData(requestUrl: url1!,resultType: Decodable2.self) {
                                                    (result) in
                                                    if result.status == "success"{
                                                        DispatchQueue.main.async {
                                                            self.tableView.reloadData()
                                                        }
                                                    }
                                                    else{
                                                        
                                                    }
                                                    
                                                    
                                                }
                                                
                                                
                                            })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:
                                            {
                                                (alert: UIAlertAction!) -> Void in
                                                
                                            })
        
        let inactiveAction = UIAlertAction(title: "Make it Inactive", style: .default, handler:
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
