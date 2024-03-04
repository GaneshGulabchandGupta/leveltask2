//
//  ReminderSaveVc.swift
//  LEVELtask
//
//  Created by Apple on 04/03/24.
//

import UserNotifications
import UIKit
struct Reminder{
    let title: String?
    let date: Date
    let identifier: String?
}

class ReminderSaveVc: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var Models = [Reminder]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    @IBAction func Addbtn(){
        guard let vc = storyboard?.instantiateViewController(identifier: "ReminderSetVc") as? ReminderSetVc else{
            return
        }
        vc.title = "Set Reminder"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { title, body, date in
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
                let new = Reminder(title: title, date: date, identifier: "id_\(title)")
                self.Models.append(new)
                self.tableView.reloadData()
                
                let content = UNMutableNotificationContent()
                content.title = title
                content.sound = .default
                content.body = body
                
                let targetDate = date
                let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second],
                                                                                                          from: targetDate),
                                                            repeats: false)
                let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
                    if error != nil {
                        print("error")
                    }
                })

            }
        }
        navigationController?.pushViewController(vc, animated: true)
    
    }
    
}


extension ReminderSaveVc: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Models.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Remindercell", for: indexPath)
        cell.textLabel?.text = Models[indexPath.row].title
        let date = Models[indexPath.row].date
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM, dd, YYYY"
        cell.detailTextLabel?.text = formatter.string(from: date)

        cell.textLabel?.font = UIFont(name: "Arial", size: 25)
        cell.detailTextLabel?.font = UIFont(name: "Arial", size: 22)
        return cell
    }
}

