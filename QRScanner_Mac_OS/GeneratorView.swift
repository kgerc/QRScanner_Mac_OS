//
//  GeneratorView.swift
//  QRScanner_Mac_OS
//
//  Created by Bartek Wanot on 26/05/2022.
//

import SwiftUI



struct GeneratorView: View {
    @EnvironmentObject var qrManager: QRManager
    @State private var toGenerate: String = ""
    var body: some View {
        VStack{
            if(true) // TODO: Docelowo: jeśli nie ma zapisanych wygenerowanych kodów
            {
                Spacer()
                Image(systemName: "hare.fill")
                    .resizable()
                    .frame(width: 150.0, height: 115.0)
                    .foregroundColor(Color(UIColor.lightGray))
                    
                Text("Nothing generated yet")
                    .foregroundColor(Color(UIColor.lightGray))
                    .padding(.top)
                Spacer()
            }
            else{
                List{
                    ForEach(dummyData, id: \.self){ item in
                        RowWidget(content: item[0], date: item[1])
                            .environmentObject(qrManager)
                        
                    }
                }
            }
            TextField("Type qr code content", text: $toGenerate)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 14.0)
                .cornerRadius(50)
                .symbolVariant(.fill)
                .colorInvert()
            Button("Generate"){
                qrManager.detailScreen(qrContent: toGenerate)
            }
        }
        
    }
}

struct GeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratorView()
    }
}
