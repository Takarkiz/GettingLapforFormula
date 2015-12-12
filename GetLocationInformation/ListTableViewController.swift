//
//  ListTableViewController.swift
//  GetLocationInformation
//
//  Created by 澤田昂明 on 2015/12/10.
//  Copyright © 2015年 Takarki. All rights reserved.
//

import UIKit

class ListTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ichiarray.count
    }
    
    
    //各行に表示するセルを返す
    func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath:indexPath) as UITableViewCell
        //セルに表示するテキストを設定する
//        cell.textLabel?.text = "セル" + (indexPath.row).description
        let ichidata = ichiarray[indexPath.row] as! String
        
        return cell
        
    }
    
    //セクションタイトルを設定
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "位置情報" + section.description
    }
    
    //UITableViewDelegateのデリゲートメソッド
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        print("セル\(indexPath.row)が選択された")
    }
    
    //セグエで移動する前に次の画面に値を渡す
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //セグエがshowTimerの時に実行する。
        if segue.identifier == "showTimer"{
            if let indexPath = self.tableView.indexPathForSelectedRow(){
                
            }
        
    }
    

}

}