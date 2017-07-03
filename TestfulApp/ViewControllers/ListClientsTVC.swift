//
//  ListClientsTVC.swift
//  TestfulApp
//
//  Created by Evgeniy Tkachenko on 03.07.17.
//  Copyright © 2017 Big Dig. All rights reserved.
//

import UIKit
import Foundation

class ListClientsTVC: UITableViewController {
    
    var listClients: NSArray = NSArray()

    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
        
        getListClients()
    }
    
    // MARK: - Get List Clients
    
    func getListClients() {
        listClients = NSArray(contentsOfFile: Bundle.main.path(forResource: "ListClients", ofType: "plist")!)!
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listClients.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClientLastMessageCell", for: indexPath) as! ClientLastMessageCell
        
        let client: NSDictionary = listClients[indexPath.row] as! NSDictionary
        
        cell.lbName.text = client["name"] as? String
        cell.lbMessage.text = client["message"] as? String
        
        if let numberUnreadMessages = client["new_messages"] as? Int {
            if numberUnreadMessages > 0 {
                cell.lbNumberUnreadMessages.isHidden = false
                cell.lbNumberUnreadMessages.text = "\(numberUnreadMessages)"
            } else {
                cell.lbNumberUnreadMessages.isHidden = true
            }
        }
        
        let dateformatter = DateFormatter()
        dateformatter.timeStyle = DateFormatter.Style.short
        let stringDate = client["date"] as! String
        let date = Date(timeIntervalSince1970: TimeInterval(exactly: Int(stringDate)!)!)
        cell.lbTime.text = dateformatter.string(from: date)

        DispatchQueue.global(qos: .utility).async{
            if let image = UIImage(named: client["avatar"] as! String) {
                DispatchQueue.main.async {
                    cell.imPhoto.backgroundColor = UIColor.clear
                    cell.imPhoto.image = image
                }
            }
        }

        return cell
    }
}
