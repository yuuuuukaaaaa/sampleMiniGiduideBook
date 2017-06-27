//
//  secondViewController.swift
//  sampleMiniGuidebook
//
//  Created by MacUser on 2017/06/19.
//  Copyright © 2017年 Yuka Saito. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

//    @IBOutlet weak var myLable: UILabel!
    
    @IBOutlet weak var myTaxtView: UITextView!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var myMapView: MKMapView!
    var sIndex = -1
    
    var sText = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        myLable.text = sText
        
        //プロパティリストファイルパスを取得 自分のプロジェクトの中にある
        let filePath = Bundle.main.path(forResource:"placelist", ofType: "plist")
        
        //プロパティリストからdataを取得（ディクショナリー型）
        let dic = NSDictionary(contentsOfFile: filePath!)
        
        //指定されたエリア名をキーにして、画面に必要な情報を取得
        let detailInfo:NSDictionary = dic?[sText] as! NSDictionary
        
        print(detailInfo["image"] as! String)
        print(detailInfo["description"] as! String)
        
        
        
        print("前の画面から選択された行:\(sIndex)")
        // Do any additional setup after loading the view.
        
//        myImageView.image = UIImage(named: detailInfo["image"] as! String)
        
        myTaxtView.text = detailInfo["description"] as! String
        myImageView.image = UIImage(named: detailInfo["image"] as! String)
        
        
        let long:Double = Double(detailInfo["description"] as! String)
        let lati:long
        
        
        //縮尺を設定
        let span = MKCoordinateSpanMake(0.1,0.1)
        //MapViewに範囲オブジェクトを設定
        let region = MKCoordinateRegionMake(coodinate,span)
        //アヤラにピンを立てる
        myMapView.setRegion(region, animated: true)
        
        
        //ピンの生成
        let myPin = MKPointAnnotation()
        //myPin.coordine = CLLocationCoordinate2DMake(10.317347,123.905759)
        
        //座標の設定
        myPin.coordinate = coodinate
        //タイトル、サブタイトルを設定
        
        //mapViewにピンを追加
        myMapView.addAnnotation(myPin)
        

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
