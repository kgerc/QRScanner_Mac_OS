//
//  ContentView.swift
//  QRScanner_Mac_OS
//
//  Created by Bartek Wanot on 11/05/2022.
//

import SwiftUI
import CodeScanner   // https://github.com/twostraws/CodeScanner f

struct ContentView: View {
    @StateObject var qrManager = QRManager()

    var body: some View {
        
        if qrManager._mainScreen
        {
            TabView{
                ScannerView()
                    .environmentObject(qrManager)
                    .tabItem{
                        Image(systemName: "qrcode.viewfinder")
                        Text("Scanner")
                    }
                GeneratorView()
                    .environmentObject(qrManager)
                    .tabItem{
                        Image(systemName: "qrcode")
                        Text("Generator")
                    }
            }
        }
        else
        {
            DetailView()
                .environmentObject(qrManager)
        }
        
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
