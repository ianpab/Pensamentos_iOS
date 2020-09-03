//
//  SettingsViewController.swift
//  Pensamentos
//
//  Created by Ian Pablo on 01/09/20.
//  Copyright © 2020 pensamentos. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var swAutoRefresh: UISwitch!
    @IBOutlet weak var lbTimeInterval: UILabel!
    @IBOutlet weak var slTimerInterval: UISlider!
    @IBOutlet weak var scTimeScheme: UISegmentedControl!
    
    var config = Configuration.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: Notification.Name("Refresh"), object: nil, queue: nil) { (notification) in
            self.formatView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        formatView()
    }
    
    func formatView(){
        swAutoRefresh.setOn(config.autoRefresh, animated: false)
        slTimerInterval.setValue(Float(config.timeInterval), animated: false)
        scTimeScheme.selectedSegmentIndex = config.colorScheme
        changeTimerIntervalLabel(with: config.timeInterval)
    }
    
    func changeTimerIntervalLabel(with value: Double){
        lbTimeInterval.text = "Mudar após \(Int(value)) segundos"
    }
    
    
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
        config.autoRefresh = sender.isOn
        
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        let value = Double(round(sender.value))
        changeTimerIntervalLabel(with: value)
        config.timeInterval = value
        
    }
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex
    }
    
}
