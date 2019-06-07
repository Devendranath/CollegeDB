//
//  ViewController.swift
//  CollegeDB
//
//  Created by apple on 07/06/19.
//  Copyright © 2019 iOSProofs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        colleges = DBManager.sharedManager.getColleges(entity: College.self) as? [College]
        tableView.reloadData()
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
}

