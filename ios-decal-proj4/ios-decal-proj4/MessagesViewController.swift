//
//  MessagesViewController.swift
//  ios-decal-proj4
//
//  Created by Cesar Villalobos on 12/5/15.
//  Copyright © 2015 Cesar Villalobos, Nag Alluri, Kelly Hong. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var messageTableView: UITableView!
    var messagesArray:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.messageTableView.delegate = self
        self.messageTableView.dataSource = self

        self.messagesArray.append("hi")
        self.messagesArray.append("bye")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // create cell
        let cell = self.messageTableView.dequeueReusableCellWithIdentifier("MessageCell")
//         customize
//        cell?.textLabel?.text = self.messagesArray
        
        // return the cell
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesArray.count
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}