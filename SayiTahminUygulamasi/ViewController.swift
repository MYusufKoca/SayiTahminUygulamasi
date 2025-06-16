//
//  ViewController.swift
//  SayiTahminUygulamasi
//
//  Created by Mehmet Yusuf Koca on 27.04.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ballImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var minTextField: UITextField!
    @IBOutlet weak var maxTextField: UITextField!
    @IBOutlet weak var prepareButton: UIButton!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    
        var minNumber: Int = 0
        var maxNumber: Int = 100
        var isReady: Bool = false
        

        override func viewDidLoad() {
            super.viewDidLoad()
            ballImageView.isHidden = true
            ballImageView.alpha = 0
            resultLabel.text = ""
        }
        
        
    @IBAction func prepareButton(_ sender: Any) {
            guard let minText = minTextField.text, !minText.isEmpty,
                      let maxText = maxTextField.text, !maxText.isEmpty,
                      let min = Int(minText), min > 0,  // Burada geçerli bir min değeri olmalı
                      let max = Int(maxText), max > 0,  // Burada geçerli bir max değeri olmalı
                      min < max else {
                    resultLabel.text = "Geçerli bir aralık girin!"
                    print("Geçerli bir aralık girin!")  // Debugging için ekledik
                    return
            }
            
            minNumber = min
            maxNumber = max
            isReady = true
            
            
            ballImageView.image = UIImage(named: "0B053318-1357-4A1E-8BC6-BDDD041F152E")
            ballImageView.isHidden = false
            ballImageView.alpha = 0
            ballImageView.transform = .identity
            
            self.view.layoutIfNeeded()
            
          
            UIView.animate(withDuration: 0.8, animations: {
                self.ballImageView.alpha = 1
            }, completion: { _ in
                
                UIView.animate(withDuration: 0.5,
                               delay: 0,
                               options: [.autoreverse, .repeat],
                               animations: {
                    self.ballImageView.transform = CGAffineTransform(rotationAngle: .pi/8)
                }, completion: nil)
                })
            
            resultLabel.text = ""
            print("Hazır")  // Debugging için ekledik
        }
        
    @IBAction func showButton(_ sender: Any) {
            guard isReady else {
                resultLabel.text = "Önce Hazırla'ya basmalısın!"
                print("Önce Hazırla'ya basmalısın!")  // Debugging için ekledik
                return
            }
            
            let randomNumber = Int.random(in: minNumber...maxNumber)
            resultLabel.text = "Sonuç: \(randomNumber)"
            print("Sonuç: \(randomNumber)")  // Debugging için ekledik
            ballImageView.isHidden = true
        }
        
    @IBAction func resetButton(_ sender: Any) {
            minTextField.text = ""
            maxTextField.text = ""
            resultLabel.text = ""
            ballImageView.isHidden = true
            ballImageView.layer.removeAllAnimations()
            ballImageView.transform = .identity
            ballImageView.alpha = 0
            isReady = false
        }
}

