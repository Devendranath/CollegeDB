//
//  StudentsViewController.swift
//  CollegeDB
//
//  Created by apple on 08/06/19.
//  Copyright © 2019 iOSProofs. All rights reserved.
//

import UIKit
import CoreData

class StudentsViewController: UIViewController {
    @IBOutlet weak var studentsListView: UITableView!
    
    var students: [Student] = []
    var college: College!
    
    @IBAction func addStudent(_ sender: Any) {
        let context = DBManager.sharedManager.context
        let emptyNewStudent = Student(context: context)
        emptyNewStudent.name = "DNREDDi"
        emptyNewStudent.rollNo = 0003
        emptyNewStudent.branch = "IT"
        emptyNewStudent.myCollege = college
//        college.students?.adding(emptyNewStudent)
        DBManager.sharedManager.saveContext()
        refreshStudents()
    }
    
    func refreshStudents() {
        let context = DBManager.sharedManager.context
        
        guard let collegeName = college.name else { return }
        
        let predicate = NSPredicate(format: "myCollege == %@", college)

        
//        let predicate = NSPredicate(format: "myCollege == %@", college, argumentArray: nil)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        fetchRequest.predicate = predicate
        
        do {
            students = try context.fetch(fetchRequest) as! [Student]
            studentsListView.reloadData()
        } catch {
            print("Fetch Error occurred")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(students)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension StudentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell")
        let aStudent = students[indexPath.row]
        cell?.textLabel?.text = aStudent.name
        cell?.detailTextLabel?.text = aStudent.branch
        return cell ?? UITableViewCell()
    }
}
