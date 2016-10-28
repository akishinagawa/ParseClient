//
//  ChatViewController.swift
//  ParseClient
//
//  Created by Akifumi Shinagawa on 10/27/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var messageArray: [AnyObject] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func sendButton(_ sender: AnyObject) {
        
        let message = PFObject(className:"MessageSF")
        
        message["text"] = textField.text
        message.saveInBackground(block: {
            (success: Bool, error: Error?) -> Void in
            if (success) {
                print("Successfully tweeted!")
            } else {
                NSLog("tweet failed")
                // There was a problem, check error.description
            }
        })

        
    }
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
//        tableView.reloadData() <<-------we shouldn't reload at this point since there is no data yet
     
        
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)
        
        
    }
    
    
    
    func onTimer() {
        
        // load message
        
        print("onTimer ---------")
        
        
        
        let query = PFQuery(className: "MessageSF")
        
        query.order(byAscending: "createdAt")
        query.findObjectsInBackground(block: {(objects: [PFObject]?, error:Error?) -> Void in
        
            if error == nil {
                
                if let objects = objects {
                    
                    var temp : [AnyObject] = []
                    for object in objects {
                        
                        print(object)
                        temp.append(object["text"] as AnyObject)
                        self.messageArray.append(object["test"] as AnyObject)
                        
                    }
                    
//                    self.messageArray = temp
                    
                    
                }
                
                self.tableView.reloadData()
                
            }
            else {
                print("--------error in query")
                
                
               
                
                
            }
        
        })
        
        
        
        
        
        
        
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatViewCell", for: indexPath) as! ChatViewCell
        
        if(messageArray.count > 0) {
            
            cell.chatViewMessageLabel.text = messageArray[indexPath.row] as? String
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 20
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
