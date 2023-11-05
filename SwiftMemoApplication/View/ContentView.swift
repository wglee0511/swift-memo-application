//
//  ContentView.swift
//  SwiftMemoApplication
//
//  Created by racoon on 2023/11/03.
//

import SwiftUI

struct ContentView: View {
    @State private var memoText: String = ""
    
    @ObservedObject var memoList = Memolist()
    

    var body: some View {
        NavigationView {
            VStack{
                memoList.isEmptyMemoList == true ?
                Text("Add Memo") :
                Text("Memo")
            }.navigationTitle("Memo List")
                .toolbar {
                    HStack{
                        Button{
                            print(memoList)
                        } label: {
                            Text("Edit")
                        }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
