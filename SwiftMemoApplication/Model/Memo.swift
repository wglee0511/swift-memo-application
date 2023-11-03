//
//  Memo.swift
//  SwiftMemoApplication
//
//  Created by racoon on 2023/11/03.
//
import SwiftUI
import Foundation


struct Memo: Identifiable {
    let id: UUID = UUID()
    var content: String
    var insertedDate: Date
}

//class MemoList: ObservableObject {
//    @Published var memoList: [Memo] = [Memo(content: "Hello World", insertedDate: Date() )]
//    
//    func addMemoList (text : String) {
//        
//    }
//}
