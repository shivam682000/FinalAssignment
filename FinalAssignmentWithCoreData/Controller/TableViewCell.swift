//
//  TableViewCell.swift
//  FinalAssignment
//
//  Created by shivam kumar on 27/09/21.
//

import UIKit

 protocol TableViewCellDelegate : AnyObject {
    func tableViewCell(_ tableViewCell : TableViewCell, subscribeButtonTappedFor index: BatchesListModel)
}

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewBox : UIView!
    @IBOutlet weak var txtName : UILabel!
    @IBOutlet weak var imgVerticalDots : UIImageView!
    @IBOutlet weak var txtBoxName : UILabel!
    var index : BatchesListModel?
    var delegate : TableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(subscribeButtonTapped(_:)))
        imgVerticalDots.isUserInteractionEnabled = true
        imgVerticalDots.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    func setup() {
        viewBox.layer.cornerRadius = 20;
        viewBox.layer.masksToBounds = true;
    }
    
    func configure(object : BatchesListModel) {
        
        let firstname = object.name
        let char1 =  firstname[firstname.startIndex]
        var total = ""
        total.append("k")
        total.append(char1)
        txtName.text = firstname
        txtBoxName.text = total
    }
    
    @objc func subscribeButtonTapped(_ sender: UIButton){
        if let delegate = delegate {
            delegate.tableViewCell(self, subscribeButtonTappedFor: self.index!)
        }
        
    }
}



