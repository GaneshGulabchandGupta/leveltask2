//
//  ReminderSetVc.swift
//  LEVELtask
//
//  Created by Apple on 04/03/24.
//
import UIKit
 

class ReminderSetVc: UIViewController {
    
    
    @IBOutlet weak var Titletf: UITextField!
    
    @IBOutlet weak var Bodytf: UITextField!
    
    @IBOutlet var setdate: UIDatePicker!
    
    public var completion: ((String, String, Date) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTapped))
    }
    
     @objc func saveTapped(_ sender: UIButton) {
        if let titleText = Titletf.text, !titleText.isEmpty,
            let bodyText = Bodytf.text, !bodyText.isEmpty{
            
            let targetDate = setdate.date
            completion?(titleText, bodyText, targetDate)
            
        }
    }
    
}
