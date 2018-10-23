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
    var labelCount: Int = 0
    var inputStorage: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for historyItem in inputStorage {
            let historyLabel = UILabel(frame: CGRect(x: 50, y: 50 + (35 * labelCount), width: 350, height: 25))
            historyLabel.text = historyItem
            historyLabel.font = UIFont.systemFont(ofSize: 20)
            historyLabel.textColor = .black
            historyLabel.numberOfLines = 0
            historyLabel.lineBreakMode = .byTruncatingTail
            historyLabel.sizeToFit()
            self.labelCount += 1
            self.scrollContainer.addSubview(historyLabel)
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
