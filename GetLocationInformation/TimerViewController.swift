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
    var index:Int = 0
    var ichi = []
    var num:Int!
    
    //タイマー系のインスタンスの定義
    @IBOutlet var label: UILabel!
    var count: Float = 0.0
    var timer:NSTimer = NSTimer()
    var rap:[Float] = []
    @IBOutlet var rap1:UILabel!
    @IBOutlet var rap2:UILabel!
    @IBOutlet var rap3:UILabel!
    @IBOutlet var rap4:UILabel!
    @IBOutlet var rap5:UILabel!
    @IBOutlet var rap6:UILabel!
    @IBOutlet var rap7:UILabel!
    @IBOutlet var rap8:UILabel!
    @IBOutlet var rap9:UILabel!
    @IBOutlet var rap10:UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        ichi = defaults.arrayForKey("ido")!
//        print("渡された値 緯度:\(ichi[0])経度:\(ichi[1])")
//        lon1 = defaults.doubleForKey("keido")
//        print("渡された経度の値は\(lon1)")
//        lat1 = ichi[0]
//        lon1 = ichi[1]
//        NSLog("渡された緯度：\(ichi[0])\n経度：\(ichi[1])")
        
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
        
        let idosa:Double = latitude - lat1
        let keidosa:Double = longitude - lon1
        var value = idosa
        var value2 = keidosa
        
        if idosa < 0 {
            value = -1 * idosa
        }
        if keidosa < 0 {
            value2 = -1 * keidosa
        }
        
        print("緯度の差が\(value)")
        print("経度の差が\(value2)")
        
        if value <= 0.0001 && value2 <= 0.0001_{
            if !timer.valid && index == 0{
                //タイマーが作動していなかったら
                timer = NSTimer.scheduledTimerWithTimeInterval(0.01,
                    target: self,
                    selector: Selector("up"),
                    userInfo: nil,
                    repeats: true
                )
                index = index + 1
                print("時間計測スタート")
            }else if timer.valid && index >= 1{
                rap.append(count)
//                var i:Int = 0
//                for i = 0; i < 9; i+=1{
//                    if rap[i] < 5{
//                    rap.removeAtIndex(i)
//                    }
//                }
                
                switch index{
                case 1: rap1.text = "\(rap[0])"
                    break
                case 2: rap2.text = "\(rap[1]-rap[0])"
                    break
                case 3: rap3.text = "\(rap[2]-rap[1])"
                    break
                case 4: rap4.text = "\(rap[3]-rap[2])"
                    break
                case 5: rap5.text = "\(rap[4]-rap[3])"
                    break
                case 6: rap6.text = "\(rap[5]-rap[4])"
                    break
                case 7: rap7.text = "\(rap[6]-rap[5])"
                    break
                case 8: rap8.text = "\(rap[7]-rap[6])"
                    break
                case 9: rap9.text = "\(rap[8]-rap[7])"
                    break
                default: rap10.text = "\(rap[9]-rap[8])"
                    break
                
                }
                index++
                print("時間が記録されました")
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
    
    //タイマーを止めるメソッド
    @IBAction func stop(){
        timer.invalidate()
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
