//
//  ViewController.swift
//  GetLocationInformation
//
//  Created by 澤田昂明 on 2015/11/28.
//  Copyright © 2015年 Takarki. All rights reserved.
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 現在地の取得.
        myLocationManager = CLLocationManager()
        
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
        myLocationManager.distanceFilter = 100
        
        
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
        
        //位置情報がまだ端末に保存されていない状態
        if lat1 == 0.0 && lon1 == 0.0{
            
            let firstalert = UIAlertController(
                title:"保存",
                message:"新規の位置情報を保存します",
                preferredStyle:UIAlertControllerStyle.Alert)
            
            firstalert.addAction(UIAlertAction(
                title:"OK",
                style:.Default,
                handler:{ action in print("OK")}))
        }
            
        //以前に端末に保存した位置情報がある時
        else{
            let afterAlert = UIAlertController(
                title:"以前に保存された位置情報があります",
                message:"以前の位置情報に上書きしますか？",
                preferredStyle:UIAlertControllerStyle.Alert)
            
            afterAlert.addAction(UIAlertAction(
                title:"上書き保存",
                style:.Default,
                handler:{action in self.ok()}))
            afterAlert.addAction(UIAlertAction(
                title:"Cancel",
                style:.Default,
                handler:{action in self.cancel()}))
        }
                
        
    }
    //OKを押した時のメソッド(位置情報の取得開始)
    func ok(){
        defaults.removeObjectForKey("ido")
        defaults2.removeObjectForKey("keido")
        
        myLocationManager.startUpdatingLocation()
        print("OK")
    }
    //キャンセル時のメソッド(位置情報を取得しない)
    func cancel(){
        print("cancel")
    }
    

    
    // 位置情報取得に成功したときに呼び出されるデリゲート.
    func locationManager(manager: CLLocationManager,didUpdateLocations locations: [CLLocation]){
        
        // 緯度・経度の表示.
        ido.text = "緯度：\(manager.location!.coordinate.latitude)"
        ido.textAlignment = NSTextAlignment.Center
        
        keido.text = "経度：\(manager.location!.coordinate.longitude)"
        keido.textAlignment = NSTextAlignment.Center
        
        lat1 = manager.location!.coordinate.latitude
        lon1 = manager.location!.coordinate.longitude
        
        
//        ichiarray.append(lat1)
//        ichiarray.append(lon1)
        
        self.view.addSubview(ido)
        self.view.addSubview(keido)
        
        //NSUserDefaultsを呼び出して、Arrayに保存
        defaults.setDouble(lat1, forKey: "ido")
        defaults.synchronize()
        print("緯度を登録しました")
        
        defaults2.setDouble(lon1, forKey: "keido")
        defaults2.synchronize()
        print("経度を保存しました")
        
//        //昔"mistake"という鍵で保存したかどうか確認
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
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

