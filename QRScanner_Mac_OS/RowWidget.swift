//
//  RowWidget.swift
//  QRScanner_Mac_OS
//
//  Created by Bartek Wanot on 26/05/2022.
//

import SwiftUI

let dummyData = [["first", "25.05.2022"], ["second very long qr code content that must be cut because it won't fit in two lines", "13.05.2022"], ["third", "10.04.2022"]]

struct RowWidget: View {
    @EnvironmentObject var qrManager: QRManager
    var content: String
    var date: String
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
            Image(systemName: "trash")
                .foregroundColor(.red)

        }
            }
}

struct RowWidget_Previews: PreviewProvider {
    static var previews: some View {
        RowWidget(content: "Test", date: "00.00.0000")
    }
}
