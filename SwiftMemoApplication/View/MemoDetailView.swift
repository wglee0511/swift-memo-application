//
//  MemoDetailView.swift
//  SwiftMemoApplication
//
//  Created by racoon on 2023/11/10.
//

import SwiftUI

struct MemoDetailView: View {
    @State private var memoText: String = ""
    
    @ObservedObject var memoList = Memolist()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Text("content :").font(.title)
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 1)
                    .overlay(
                        TextEditor(text: $memoText)
                            .font(.title)                    .padding(20)
                    )
            }.padding()
                .frame(height: 100)
            
            Button {
                if memoText == "" {
                    return
                }
                
                memoList.addMemo(
                    memo: Memo(
                        content: memoText,
                        insertedDate: Date()
                    ))
                memoText = ""
                dismiss()
            } label: {
                Text("Input Memo")
            }
            Spacer()
        }.navigationTitle("Add Memo")
    }
}

struct MemoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MemoDetailView()
    }
}
