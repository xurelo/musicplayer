//
//  PlayScreen.swift
//  musicplayer
//
//  Created by Francisco Manuel Romero on 14/05/16.
//  Copyright © 2016 Francisco Manuel Romero. All rights reserved.
//

import UIKit

class PlayScreen: UIViewController {
    var firstSongIndex: Int = 0;
    var player : Player? = nil
    var songs: [String] = ["Instrumental", "Jazz", "Myst"]
    var covers: [String] = ["sunset_cover.jpg", "jazz_cover.jpg","myst_cover.jpg"];

    @IBAction func volumeChanged(sender: AnyObject) {
        let slider : UISlider = sender as! UISlider
        let currentValue = Float(slider.value);
        player!.setVolume(currentValue/100);
    }
    @IBOutlet weak var volumeOutlet: UISlider!
    @IBAction func shuffle(sender: AnyObject) {
        player?.setShuffle();
    }
    @IBAction func stop(sender: AnyObject) {
        player?.stop();
    }
    @IBAction func play(sender: AnyObject) {
        player?.play();
    }
    
    @IBAction func pause(sender: AnyObject) {
        print("PAUSE");
        player?.pause();
    }
    @IBOutlet weak var poster: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("-->loaded, firstSongIndex:\(firstSongIndex)");
        player = Player(songs: self.songs, firstIndex: firstSongIndex, parent: self);
        player?.play();
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(animated: Bool) {
        player?.stop();
    }
    
    func changedSond(index: Int) {
        let frameworkBundle = NSBundle.mainBundle();
        let str = self.covers[index];
        print("put image:\(str)")
        let imagePath = frameworkBundle.pathForResource(self.covers[index], ofType: "")
        if imagePath != nil {
            let result = UIImage(contentsOfFile: imagePath!)
            poster.image = result;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
