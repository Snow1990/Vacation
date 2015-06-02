//
//  PlaceLIstTableViewController.swift
//  Vacation
//
//  Created by SN on 15/5/18.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class PlaceListTableViewController: UITableViewController {
    
    var placeList = [Place]()
    func loadInitData(){
        let place1 = Place(name: "芒市")
        placeList.append(place1)
        
        let place2 = Place(name: "稻城")
        placeList.append(place2)
        
        let place3 = Place(name: "阳朔")
        placeList.append(place3)
        
        let place4 = Place(name: "兰溪")
        placeList.append(place4)
        
        let place5 = Place(name: "竹海")
        placeList.append(place5)
    }
    struct constants {
        
        static let cellId = "VacationPlace"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitData()
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }
    
    //重载编辑状态
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        tableView.setEditing(editing, animated: true)
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            placeList.removeAtIndex(indexPath.row)
            
            // Delete the row from the table
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(constants.cellId, forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = placeList[indexPath.row].name
        if placeList[indexPath.row].visited{
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }else{
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let place = placeList[indexPath.row]
        place.visited = !place.visited
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        tableView.reloadData()
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue){
        
        if let sourse = segue.sourceViewController as? AddPlaceViewController{
            if let place = sourse.place{
                placeList.append(place)
                tableView.reloadData()
                
            }
        }
        
    }
    
}
