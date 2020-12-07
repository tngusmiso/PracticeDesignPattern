//
//  ViewController.swift
//  PracticeDesignPattern
//
//  Created by 임수현 on 2020/12/07.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Controller -> View
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var infoTableView: UITableView!
    
    // MARK: - Controller -> Model
    let infoManager = InfoManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoTableView.delegate = self
        infoTableView.dataSource = self
        
        infoManager.delegate = self
    }
}

// MARK: - Model -> Controller
// MARK: [dlegate]
extension ViewController: InfoManagerDelegate {
    func updatedInfos() {
        infoTableView.reloadData()
    }
}

// MARK: - View -> Controller
// MARK: [target action]
extension ViewController  {
    @IBAction func touchAddButton(_ sender: Any) {
        guard let newName = nameTextField.text,
              let newAge = Int(ageTextField.text!) else {
            return
        }
        // controller -> model
        infoManager.addPersonInfo(name: newName, age: newAge)
        
        // controller -> view
        nameTextField.text = ""
        ageTextField.text = ""
    }
}

// MARK: [delegate]
extension ViewController: UITableViewDelegate {
   
}

// MARK: [data source]
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoManager.getInfos().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // controller -> view
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "infoTableViewCell")
        
        // controller -> model
        let info = infoManager.getInfos()[indexPath.row]
        
        // controller -> view
        cell.textLabel?.text = info.name
        cell.detailTextLabel?.text = String(info.age)
        
        return cell
    }
}

