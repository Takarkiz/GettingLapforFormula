//
//  ListTableViewController.swift
//  GetLocationInformation
//
//  Created by 澤田昂明 on 2015/12/10.
//  Copyright © 2015年 Takarki. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController{
    /*UITableViewDataSource, UITableViewDelegate */
    
    var defaults = NSUserDefaults.standardUserDefaults()
    var defaults2 = NSUserDefaults.standardUserDefaults()
    var ichiarray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ichiarray = defaults.arrayForKey("ido")!
        print("渡された値 緯度:\(ichiarray[0])経度:\(ichiarray[1])")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //セクションごとの行数を返す
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    //セクション数
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 0
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
