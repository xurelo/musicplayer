//
//  Player.swift
//  musicplayer
//
//  Created by Francisco Manuel Romero on 14/05/16.
//  Copyright © 2016 Francisco Manuel Romero. All rights reserved.
//

import UIKit
import AVFoundation

class Player: NSObject, AVAudioPlayerDelegate {
    
    var songs: [String];
    private var reproductor : AVAudioPlayer!
    private var urls: [NSURL] = []
    private var index: Int = 0;
    var shuffle: Bool = false;
    private var parent : PlayScreen? = nil
    
    init(songs: [String], firstIndex: Int, parent: PlayScreen) {
        self.songs = songs;
        self.index = firstIndex;
        print("index:\(firstIndex)");
        self.index = self.index % (self.songs.count+1)
        let index = self.index;
        print("final index:\(index)");
        for song in songs {
            self.urls.append(NSBundle.mainBundle().URLForResource(song, withExtension: ".mp3")!);
        }
        self.parent = parent;
        super.init();
        startPlayer();
    }
    
    func makeShuffle() {
        print("is in shuffle mode");
        self.index = Int(arc4random()%2)
        print("nuevo index:\(index)");
        self.startPlayer();
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) { // *
        print("song finished");
        if (self.shuffle) {
            makeShuffle();
        } else {
            self.index+=1;
            self.index = self.index % (self.songs.count)
            print("nuevo index:\(index)");
            self.startPlayer();
        }
    }
    
    
    func startPlayer() {
        do {
            try reproductor = AVAudioPlayer(contentsOfURL: self.urls[self.index]);
            reproductor.numberOfLoops = 0;
            reproductor.stop();
            reproductor.delegate = self;
            reproductor.play();
            parent?.changedSond(self.index);
        } catch {
            print("Error");
        }
    }
    
    func play() {
        if (!reproductor.playing) {
            reproductor.play();
        }
    }
    
    func setVolume(value: Float) {
        reproductor.volume = value;
    }

    
    func pause() {
        if (reproductor.playing) {
            reproductor.pause();
        }
    
    }
    
    func stop() {
        if (reproductor.playing) {
            reproductor.stop();
            reproductor.currentTime = 0;
        }
    }
    
    func setShuffle() -> Bool {
        self.shuffle = !self.shuffle;
        if (self.shuffle) {
            makeShuffle();
        }
        return self.shuffle;
    }
    
}
