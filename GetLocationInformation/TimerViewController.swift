//
//  TimerViewController.swift
//  GetLocationInformation
//
//  Created by 澤田昂明 on 2015/12/01.
//  Copyright © 2015年 Takarki. All rights reserved.
//

import UIKit
import CoreLocation

class TimerViewController: UIViewController, CLLocationManagerDelegate {
    
    //現在の位置情報の取得にはCLLocationManagerを使用
    var myLocationManager: CLLocationManager!
    var latitude: CLLocationDegrees!
    var longitude: CLLocationDegrees!
    let defaults = NSUserDefaults.standardUserDefaults()
    let defaults2 = NSUserDefaults.standardUserDefaults()
    var lat1:Double = 0.0
    var lon1:Double = 0.0
    
    //タイマー系のインスタンスの定義
    @IBOutlet var label: UILabel!
    var count: Float = 0.0
    var timer:NSTimer = NSTimer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lat1 = defaults.doubleForKey("ido")
        print("渡された緯度の値は\(lat1)")
        lon1 = defaults.doubleForKey("keido")
        print("渡された経度の値は\(lon1)")
        
        //フィールドの初期化
        myLocationManager = CLLocationManager()
        longitude = CLLocationDegrees()
        latitude = CLLocationDegrees()
        
        //CLLocationManagerをdelegateに設定
        myLocationManager.delegate = self
        
        //位置情報取得の許可を求めるメッセージの取得
        myLocationManager.requestAlwaysAuthorization()
        //位置情報の精度を指定
        myLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        //位置情報取得間隔を指定。指定した値移動したら位置情報を更新する
        myLocationManager.distanceFilter = 1
        
        //GPSの使用を開始する
        myLocationManager.startUpdatingLocation()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
                // Dispose of any resources that can be recreated.
    }
    
    
    //位置情報取得成功時に実行される関数
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation:CLLocation, fromLocation oldLocation: CLLocation){
        //取得した緯度がnewLocation.corrdinate.latitudeに格納される
        latitude = newLocation.coordinate.latitude
        //取得した経度がnewLocation.coordinate.longtitudeに格納されている
        longitude = newLocation.coordinate.longitude
        
        //取得した緯度経度をLogに表示
        NSLog("緯度:\(latitude), 経度:\(longitude)")
        
        if latitude == lat1 && longitude == lon1{
            if !timer.valid{
                //タイマーが作動していなかったら
                timer = NSTimer.scheduledTimerWithTimeInterval(0.01,
                    target: self,
                    selector: Selector("up"),
                    userInfo: nil,
                    repeats: true
                )
            }else{
                //タイマーが動いていた時
                timer.invalidate()
            }
        }
    }
    
    //タイマーを進ませるメソッド
    func up(){
        //countを0.01(時間経過分)足す
        count = count + 0.01
        //ラベルい小数点以下2桁まで表示
        label.text = String(format:"%.2f",count)
    }
    
    //位置情報取得失敗時に実行される関数
    func locationManager(manager:CLLocationManager, didFailWithError error:NSError){
        NSLog("Error")
    }
    
    //NSUserDefaultの確認、今はコメントアウト
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

    



}
