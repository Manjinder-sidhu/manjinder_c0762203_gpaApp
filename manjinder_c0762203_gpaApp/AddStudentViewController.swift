//
//  AddStudentViewController.swift
//  manjinder_c0762203_gpaApp
//
//  Created by Manjinder Aulakh on 2019-11-14.
//  Copyright © 2019 Manjinder kaur. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController {

    var studentdelegate : StudentListTableViewController?
    
    @IBOutlet weak var FirstNameTextfield: UITextField!
    
    @IBOutlet weak var LastNameTextfield: UITextField!
    
    @IBOutlet weak var StudentIDtextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
               self.view.addGestureRecognizer(tapgesture)
//        let backButton = UIBarButtonItem()
//            backButton.title = "Students"
//            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
//        navigationItem.backBarButtonItem?.title = "Students"
        // Do any additional setup after loading the view.
    }
    
    @objc func viewTapped(){
        FirstNameTextfield.resignFirstResponder()
       LastNameTextfield.resignFirstResponder()
        StudentIDtextfield.resignFirstResponder()
    }

    
    // to save the new student
    
    @IBAction func Save(_ sender: UIButton) {
        if FirstNameTextfield.text == "" || LastNameTextfield.text == "" || StudentIDtextfield.text == "" {
            let alertcontroller3 = UIAlertController(title: "New Contact ", message: "May You have empty textfield", preferredStyle: .alert)
             let CancelAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alertcontroller3.addAction(CancelAction)
                       self.present(alertcontroller3, animated: true, completion:  nil)
            
        }
        
        
       else if FirstNameTextfield.text != nil && LastNameTextfield.text != nil && StudentIDtextfield.text != nil{
        
        
        let alertcontroller = UIAlertController(title: "save student", message: "Are you Sure", preferredStyle: .alert)
        let CancelAction = UIAlertAction(title: "No way", style: .cancel, handler: nil)
        CancelAction.setValue(UIColor.brown, forKey: "titleTextColor")
        let AddItemAction = UIAlertAction(title: "yes sure", style: .default)
        {
            (action) in
            
            let alertcontroller2 = UIAlertController(title: "New Contact saved", message: "\(self.FirstNameTextfield.text!) is now a student", preferredStyle: .alert)
                   
            let okAction = UIAlertAction(title: "ok", style: .default) { (action) in
                let firstname = self.FirstNameTextfield.text!
                           let lastname = self.LastNameTextfield.text!
                           let studentID = self.StudentIDtextfield.text!
                       let student1 = Student(firstname: firstname, lastname: lastname, studentID: studentID)
                           Student.students.append(student1)
                       
                           self.FirstNameTextfield.text = nil
                           self.LastNameTextfield.text = nil
                           self.StudentIDtextfield.text = nil
//                       print(Student.students)
            }
        
            alertcontroller2.addAction(okAction)
            self.present(alertcontroller2, animated: true, completion:  nil)
        }
            
        alertcontroller.addAction(CancelAction)
        alertcontroller.addAction(AddItemAction)
        self.present(alertcontroller, animated: true, completion:  nil)
        }
 }
        
    
    
    override func viewWillDisappear(_ animated: Bool) {
        studentdelegate?.tableView.reloadData()
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
