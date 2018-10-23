//
//  HistoryViewController.swift
//  simple-calc-ios
//
//  Created by Arman Shah on 10/22/18.
//  Copyright © 2018 Arman Shah. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var scrollContainer: UIScrollView!
    var numLabels : Int = 0
    var stringOfInputs : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for text in stringOfInputs {
            
            let lbl = UILabel(frame: CGRect(x: 30, y: 50 + (34 * numLabels), width: 345, height: 25))
            
            lbl.text = text
            
            lbl.textColor = .white
            
            lbl.backgroundColor = .black
            
            lbl.font = UIFont.systemFont(ofSize: 25)
            
            lbl.numberOfLines = 0
            
            lbl.lineBreakMode = .byTruncatingTail
            
            lbl.sizeToFit()
            
            
            self.numLabels += 1
            self.scrollContainer.addSubview(lbl)
        }

        // Do any additional setup after loading the view.
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
