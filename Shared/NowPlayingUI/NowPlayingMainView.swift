//
//  NowPlayingMainView.swift
//  Neiro
//
//  Created by いちご on 2021/08/29.
//

import SwiftUI

struct NowPlayingMainView: View {
    var body: some View {
        VStack{
            Image(systemName: "music.note.house")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300, maxHeight: 300)
            HStack {
                VStack {
                    Text("Title")
                        .font(.title)
                    Text("Artist")
                        .font(.title2)
                        .opacity(0.8)
                }
                Spacer()
            }
            VStack(spacing: 0) {
                SliderView()
                HStack {
                    Text("0:00")
                        .opacity(0.8)
                    Spacer()
                    Text("3:02")
                        .opacity(0.8)
                }
                .padding(.top, 8)
            }
            HStack {
                Image(systemName: "backward.end.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 40.0)
                Spacer()
                Image(systemName: "play.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 50)
                Spacer()
                Image(systemName: "forward.end.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 40.0)
            }
            .padding()
        }
        .foregroundColor(.white)
        .padding()
    }
}

struct NowPlayingMainView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingMainView()
            .background(Color.gray.opacity(0.8))
            .environmentObject(NowPlayingObject())
    }
}