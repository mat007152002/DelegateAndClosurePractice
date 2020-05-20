//
//  ViewController.swift
//  DelegateAndClosurePractice
//
//  Created by 旌榮 凌 on 2020/5/20.
//  Copyright © 2020 旌榮 凌. All rights reserved.
//

import UIKit

class drink : NSObject{
    var name : String = ""
    var sweetness : String = ""
    var sweetSelectIndex : Int = 0
    var ice : String = ""
    var iceSelectIndex : Int = 0
    var price : Int = 0
}

class ViewController: UIViewController {

    @IBOutlet var showOrderLabel: UILabel!
    @IBOutlet var startBtn: UIButton!
    @IBOutlet var completeBtn: UIBarButtonItem!
    var myDrink : drink!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showOrderLabel.text = "您尚未點餐 \n請點選開始點餐進行點餐作業"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if(myDrink != nil) {
            startBtn.setTitle("修改訂單", for: .normal)
            showOrderLabel.text = String(format:"您的飲料：%@ \n甜度為：%@ \n冰量為：%@ \n售價：%d", myDrink.name, myDrink.sweetness, myDrink.ice, myDrink.price)
            completeBtn.isEnabled = true
        }
        else{
            startBtn.setTitle("開始點餐", for: .normal)
            completeBtn.isEnabled = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "OrderSegue") {
            let VC = segue.destination as! orderViewController
            VC.myDrink = myDrink
            VC.delegate = self
        }
    }
    
    @IBAction func completeBtnClick(_ sender: Any){
        let VC = completeViewController()
        VC.myDrink = myDrink
        VC.closure = { (msg:String)->() in
            self.myDrink = nil
            self.showOrderLabel.text = msg
            self.startBtn.setTitle("開始點餐", for: .normal)
            self.completeBtn.isEnabled = false
        }
        present(VC, animated: true, completion: nil)
        
    }


}

