

import UIKit
protocol dataTransfer {
    func transfer()
    func tranfer2(data : NewBatch,batchcode:String)
}

class AddEmployeeViewController: UIViewController {
    
    var delegate : dataTransfer?
    var isUpdate : Bool = false
    var object : BatchesListModel?
    @IBOutlet weak var txtHeader : UILabel!
    @IBOutlet weak var txtfield_BatchId : UITextField!
    @IBOutlet weak var txtfield_BatchName : UITextField!
    @IBOutlet weak var txtfield_BatchCode : UITextField!
    @IBOutlet weak var txtfield_StartingDate : UITextField!
    var label1 : String?
    var originalBatchCode : String?
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
            let tenth = object.createdDate.index(start, offsetBy: 10)
            let substring = object.createdDate[start..<tenth]
            let string = String(substring)
            self.txtfield_StartingDate.text = string
            let stringBatchId = String(object.batchId)
            self.txtfield_BatchId.text = stringBatchId
        }
    }
    
    @objc func addTapped() {
        
        let object = ApiServices()
        let request = NewBatch(batchCode: txtfield_BatchCode.text ?? "", batchStartDate: txtfield_StartingDate.text ?? "", batchName: txtfield_BatchName.text ?? "")
        
        if isUpdate {
            do {
                let url1 = Constants.baseUrl + "batches/" + request.batchCode + "/edit"
                let completeurl = URL(string: url1 )
                guard let completeurl = completeurl else {return}
                let encodedRequest = try JSONEncoder().encode(request)
                object.patchApiData(requestUrl: completeurl, requestBody: encodedRequest, resultType: DecodabeleData2.self) { [self] (userRegistrationResponse) in
                    print(userRegistrationResponse,"whyjhu")
                    self.delegate?.tranfer2(data: request,batchcode:self.originalBatchCode!)
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
                
            } catch let error {
                debugPrint("error = \(error.localizedDescription)uhwujw")
            }
        }
        else{
            do {
                print("what are you doing")
                let encodedRequest = try JSONEncoder().encode(request)
                guard let completeurl = Constants.post_data else {return}
                object.postApiData(requestUrl: completeurl, requestBody: encodedRequest, resultType: DecodbaleData.self) { (userRegistrationResponse) in
                    print(userRegistrationResponse,"whyjhu")
                    self.delegate?.transfer()
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
                
            } catch let error {
                
                debugPrint("error = \(error.localizedDescription)uhwujw")
            }
            
        }
    }
    
    func configureNavigationBar() {
        
        self.navigationController?.navigationBar.topItem?.title = " "
    }
    
    func setup() {
        
        txtHeader.text = self.label1
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(addTapped))
        
    }
    
    func dataInject(text : String) {
        
        self.label1 = text
    }
}

