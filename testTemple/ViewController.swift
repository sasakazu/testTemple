//
//  ViewController.swift
//  testTemple
//
//  Created by 笹倉一也 on 2021/08/08.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
   
    
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://app.rakuten.co.jp/services/api/BooksDVD/Search/20170404?format=json&title=%E3%82%BD%E3%83%8A%E3%83%81%E3%83%8D&artistName=%E5%8C%97%E9%87%8E%E6%AD%A6&booksGenreId=003&applicationId=1024730205059605378")!  //URLを生成
        var request = URLRequest(url: url)               //Requestを生成
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in  //非同期で通信を行う
            guard let data = data else { return }
            do {
                let object = try JSONSerialization.jsonObject(with: data, options: [])  // DataをJsonに変換
                
                print(String(data: data, encoding: .utf8) ?? "")
                
            } catch let error {
                print(error)
            }
        }
        task.resume()
   
    }


}
