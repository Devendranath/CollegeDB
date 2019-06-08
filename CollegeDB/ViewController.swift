//
//  ViewController.swift
//  CollegeDB
//
//  Created by apple on 07/06/19.
//  Copyright © 2019 iOSProofs. All rights reserved.
//

import UIKit
import ProgressHUD

class ViewController: UIViewController {
    
    var selectedCollege: College! = nil
    @IBOutlet weak var tableView: UITableView!
    var colleges: [College]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshColleges()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshColleges()
    }
    
    func refreshColleges() {
        ProgressHUD.show("Loading Students")
        
        colleges = DBManager.sharedManager.getColleges(entity: College.self) as? [College]
        tableView.reloadData()
//        ProgressHUD.dismiss()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let svc = segue.destination as? StudentsViewController {
            svc.college = selectedCollege
            svc.students = Array(selectedCollege.students ?? []) as! [Student]
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollegeCell")
        guard let aCollege = colleges?[indexPath.row] else { return UITableViewCell()}
        
        cell?.textLabel?.text = aCollege.name
        cell?.detailTextLabel?.text = aCollege.address
        return cell ?? UITableViewCell()        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCollege = colleges?[indexPath.row]
        self.performSegue(withIdentifier: "ShowStudents", sender: nil)
    }
}

