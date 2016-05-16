//
//  ViewController.swift
//  musicplayer
//
//  Created by Francisco Manuel Romero on 14/05/16.
//  Copyright © 2016 Francisco Manuel Romero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func fifth(sender: AnyObject) {
        let conf = self.storyboard!.instantiateViewControllerWithIdentifier("PlayScreen") as! PlayScreen
        conf.firstSongIndex = 4;
        self.navigationController!.pushViewController(conf, animated: true)
    }
    @IBAction func fourth(sender: AnyObject) {
        let conf = self.storyboard!.instantiateViewControllerWithIdentifier("PlayScreen") as! PlayScreen
        conf.firstSongIndex = 3;
        self.navigationController!.pushViewController(conf, animated: true)
    
    }

    @IBAction func third(sender: AnyObject) {
        let conf = self.storyboard!.instantiateViewControllerWithIdentifier("PlayScreen") as! PlayScreen
        conf.firstSongIndex = 2;
        self.navigationController!.pushViewController(conf, animated: true)
        
    }
    @IBAction func first(sender: AnyObject) {
        let conf = self.storyboard!.instantiateViewControllerWithIdentifier("PlayScreen") as! PlayScreen
        conf.firstSongIndex = 0;
        self.navigationController!.pushViewController(conf, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func second(sender: AnyObject) {
        let conf = self.storyboard!.instantiateViewControllerWithIdentifier("PlayScreen") as! PlayScreen
        conf.firstSongIndex = 1;
        self.navigationController!.pushViewController(conf, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

