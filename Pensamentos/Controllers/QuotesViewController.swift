//
//  QuotesViewController.swift
//  Pensamentos
//
//  Created by Ian Pablo on 01/09/20.
//  Copyright © 2020 pensamentos. All rights reserved.
//

import UIKit

class QuotesViewController: UIViewController {

    
    @IBOutlet weak var ivPhotoBg: UIImageView!
    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var lbQuote: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var ctTop: NSLayoutConstraint!
    
    let quotesManager = QuotesManager()
    var timer: Timer?
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    func formatView(){
        view.backgroundColor = config.colorScheme == 0 ? .white : UIColor(red: 156.0/255.0, green: 68.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        lbQuote.textColor = config.colorScheme == 0 ? .black : .white
        lbAuthor.textColor = config.colorScheme == 0 ? UIColor(red: 192.0/255.0, green: 96.0/255.0, blue: 49.0/255.0, alpha: 1.0) : .yellow
        
        prepareQuote()
    }
    
    
    func prepareQuote(){
        timer?.invalidate()
        if config.autoRefresh{
            timer = Timer.scheduledTimer(withTimeInterval: config.timeInterval, repeats: true, block: { (time) in
                self.showRandomQuote()
            })
        }
        
        showRandomQuote()
    }
    
    func showRandomQuote(){
        let quote = quotesManager.getRandomQuote()
        lbQuote.text = quote.quote
        lbAuthor.text = quote.author
        ivPhoto.image = UIImage(named: quote.image)
        ivPhotoBg.image = ivPhoto.image
        
        lbQuote.alpha = 0.0
        lbAuthor.alpha = 0.0
        ivPhotoBg.alpha = 0.0
        ivPhoto.alpha = 0.0
        ctTop.constant = 60
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 2.5) {
            self.lbQuote.alpha = 1.0
            self.lbAuthor.alpha = 1.0
            self.ivPhotoBg.alpha = 1.0
            self.ivPhoto.alpha = 0.25
            self.ctTop.constant = 10
            self.view.layoutIfNeeded()
        }
        
    }


}
