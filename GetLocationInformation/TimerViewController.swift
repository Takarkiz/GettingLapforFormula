//
//  TimerViewController.swift
//  GetLocationInformation
//
//  Created by 澤田昂明 on 2015/12/01.
//  Copyright © 2015年 Takarki. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    let defaults2 = NSUserDefaults.standardUserDefaults()
    var lat1:Double = 0.0
    var lot1:Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        lat1 = defaults.doubleForKey("ido")
        print("緯度の値は\(lat1)")
        lot1 = defaults.doubleForKey("keido")
        print("経度の値は\(lot1)")
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
//                //昔"mistake"という鍵で保存したかどうか確認
//                if ((defaults.objectForKey("ido")) != nil){
//        
//                    //objectsを配列として確定させ、前回の保存内容を格納
//                    let objects = defaults.objectForKey("ido") as? [Double]
//        
//                    //各名前を格納するための変数を宣言
//                    let lat:Double
//        
//                    //前回の保存内容が格納された配列の中身を一つずつ取り出す
//                    for lat in objects!{
//        
//                    }
//               }
        
//                //昔"mistake"という鍵で保存したかどうか確認
//                if ((defaults2.objectForKey("keido")) != nil){
//        
//                    //objectsを配列として確定させ、前回の保存内容を格納
//                    let objects = defaults2.objectForKey("keido") as? [Double]
//        
//                    //各名前を格納するための変数を宣言
//                    let lon:Double
//                    
//                    //前回の保存内容が格納された配列の中身を一つずつ取り出す
//                    for lon in objects!{
//                        
//                    }
//                }

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
