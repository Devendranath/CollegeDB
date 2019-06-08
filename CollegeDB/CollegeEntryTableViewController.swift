//
//  CollegeEntryTableViewController.swift
//  CollegeDB
//
//  Created by apple on 07/06/19.
//  Copyright © 2019 iOSProofs. All rights reserved.
//

import UIKit

class CollegeEntryTableViewController: UITableViewController {    

    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var establishedTF: UITextField!
    @IBOutlet weak var collegeNameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    

    @IBAction func cancelClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveClicked(_ sender: Any) {        
        let context = DBManager.sharedManager.context
        let newCollegeRecord = College(context: context)
        
        newCollegeRecord.name = collegeNameTF.text ?? ""
        newCollegeRecord.established = Int16(establishedTF.text ?? "0") ?? 0
        newCollegeRecord.address = addressTF.text ?? ""
        newCollegeRecord.phone = Int32(phoneTF.text ?? "0") ?? 0
        DBManager.sharedManager.saveContext()
    }
}
