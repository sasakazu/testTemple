//
//  ViewController.swift
//  testTemple
//
//  Created by 笹倉一也 on 2021/08/08.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

   
//    楽天レシピ
//    struct ResultList: Codable {
//
//        let result: [User]
//
//    struct User: Codable {
//        let foodImageUrl :String
//        let recipeTitle  :String
//    }
//    }
    
    
//rakuten books
    struct SerchBookKList: Codable {
        
        var count: Int
        var Items: [ItemDic]?

    }

    struct ItemDic : Codable{
        var Item : ItemInfo?

    }

    struct ItemInfo: Codable {
        var title :String
        var smallImageUrl :String
        var salesDate :String

    }
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRApi()
    
    
        
    }
    

//    楽天レシび
//    private func getRApi(){
//              guard let url = URL(string: "https://app.rakuten.co.jp/services/api/Recipe/CategoryRanking/20170426?format=json&applicationId=1024730205059605378") else {return}

        
//        楽天ブックス
        private func getRApi(){
                  guard let url = URL(string: "https://app.rakuten.co.jp/services/api/BooksDVD/Search/20170404?format=json&artistName=%E5%8C%97%E9%87%8E%E6%AD%A6&booksGenreId=003&applicationId=1024730205059605378") else {return}

        
        
              let task = URLSession.shared.dataTask(with: url) { (data, response, err)in
                  if let err = err {
                      print("情報の取得に失敗しました。:", err)
                      return
                  }
                  if let data = data{
                      do{
                        let resultList = try JSONDecoder().decode(SerchBookKList.self, from: data)
                          print("json: ", resultList)
                      }catch(let err){
                           print("情報の取得に失敗しました。:", err)
                      }
                  }
              }
              task.resume()
          }
      

}
