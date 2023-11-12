//
//  ContentView.swift
//  SwiftMemoApplication
//
//  Created by racoon on 2023/11/03.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var memoList = Memolist()

    var body: some View {
        NavigationView {
            VStack{
                MemoListView()
            }.navigationTitle("Memo List")
                .toolbar {
                    NavigationLink("Edit") {
                        MemoDetailView()
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
