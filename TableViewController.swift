//
//  TableViewController.swift
//  onlytableview
//
//  Created by bmiit on 04/03/24.
//

import UIKit

class TableViewController: UITableViewController {
    @IBOutlet var addbtn: UIButton!
    

    var product = ["apple","mango","orange"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate  = self
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        cell.textLabel?.text = String(product[indexPath.row])
        return cell
    }
    
    @IBAction func addbtns(_ sender: Any) {
        let alertcontroll = UIAlertController(title: "add item in a list", message: nil, preferredStyle: .alert)
        alertcontroll.addTextField{textfield in textfield.placeholder = "name"}
        
        alertcontroll.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {_ in}))
        
        alertcontroll.addAction(UIAlertAction(title: "Submit", style: UIAlertAction.Style.default, handler: { [self]_ in
            
            let gettext = alertcontroll.textFields?.first?.text
        
            self.product.append(gettext ?? "nil")
            tableView.reloadData();
        }))
        
//        self.present(alertcontroll, animated: true, completion: nil)
   
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
