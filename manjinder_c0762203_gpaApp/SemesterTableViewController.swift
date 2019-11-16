//
//  SemesterTableViewController.swift
//  manjinder_c0762203_gpaApp
//
//  Created by Manjinder Aulakh on 2019-11-16.
//  Copyright © 2019 Manjinder kaur. All rights reserved.
//

import UIKit

class SemesterTableViewController: UITableViewController {

   
   var curIndex = -1
    var GpaAtRight = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let Sem_name1 = Semesters(semestername: "Semester 1",  semesters : ["MAD 3004","MAD 3115", "MAD 2303", "MAD 3463", "MAD 3125"])
        let Sem_name2 = Semesters(semestername: "Semester 2",  semesters : ["MAD 3005","MAD 3115", "MAD 2303", "MAD 3463", "MAD 3125"])
         let Sem_name3 = Semesters(semestername: "Semester 3",  semesters : ["MAD 3006","MAD 3115", "MAD 2303", "MAD 3463", "MAD 3125"])
        Semesters.Semester.append(Sem_name1)
        Semesters.Semester.append(Sem_name2)
        Semesters.Semester.append(Sem_name3)
        
        
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
        return Semesters.Semester.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Semesters")

        // Configure the cell...
        
        cell?.textLabel?.text = Semesters.Semester[indexPath.row].semestername
        cell?.detailTextLabel?.text = GpaAtRight
        
        return cell!
    }
    
    func rightdetail(text : String){
        GpaAtRight = text
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
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
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

    if let detailView = segue.destination as? GPAViewController{
        detailView.GpaDelegate = self
        if let tableviewcell = sender as? UITableViewCell {
            if let index = tableView.indexPath(for: tableviewcell)?.row {
               
                curIndex = index
            }
        }
           }

    }
    

}
