//
//  ViewController.swift
//  LEVELtask
//
//  Created by Apple on 01/03/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var explorebtn: UIButton!
    @IBOutlet weak var blanklbl: UILabel!
    @IBOutlet weak var Remindbtn1: UIButton!
    
    @IBOutlet weak var levellbl: UILabel!
    @IBOutlet weak var proimage: UIImageView!
    @IBOutlet weak var ExploreView: UIView!
    @IBOutlet weak var collectionV: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the custom cell XIBs for UICollectionView and UITableView
        let meditationCellNib = UINib(nibName: "MeditationCell", bundle: nil)
        collectionV.register(meditationCellNib, forCellWithReuseIdentifier: "cell")
        
        let routineCellNib = UINib(nibName: "RoutineCell", bundle: nil)
        tableView.register(routineCellNib, forCellReuseIdentifier: "cell2")
        
        ExploreView.layer.cornerRadius = 10
        ExploreView.layer.borderWidth = 2.0
        ExploreView.layer.borderColor = UIColor.white.cgColor
        ExploreView.layer.masksToBounds = true
       
        
        // Apply corner radius and border to levelView
        levelView.layer.cornerRadius = 10
        levelView.layer.borderWidth = 2.0
        levelView.layer.borderColor = UIColor.systemBlue.cgColor
        levelView.layer.masksToBounds = true
        
     
        
      
        proimage.layer.cornerRadius = 10
        proimage.layer.borderWidth = 2.0
        proimage.layer.borderColor = UIColor.systemBlue.cgColor
        proimage.layer.masksToBounds = true
        
     
        levellbl.layer.cornerRadius = 10
        levellbl.layer.masksToBounds = true
        
        explorebtn.layer.cornerRadius = 10
        explorebtn.layer.borderWidth = 2.0
        explorebtn.layer.borderColor = UIColor.white.cgColor
        explorebtn.layer.masksToBounds = true
        
        Remindbtn1.layer.cornerRadius = 10
        Remindbtn1.layer.borderWidth = 2.0
        Remindbtn1.layer.borderColor = UIColor.white.cgColor
        Remindbtn1.layer.masksToBounds = true
        
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MeditationCell
        
      
        cell.lbl1.text = "Meditation Coach"
        cell.lbl2.text = "Muskan"
        
        if indexPath.item == 0 {
            cell.img1.image = UIImage(named: "gimage2")
        } else if indexPath.item == 1 {
            cell.img1.image = UIImage(named: "gimage")
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }

    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! RoutineCell
        
        cell.lbl3.text = nil
        cell.lbl4.text = nil
        cell.img2.image = nil
        
        // Configure the cell with your data or content
        if indexPath.item == 0 {
            cell.lbl3.text = "Gratitude"
            cell.lbl4.text = "Journal"
            cell.img2.image = UIImage(named: "Stairimage")
        } else if indexPath.item == 1 {
            cell.lbl3.text = "For Inner Peace"
            cell.lbl4.text = "Music"
            cell.img2.image = UIImage(named: "footballimage")
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Set the height for each cell, including spacing
        return 150.0 // Adjust the height based on your requirements
    }
    @IBAction func Reminderbtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "ReminderSaveVc") as! ReminderSaveVc
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
