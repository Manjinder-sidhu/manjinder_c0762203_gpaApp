//
//  GPAViewController.swift
//  manjinder_c0762203_gpaApp
//
//  Created by Manjinder Aulakh on 2019-11-15.
//  Copyright © 2019 Manjinder kaur. All rights reserved.
//

import UIKit

class GPAViewController: UIViewController {
    
    var GpaDelegate: SemesterTableViewController?
    var curIndex = -1
    var GPA : Double = 0.0
    
    
    @IBOutlet weak var course1Label: UILabel!
    @IBOutlet weak var course2Label: UILabel!
    @IBOutlet weak var Course3Label: UILabel!
    @IBOutlet weak var course4label: UILabel!
    @IBOutlet weak var course5Label: UILabel!
    
    
    @IBOutlet weak var Course1TF: UITextField!
    @IBOutlet weak var Course2TF: UITextField!
    @IBOutlet weak var Course3TF: UITextField!
    @IBOutlet weak var Course4TF: UITextField!
    @IBOutlet weak var Course5TF: UITextField!
    
    @objc func viewTapped(){
       Course1TF.resignFirstResponder()
       Course2TF.resignFirstResponder()
         Course3TF.resignFirstResponder()
         Course4TF.resignFirstResponder()
         Course5TF.resignFirstResponder()
    }
    
    @IBOutlet weak var GPALabel: UILabel!
    
    var courses = [String]()
    var Credithours = [Double]()
    var GPAForEach = [Double]()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
               self.view.addGestureRecognizer(tapgesture)
        // Do any additional setup after loading the view.
        
    }
   
    func getGPA(){
        courses.append(Course1TF.text!)
         courses.append(Course2TF.text!)
         courses.append(Course3TF.text!)
         courses.append(Course4TF.text!)
         courses.append(Course5TF.text!)
        
        for i in courses{
            GPAForEach.append(GPAperSubject(points: Double(i)!))
        }
        
        print(courses)
        print(GPAForEach)
    }
    
    func getCreditHours(){
        Credithours.append((Double(String(course2Label.text!.last!))!))
        Credithours.append((Double(String(course2Label.text!.last!))!))
        Credithours.append((Double(String(Course3Label.text!.last!))!))
        Credithours.append((Double(String(course4label.text!.last!))!))
        Credithours.append((Double(String(course5Label.text!.last!))!))
        print(Credithours)
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        course1Label.text = Semesters.Semester[(GpaDelegate?.curIndex)!].semesters[0]
         course2Label.text = Semesters.Semester[(GpaDelegate?.curIndex)!].semesters[1]
        Course3Label.text = Semesters.Semester[(GpaDelegate?.curIndex)!].semesters[2]
         course4label.text = Semesters.Semester[(GpaDelegate?.curIndex)!].semesters[3]
         course5Label.text = Semesters.Semester[(GpaDelegate?.curIndex)!].semesters[4]
       
    }
    
    
    func GPAperSubject(points : Double) -> Double {
//        let Convert = Double(points)
        switch(points){
        case 0..<50:
          return   0.0
        case 50...59:
           return  1.0
        case 60...62:
          return   1.7
        case 63...66:
           return  2.0
        case 67...69:
          return   2.3
        case 70...76:
          return   3.0
        case 77...79:
          return   3.2
        case 80...86:
           return  3.5
        case 87...93:
           return  3.7
        case 94...100:
          return  4.0
        default:
            break
            
        }
        return 0.0
        
    }
    
    
    @IBAction func calculate(_ sender: UIButton) {
                    getGPA()
                    getCreditHours()
        
         let s1 = Credithours[0] * GPAForEach[0]
         let s2 = Credithours[1] * GPAForEach[1]
         let s3 = Credithours[2] * GPAForEach[2]
         let s4 = Credithours[3] * GPAForEach[3]
         let s5 = Credithours[4] * GPAForEach[4]
        
        let sum = Credithours.reduce(0, +)
        
        let result = ((s1 + s2 + s3 + s4 + s5) / sum)
        GPALabel.text =  String(format: "%.1f",result) + "/4"
        GpaDelegate?.rightdetail(text: GPALabel.text!)
        print(result)
        
        }
        
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will ofte4n want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
}
