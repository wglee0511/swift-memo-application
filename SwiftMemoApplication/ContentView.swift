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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            Button {
                memoList.addMemoList(memo: Memo(content: "Hello", insertedDate: Date()))
            } label: {
                Text("Test Button")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
