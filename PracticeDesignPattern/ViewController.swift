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
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        infoTableView.delegate = self
        infoTableView.dataSource = self
    }
}

// MARK: - View -> Controller (target action)
extension ViewController  {
    @IBAction func touchAddButton(_ sender: Any) {
        
    }
}

// MARK: - View -> Controller (delegate)
extension ViewController: UITableViewDelegate {
   
}

// MARK: - View -> Controller (delegate)
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
