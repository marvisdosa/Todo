//
//  VideoPlayer.swift
//  Todo
//
//  Created by Marvis Ighedosa on 22/11/2023.
//

import SwiftUI
import AVKit

struct VideoPlayer: View {
    @State var avPlayer:AVPlayer?
    var url:String = "https://esdiacapp.s3.amazonaws.com/videos/introduction-to-esdiac.mp4"
    var body: some View {
        ZStack {
            if let urlString = url {
                if let urlstring = URL(string: urlString) {
                    VideoPlayer(avPlayer: AVPlayer(url: urlstring ))
                        .aspectRatio(contentMode: .fit)
                        .zIndex(1)
                }
            }
        }
    }
}

struct VideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayer()
    }
}
