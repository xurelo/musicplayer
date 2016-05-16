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
    var songs: [String] = ["Instrumental", "Jazz", "Myst", "mygirl_temptations", "phantom"]
    var covers: [String] = ["sunset_cover.jpg", "jazz_cover.jpg","myst_cover.jpg", "temptations.png", "phantom.jpg"];
    var titles: [String] = ["1.Sunset", "2.Jazz","3.Mysterious","4.My girl", "5.Phantom"];

    @IBAction func volumeChanged(sender: AnyObject) {
        let slider : UISlider = sender as! UISlider
        let currentValue = Float(slider.value);
        player!.setVolume(currentValue/100);
    }
    @IBOutlet weak var volumeOutlet: UISlider!
    @IBAction func shuffle(sender: AnyObject) {
        let shuf: Bool = (player?.setShuffle())!;
        let button : UIButton = sender as! UIButton
        if (shuf) {
            button.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
        } else {
             button.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        }
    }
    @IBAction func stop(sender: AnyObject) {
        player?.stop();
    }
    @IBAction func play(sender: AnyObject) {
        player?.play();
    }
    
    
    @IBOutlet weak var shuffle: UIButton!
    @IBOutlet weak var track: UILabel!
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
        track.text = self.titles[index];
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
