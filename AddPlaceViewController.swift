//
//  AddPlaceViewController.swift
//  Vacation
//
//  Created by SN on 15/5/18.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class AddPlaceViewController: UIViewController {
    var place: Place?
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if sender as! NSObject == doneButton{
            if !textField.text.isEmpty{
                place = Place(name: textField.text)
            }
        }
    }

}
