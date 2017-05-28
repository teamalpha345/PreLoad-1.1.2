//
//  ViewController.swift
//  test
//
//  Created by Hugo Ayre on 3/29/17.
//  Copyright © 2017 Team Alpha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelSwitch: UILabel!
    @IBOutlet weak var standards: UITextField!
    @IBOutlet weak var howMany: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var closePopup: UIButton!
    @IBOutlet weak var volumne: UITextField!
    @IBOutlet weak var displayResults: UILabel!
    @IBOutlet weak var centerPopupConstraint: NSLayoutConstraint!
    @IBOutlet weak var percent: UITextField!
    @IBOutlet weak var toggleCalculateSwitch: UISwitch!
    
    var resultCompare: Float = 0.0
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        super.touchesBegan(touches,with: event)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        popupView.layer.cornerRadius = 10
        popupView.layer.masksToBounds = true
        toggleCalculateSwitch.layer.cornerRadius = 16.0
        volumne.isHidden = true;
        percent.isHidden = true;
       /* var imagesNames = ["beer1.jpg","beer2.jpg","beer3.jpg","beer4.jpg","beer5.jpg","beer6.jpg","beer7.jpg","beer8.jpg","beer9.jpg","beer10.jpg","beer11.jpg","beer12.jpg","beer13.jpg",]
        
        var images = [UIImage]()
        
        for i in 0..<imagesNames.count {
            images.append(UIImage(named: imagesNames[i])!)
        }
        
        fillBeerGif.animationImages = images
        fillBeerGif.animationDuration = 1
        fillBeerGif.animationRepeatCount = 5
        fillBeerGif.startAnimating()*/
        
        
        }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonCalculate(_ sender: UIButton) {
        
        
            if toggleCalculateSwitch.isOn {
                if (price.text != "" && howMany.text != "" && standards.text != ""){
                    let priceFloat = Float(price.text!)!
                    let howManyFloat = Float(howMany.text!)!
                    let standardsFloat = Float(standards.text!)!
                    let result = numStandardsStandard(priceFloat, howManyFloat, standardsFloat)
                    
                    
                    
                    standards.resignFirstResponder()
                    howMany.resignFirstResponder()
                    price.resignFirstResponder()
                    
                    if (resultCompare != 0.0){
                        displayResults.text = "approximately " + String(describing: result) + " standard drinks per dollar\nlast result: " + String(describing: resultCompare)
                    }else {
                        displayResults.text = "approximately " + String(describing: result) + " standard drinks per dollar"
                    }
                    centerPopupConstraint.constant = 0
                    
                    UIView.animate(withDuration: 0.3, animations: {
                        self.view.layoutIfNeeded()
                    })
                    resultCompare = compareResults(result)
                                   }
            }else {
                if (price.text != "" && howMany.text != "" && volumne.text != "" && percent.text != ""){
                    let priceFloat = Float(price.text!)!
                    let howManyFloat = Float(howMany.text!)!
                    let volumneFloat = Float(volumne.text!)!
                    let percentFloat = Float(percent.text!)!
                    let result = numStandardsPercent(priceFloat, howManyFloat, volumneFloat, percentFloat)
                    
                    
                    standards.resignFirstResponder()
                    howMany.resignFirstResponder()
                    price.resignFirstResponder()
                    
                    
                    if (resultCompare != 0.0){
                        displayResults.text = "approximately " + String(describing: result) + " standard drinks per dollar\nlast result: " + String(describing: resultCompare)
                    }else {
                        displayResults.text = "approximately " + String(describing: result) + " standard drinks per dollar"
                    }
                    centerPopupConstraint.constant = 0

                    
                    centerPopupConstraint.constant = 0
                    
                    UIView.animate(withDuration: 0.3, animations: {
                        self.view.layoutIfNeeded()
                    })
                    resultCompare = compareResults(result)
                }

            }

    }

    @IBAction func closePopUp(_ sender: Any) {
        centerPopupConstraint.constant = -500
        
        UIView.animate(withDuration: 0.1, animations: {
            self.view.layoutIfNeeded()
        })
    }
    @IBAction func toggleCalculate(_ sender: Any) {
        if toggleCalculateSwitch.isOn {
            labelSwitch.text = "Calculate using standards per drink"
            volumne.isHidden = true;
            percent.isHidden = true;
            standards.isHidden = false;

        } else {
            labelSwitch.text = "Calculate using alcohol percentage"
            volumne.isHidden = false;
            percent.isHidden = false;
            standards.isHidden = true;
        }
    }
    

}

