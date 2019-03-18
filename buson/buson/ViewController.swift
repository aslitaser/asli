//
//  ViewController.swift
//  buson
//
//  Created by Asli Taser on 18.03.2019.
//  Copyright © 2019 Asli Taser. All rights reserved.
//

import UIKit
import Alamofire_SwiftyJSON
import Alamofire
import SwiftyJSON

struct dolar : Codable {
    
    var USD_TRY: Double
    
}
struct euro : Codable {
    
    let EUR_TRY: Double
}

class ViewController: UIViewController {
    let site1 = "https://free.currencyconverterapi.com/api/v6/convert?q=USD_TRY&compact=ultra&apiKey=4eb8a95c47f62f69c975"
    let site2 = "https://free.currencyconverterapi.com/api/v6/convert?q=EUR_TRY&compact=ultra&apiKey=4eb8a95c47f62f69c975"
    
    var turkLirasi1: Double = 0;
    var flag:Double = 0;
    var flag1:Double = 0;
    
    @IBOutlet weak var dolaroreuro: UILabel!
    @IBOutlet weak var dovizSonucu: UILabel!
   
    @IBAction func dlar(_ sender: UIButton) {
        self.flag = turkLirasi1
       usd(url: site1)
        dolaroreuro.text = "DOLAR"
    }
    
    @IBAction func eurosn(_ sender: UIButton) {
        self.flag1 = turkLirasi1
        euro1(url: site2)
       dolaroreuro.text = "EURO"
    }
    @IBAction func silme(_ sender: UIButton) {
        turkLirasi.text = ""
        dovizSonucu.text = ""
        turkLirasi1 = 0;
        flag1 = 0;
        flag = 0;
        dolaroreuro.text = "USD/EURO"
        
    }
    @IBOutlet weak var turkLirasi: UILabel!
    @IBAction func sayilar(_ sender: UIButton) {
        turkLirasi.text = turkLirasi.text! + String(sender.tag-1)
        turkLirasi1 = Double(turkLirasi.text!)!
        
    }
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    func usd(url:String) {
      
        
        Alamofire.request(url, method: .get).validate().responseData {
            response in
            let json1 = response.data
            do{
                let decoder = JSONDecoder()
                let deger = try decoder.decode(dolar.self, from: json1!)
                if self.flag != 0 {
                var sonuc = (self.flag * deger.USD_TRY)
                
                    self.dovizSonucu.text = self.dovizSonucu.text! + String(sonuc)
                }
                
            }
                
                
                
                
                
               
        
            catch {
                print(error)
            }
            
        }
    
    }
    
    func euro1(url:String) {
        
        
        Alamofire.request(url, method: .get).validate().responseData {
            
            response in
            let json1 = response.data
            do{
                let decoder = JSONDecoder()
                let deger1 = try decoder.decode(euro.self, from: json1!)
                if self.flag1 != 0 {
                var sonuc1 = (self.flag1 * deger1.EUR_TRY)
                
                self.dovizSonucu.text = self.dovizSonucu.text! + String(sonuc1)
                }
            }
                
                
                
                
                
                
            catch {
                print(error)
            }
            
        }
        
}


}
