

import UIKit

class AddEmployeeViewController: UIViewController {
    
    var label1 : String?
    var originalBatchCode : String?
    var delegate : dataTransfer?
    var isUpdate : Bool = false
    var object : BatchesListModel?
    @IBOutlet weak var txtHeader : UILabel!
    @IBOutlet weak var txtfield_BatchId : UITextField!
    @IBOutlet weak var txtfield_BatchName : UITextField!
    @IBOutlet weak var txtfield_BatchCode : UITextField!
    @IBOutlet weak var txtfield_StartingDate : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        setup()
        setupforEdit()
    }
    
    func configure(data:BatchesListModel?) {
        if let data = data {
            self.object = data
            self.originalBatchCode = object?.batchCode
        }
    }
    
    func setupforEdit() {
        if let object = self.object {
            self.txtfield_BatchCode.text = object.batchCode
            self.txtfield_BatchName.text = object.name
            let start = object.createdDate.startIndex
            let tenth = object.createdDate.index(start, offsetBy: Constants.OFFSET)
            let substring = object.createdDate[start..<tenth]
            let string = String(substring)
            self.txtfield_StartingDate.text = string
            let stringBatchId = String(object.batchId)
            self.txtfield_BatchId.text = stringBatchId
        }
    }
    
    @objc func addTapped() {
        let object = ApiServices()
        let request = NewBatch(batchCode: txtfield_BatchCode.text ?? Constants.EMPTY_STRING, batchStartDate: txtfield_StartingDate.text ?? Constants.EMPTY_STRING, batchName: txtfield_BatchName.text ?? Constants.EMPTY_STRING)
        if isUpdate {
            do {
                let url1 = Constants.baseUrl + Constants.BATCHES + request.batchCode + Constants.EDIT
                let completeurl = URL(string: url1 )
                guard let completeurl = completeurl else {return}
                let encodedRequest = try JSONEncoder().encode(request)
                object.patchApiData(requestUrl: completeurl, requestBody: encodedRequest, resultType: DecodabeleData2.self) { [self] (userRegistrationResponse) in
                    self.delegate?.tranfer2(data: request,batchcode:self.originalBatchCode!)
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            } catch let error {
                debugPrint("error = \(error.localizedDescription)")
            }
        } else {
            do {
                let encodedRequest = try JSONEncoder().encode(request)
                guard let completeurl = Constants.post_data else {return}
                object.postApiData(requestUrl: completeurl, requestBody: encodedRequest, resultType: DecodableData.self) { (userRegistrationResponse) in
                    self.delegate?.transfer()
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            } catch let error {
                debugPrint("error = \(error.localizedDescription)")
            }
        }
    }
    
    func configureNavigationBar() {
        self.navigationController?.navigationBar.topItem?.title = Constants.EMPTY_STRING
    }
    
    func setup() {
        txtHeader.text = self.label1
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: Literals.DONE, style: .done, target: self, action: #selector(addTapped))
    }
    
    func dataInject(text : String) {
        self.label1 = text
    }
}

