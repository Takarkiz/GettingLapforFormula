//
//  ListTableViewController.swift
//  GetLocationInformation
//
//  Created by 澤田昂明 on 2015/12/10.
//  Copyright © 2015年 Takarki. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
    
    //セクションごとの行数を返す
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    //セクション数
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //各行に表示するセルを返す
    override func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath:indexPath) as UITableViewCell
        //セルに表示するテキストを設定する
        cell.textLabel?.text = "セル" + (indexPath.row).description
        cell.detailTextLabel?.text = "サブタイトル"
        return cell
        
    }
    
    //セクションタイトルを設定
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "位置情報" + section.description
    }
    
    //UITableViewDelegateのデリゲートメソッド
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        print("セル\(indexPath.row)が選択された")
    }
    

}
