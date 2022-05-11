//
//  ContentView.swift
//  QRScanner_Mac_OS
//
//  Created by Bartek Wanot on 11/05/2022.
//

import SwiftUI
import CodeScanner   // https://github.com/twostraws/CodeScanner

struct ContentView: View {
    @State var isScanner = false
    @State var scannedCode: String = "Click \"Scan\" to start"
    
    var scannerSheet : some View{
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isScanner = false
                }
            })
    }
    var body: some View {
        VStack(spacing: 10) {
            Text(scannedCode)
            
            Button("Scan QR"){
                self.isScanner = true
            }
            .sheet(isPresented: $isScanner){
                self.scannerSheet
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
