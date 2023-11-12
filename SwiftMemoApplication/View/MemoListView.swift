//
//  MemoListView.swift
//  SwiftMemoApplication
//
//  Created by racoon on 2023/11/10.
//

import SwiftUI

struct MemoListView: View {
    @ObservedObject var memoList = Memolist()
    
    var body: some View {
        VStack{
            if memoList.isEmptyMemoList == true {
                Text("Add Memo")
            } else {
                List(memoList.memoList) {
                    Text($0.content)
                }
            }
            
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                print(memoList.$memoList)
            }
        }
    }
}

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView()
    }
}
