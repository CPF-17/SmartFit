//
//  FitnessMonViewController.swift
//  SmartFit
//
//  Created by Gerard Recinto on 5/17/17.
//  Copyright © 2017 CPF-17. All rights reserved.
//

import UIKit

class FitnessMonViewController: UIViewController {

  @IBOutlet weak var rowWeightLabel: UILabel!
  @IBOutlet weak var benchWeightLabel: UILabel!
  @IBOutlet weak var squatWeightLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
      rowWeightLabel.text = String(user.row)
      benchWeightLabel.text = user.benchPress
      squatWeightLabel.text = String(user.squat)

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
