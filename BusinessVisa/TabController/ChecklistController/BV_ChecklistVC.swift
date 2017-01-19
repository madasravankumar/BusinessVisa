//
//  BV_ChecklistVC.swift
//  BusinessVisa
//
//  Created by Srinivasa Reddy on 08/12/16.
//  Copyright © 2016 Gemini. All rights reserved.
//

import UIKit

//
// MARK: - Section Data Structure
//
struct Section {
    var checkListData: NSDictionary!
    
    init(checkListData: NSDictionary) {
        self.checkListData = checkListData
    }
}


class BV_ChecklistVC: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    @IBOutlet weak var table: UITableView!
    
    var sections = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let jsonObject = BV_JsonData.sharedInstance.jsonObject
        let listOfItems: NSArray = jsonObject.object(forKey: "ListOfItems") as! NSArray
        
        for item in listOfItems  {
            let checkListItem: Section = Section(checkListData: item as! NSDictionary);
            sections.append(checkListItem)
        }
        self.title = jsonObject["CheckList"] as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "detailsCell" {
            if let indexPath = self.table.indexPath(for: sender as! UITableViewCell) {
                let sectionData: Section = self.sections[indexPath.row]
                let detailsVc = segue.destination as! BV_DetailsViewController
                detailsVc.sectionsData = sectionData.checkListData.object(forKey: "ListOfItems") as! NSArray
            }
        }
    }

    // MARK: - UITableViewDataSource Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "checklistCell", for: indexPath) as UITableViewCell
        
        let checkListItem: Section = sections[indexPath.row]
        let itemDict: NSDictionary = checkListItem.checkListData as NSDictionary
        let imageView = cell.contentView.viewWithTag(10) as! UIImageView
        let titleLbl = cell.contentView.viewWithTag(20) as! UILabel
        
        titleLbl.text = itemDict["title"] as! String?
        imageView.image = UIImage(named: itemDict.object(forKey: "image") as! String)
        
        return cell
        
    }

    // MARK: - UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
}


