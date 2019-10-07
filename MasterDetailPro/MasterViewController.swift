//
//  MasterViewController.swift
//  MasterDetailPro
//
//  Created by RTC-HN154 on 10/7/19.
//  Copyright © 2019 RTC-HN154. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    var cellArray = [String]()
    
    var collapse = true
    override func viewDidLoad() {
        super.viewDidLoad()
        self.splitViewController?.delegate = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertCell))
    }

    // MARK: - Table view data source
    @objc func insertCell() {
        cellArray.append("Cell \(cellArray.count + 1)")
        let indexPath = IndexPath(row: cellArray.count - 1, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cellArray.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = cellArray[indexPath.row]
        // Configure the cell...

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                 let detailVC = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                detailVC.textCell = cellArray[indexPath.row]
            }
        }
    }
  

   
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            cellArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
}


// MARK: Điều khiển hiển thị Master khi load lên
extension MasterViewController: UISplitViewControllerDelegate {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        collapse = false
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return collapse
    }
}
