//
//  ViewController.swift
//  sampleMiniGuidebook
//
//  Created by MacUser on 2017/06/19.
//  Copyright © 2017年 Yuka Saito. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
//    var viewArray = ["Ayara","Moalboal"]
    var placeList:[String] = []
    
    
    //TODO:二枚目の画面を作成し、タップされたエリア名を今井目の画面に表示してください。
    //ヒント:エリア名をそのまま2枚めへ渡してください！（数字ではなく文字で！！）
    var  selectedIndex = -1
    
    

    
    override func viewDidLoad() {
        //プロパティリストから読み込んだdataを格納する配列
        //[String] -> 中身がString型のデータが入っている配列
        super.viewDidLoad()
        
        //プロパティリストファイルパスを取得 自分のプロジェクトの中にある
        let filePath = Bundle.main.path(forResource:"placelist", ofType: "plist")
        
        //プロパティリストからdataを取得（ディクショナリー型）
        let dic = NSDictionary(contentsOfFile: filePath!)
        
        //TableViewで扱いやすい配列（エリア名の残っている配列）を作成
        //高速列挙で値を取得
        for (key,data) in dic! {
            print("KEY=\(key)")
            print("DATA=\(data)")
            
            placeList.append(key as! String)
        }
        
        //printでは入れ地の中身を確認（念のため）
        print(placeList)
        
        
        
        
    // Do any additional setup after loading the view, typicallyfrom a nib.
    //TODO:テーブルビューを配置して、配列の中にある
    }
//セルをタップした時、セグエを指定して画面遷移
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeList.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    cell.textLabel?.text = placeList[indexPath.row]
        
    return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
     
        
        self.performSegue(withIdentifier: "showDetail", sender: nil)
        
    }
    
    //セグエを使って別の画面に移動するときに発動
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //移動先の画面のインスタンスを作成 destination行き先
        let dvc = segue.destination as! secondViewController
        
        //移動先の画面のプロパティエリア名を指定する  
        //dvc.myLabel.text
        dvc.sText = placeList[selectedIndex]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

