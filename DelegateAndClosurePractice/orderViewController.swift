//
//  orderViewController.swift
//  DelegateAndClosurePractice
//
//  Created by 旌榮 凌 on 2020/5/20.
//  Copyright © 2020 旌榮 凌. All rights reserved.
//

import UIKit

class orderViewController: UIViewController {
    var myDrink : drink!
    var delegate : OrderViewDelegate?
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var sweetSelect: UISegmentedControl!
    @IBOutlet var iceSelect: UISegmentedControl!
    @IBOutlet var priceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (myDrink != nil){
            nameTextField.text = myDrink.name
            sweetSelect.selectedSegmentIndex = myDrink.sweetSelectIndex
            iceSelect.selectedSegmentIndex = myDrink.iceSelectIndex
            priceTextField.text = "\(myDrink.price)"
        }

        }
    
    @IBAction func sendBtnClick(_ sender:Any) {
        if(myDrink == nil) {
            myDrink = drink()
        }
        myDrink.name = nameTextField.text ?? ""
        myDrink.sweetSelectIndex = sweetSelect.selectedSegmentIndex
        myDrink.sweetness = sweetSelect.titleForSegment(at: sweetSelect.selectedSegmentIndex)!
        myDrink.iceSelectIndex = iceSelect.selectedSegmentIndex
        myDrink.ice = iceSelect.titleForSegment(at: iceSelect.selectedSegmentIndex)!
        myDrink.price = Int(priceTextField.text!) ?? 0
        
        delegate?.sendOrder(myOrder: myDrink)
        navigationController?.popViewController(animated: true)
    }
    
}

@objc protocol OrderViewDelegate{
    func sendOrder(myOrder:drink)
}

extension ViewController : OrderViewDelegate{
    func sendOrder(myOrder: drink){
        myDrink = myOrder
    }
}
