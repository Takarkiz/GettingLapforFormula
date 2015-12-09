//
//  ViewController.swift
//  GetLocationInformation
//
//  Created by 澤田昂明 on 2015/11/28.
//  Copyright © 2015年 Takarki. All rights reserved.
//
//制度はそこそこ出ているもののGPSで緯度経度を取得するやり方だと、多少のずれとれなくなったり、条件の幅を広げるとゆるゆるのタイマーになってしまう。
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var myLocationManager:CLLocationManager!
    @IBOutlet var keido:UILabel!
    @IBOutlet var ido:UILabel!
    let defaults = NSUserDefaults.standardUserDefaults()
    let defaults2 = NSUserDefaults.standardUserDefaults()
    var lat1:Double = 0.0
    var lon1:Double = 0.0
    var ichi:[Double] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 現在地の取得.
        myLocationManager = CLLocationManager()
        lon1 = CLLocationDegrees()
        lat1 = CLLocationDegrees()
        
        myLocationManager.delegate = self
        
        // セキュリティ認証のステータスを取得.
        let status = CLLocationManager.authorizationStatus()
        
        // まだ認証が得られていない場合は、認証ダイアログを表示.
        if(status == CLAuthorizationStatus.NotDetermined) {
            print("didChangeAuthorizationStatus:\(status)");
            // まだ承認が得られていない場合は、認証ダイアログを表示.
            self.myLocationManager.requestAlwaysAuthorization()
        }
        
        // 取得精度の設定.
        myLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 取得頻度の設定.
//        myLocationManager.distanceFilter = 100
        
        
//        self.view.addSubview(getLocation())
        
    }
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        print("didChangeAuthorizationStatus");
        
        // 認証のステータスをログで表示.
        var statusStr = "";
        switch (status) {
        case .NotDetermined:
            statusStr = "NotDetermined"
        case .Restricted:
            statusStr = "Restricted"
        case .Denied:
            statusStr = "Denied"
        case .AuthorizedAlways:
            statusStr = "AuthorizedAlways"
        case .AuthorizedWhenInUse:
            statusStr = "AuthorizedWhenInUse"
        }
        print(" CLAuthorizationStatus: \(statusStr)")
    }
    
    @IBAction func getLocation(){
        
        ichi.removeAll()
        
//        myLocationManager.startUpdatingLocation()
        //アラートを作成
            let firstalert = UIAlertController(
                title:"保存",
                message:"新規の位置情報を保存します",
                preferredStyle:UIAlertControllerStyle.Alert)
            
            firstalert.addAction(
                UIAlertAction(
                    title:"OK",
                    style:.Default,
                    handler:{action in
                        //ボタンが押された時の動作
                        self.ok()
                    }
                )
            )
        
        presentViewController(firstalert, animated:true, completion:nil)
        
    }
    
    //OKを押した時のメソッド(位置情報の取得開始)
    func ok(){
        
        print("OK")
        myLocationManager.startUpdatingLocation()
        print("位置情報の取得を開始")
    }

    
    // 位置情報取得に成功したときに呼び出されるデリゲート.
    func locationManager(manager: CLLocationManager,didUpdateLocations locations: [CLLocation]){
        
        lat1 = manager.location!.coordinate.latitude
        lon1 = manager.location!.coordinate.longitude
        
        // 緯度・経度の表示.
        ido.text = "緯度：\(lat1)"
        ido.textAlignment = NSTextAlignment.Center
        myLocationManager.stopUpdatingLocation()
        keido.text = "経度：\(lon1)"
        keido.textAlignment = NSTextAlignment.Center
        myLocationManager.stopUpdatingLocation()
        
        NSLog("緯度\(lat1),経度\(lon1)")
        
        ichi.append(lat1)
        ichi.append(lon1)
//        print(ichi)
        
        
//        ichiarray.append(lat1)
//        ichiarray.append(lon1)
        
        self.view.addSubview(ido)
        self.view.addSubview(keido)
        
        //NSUserDefaultsを呼び出して保存
        defaults.setDouble(lat1, forKey: "ido")
        defaults.synchronize()
        print("緯度を保存しました")
        
        defaults2.setDouble(lon1, forKey: "keido")
        defaults2.synchronize()
        print("経度を保存しました")

//       //昔"mistake"という鍵で保存したかどうか確認
//        if ((defaults.objectForKey("ido")) != nil){
//
//            //objectsを配列として確定させ、前回の保存内容を格納
//            let objects = defaults.objectForKey("ido") as? [Double]
//            
//            //各名前を格納するための変数を宣言
//            let lat:Double
//            
//            //前回の保存内容が格納された配列の中身を一つずつ取り出す
//            for lat in objects!{
//
//            }
//        }
        
//        //昔"mistake"という鍵で保存したかどうか確認
//        if ((defaults2.objectForKey("keido")) != nil){
//            
//            //objectsを配列として確定させ、前回の保存内容を格納
//            let objects = defaults2.objectForKey("keido") as? [Double]
//            
//            //各名前を格納するための変数を宣言
//            let lon:Double
//            
//            //前回の保存内容が格納された配列の中身を一つずつ取り出す
//            for lon in objects!{
//                
//            }
//        }


        
    }
    
    // 位置情報取得に失敗した時に呼び出されるデリゲート.
    func locationManager(manager: CLLocationManager,didFailWithError error: NSError){
        print("error")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let next = segue.destinationViewController as! TimerViewController
        next.ichi = self.ichi
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

