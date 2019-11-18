//
//  StudentListTableViewController.swift
//  manjinder_c0762203_gpaApp
//
//  Created by Manjinder Aulakh on 2019-11-14.
//  Copyright © 2019 Manjinder kaur. All rights reserved.
//

import UIKit

class StudentListTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchbar: UISearchBar!
    
    @IBOutlet var tableview: UITableView!
    
    var filteredData: [Student]!
//   func loadarray(){
//       let a = grades(grade: "")
//       grades.gradepoints = [a, a, a]
//              
//   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchbar.delegate = self
        filteredData = Student.students
        
        
//        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
//               self.view.addGestureRecognizer(tapgesture)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
            
    
    }

    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//    @objc func viewTapped(){
//        searchbar.resignFirstResponder()
//    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentdetail")
//        cell?.textLabel?.text = "\(Student.students[indexPath.row].firstname) \(Student.students[indexPath.row].lastname)"
        // Configure the cell...
        
        
        cell?.textLabel?.text = "\(filteredData[indexPath.row].firstname) \(filteredData[indexPath.row].lastname)"
//        print("cellll ", filteredData[indexPath.row].firstname)
       
//        cell?.detailTextLabel?.text = "\(sum )"
        return cell!
    }
    
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        filteredData = searchText.isEmpty ? Student.students : Student.students.filter { (item: Student) -> Bool in
            // If dataItem matches the searchText, return true to include it
//            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            let name = item.firstname + " " + item.lastname
            return name.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
     Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
             Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
             Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let addview = segue.destination as? AddStudentViewController{
        addview.studentdelegate = self
        }
    }
   
    override func viewWillAppear(_ animated: Bool) {
        
        filteredData = Student.students
        tableview.reloadData()
    }

}
