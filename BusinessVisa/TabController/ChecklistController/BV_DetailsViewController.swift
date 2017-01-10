//
//  BV_DetailsViewController.swift
//  BusinessVisa
//
//  Created by Sravan Kumar on 10/01/17.
//  Copyright © 2017 Gemini. All rights reserved.
//

import UIKit

class BV_DetailsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var sectionsData: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

extension BV_DetailsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ((sectionsData.object(at: section) as! NSDictionary).object(forKey: "items") as! NSArray).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath) as! BV_DetailsTableViewCell
        
        let rowData: NSDictionary = ((sectionsData.object(at: indexPath.section) as! NSDictionary).object(forKey: "items") as! NSArray).object(at: indexPath.row) as! NSDictionary
        cell.update(cellData: rowData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionItem: NSDictionary = sectionsData.object(at: section) as! NSDictionary
        return sectionItem.object(forKey: "title") as! String?
    }
}

extension BV_DetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
