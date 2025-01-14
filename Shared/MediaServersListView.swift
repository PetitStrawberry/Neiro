//
//  MediaServersListView.swift
//  Neiro
//
//  Created by いちご on 2021/08/29.
//

import SwiftUI
import CocoaUPnP

struct MediaServersListView: View {
    var mediaServer: UPPMediaServerDevice?
    @EnvironmentObject var discoverUPnP: DiscoverUPnP
    @EnvironmentObject var userData: UserDataObject
    
    var body: some View {
        VStack {
            Button (action: discoverUPnP.scanUPnPDevices, label: {
                Text("Refresh")
            })
            List {
                Section(header: Text("Saved Servers")){
                    ForEach(userData.savedServers, id: \.self) { savedServer in
                        NavigationLink(
                            destination: BrowserView(mediaServer: savedServer),
                            label: {
                                VStack {
                                    Text(savedServer.friendlyName)
                                        .lineLimit(1)
                                }
                            }
                        ).tag(savedServer)
                    }
                }
                Section(header: Text("Local Servers")){
                    ForEach(discoverUPnP.mediaServers, id: \.self) { mediaServer in
                        let browserView = BrowserView(mediaServer: mediaServer)
                        NavigationLink(
                            destination: browserView
                                .navigationTitle(mediaServer.friendlyName ),
                            label: {
                                Text(mediaServer.friendlyName)
                            }
                        ).tag(mediaServer)
                    }
                }
            }.listStyle(SidebarListStyle())
        }
    }
}

struct MediaServersListView_Previews: PreviewProvider {
    static var previews: some View {
        MediaServersListView()
            .environmentObject(DiscoverUPnP())
            .environmentObject(UserDataObject())
    }
}
