//
//  ViewController.swift
//  testTemple
//
//  Created by 笹倉一也 on 2021/08/08.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var couponBenefit: String = ""
    var couponDeadline: String = ""
    
    @IBOutlet weak var tableview: UITableView!
    
//    var couponBenefit: String = "" {
//         didSet{
//             tableView.reloadData()
//         }
//     }
//     var couponDeadline: String = "" {
//         didSet{
//             tableView.reloadData()
//         }
//     }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//      楽天api(array)
//        let url = URL(string: "https://app.rakuten.co.jp/services/api/BooksDVD/Search/20170404?format=json&title=%E3%82%BD%E3%83%8A%E3%83%81%E3%83%8D&artistName=%E5%8C%97%E9%87%8E%E6%AD%A6&booksGenreId=003&applicationId=1024730205059605378")!
        
//        テスト用
        let url: URL = URL(string: "https://jsonplaceholder.typicode.com/todos/")!
        
               let task: URLSessionTask = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
                
                
                do{
                let couponData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: Any]
                              
                    DispatchQueue.main.async() { () -> Void in
                                       self.couponBenefit = couponData["title"] as! String
//                                       self.couponDeadline = couponData["artistNameKana"] as! String
                                       }
                    
//                    print(String(data: data!, encoding: .utf8) ?? "")
                    
                  print(couponData) // Jsonの中身を表示
                
                }
                    
                   catch {
                    print(error)
            
                   }
                

               })
               task.resume()
        
        tableview.reloadData()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
             //テキストにクーポン特典を設定
             cell.textLabel?.text = self.couponBenefit
             //サブテキストにクーポンの有効期限を設定
             cell.detailTextLabel?.text = "有効期限：" + self.couponDeadline

             return cell
        
        
    }
    
    
    
    
             
}
