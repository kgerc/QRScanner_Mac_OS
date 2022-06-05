//
//  RowWidget.swift
//  QRScanner_Mac_OS
//
//  Created by Bartek Wanot on 26/05/2022.
//

import SwiftUI



struct RowWidget: View {
    @EnvironmentObject var qrManager: QRManager
    var content: String
    var date: String
    var isGenerated: Bool
    var body: some View {
        HStack( spacing: 8){
            Button(action:{
                qrManager.detailScreen(qrContent: content)
            }) {
                VStack(alignment: .leading){
                    Text(date)
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .light))
                    Text(content)
                        .lineLimit(2)
                        .font(.system(size: 18))
                }
            }
            
            Spacer()
            Button(action:{
                if isGenerated
                {
                    generatedData.remove(at:  generatedData.firstIndex(of: [content,date])!)
                }
                else
                {
                    scannedData.remove(at:  scannedData.firstIndex(of: [content,date])!)
                }
            }) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
            

        }
            }
}

//struct RowWidget_Previews: PreviewProvider {
//    static var previews: some View {
//        RowWidget(content: "Test", date: "00.00.0000", false)
//    }
//}
