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

typealias MemoListType  = Array<Memo>

class Memolist: ObservableObject {
    @Published var memoList: MemoListType = []
    @Published var isEmptyMemoList: Bool = false
    
    func addMemo(memo: Memo) {
        memoList.insert(memo, at: 0)
    }
    
    func updateMemo(id: UUID, content: String) {
        var updatedMemoList = memoList.map {
            if $0.id == id {
                var updatedMemo  = Memo(content: content, insertedDate: Date())
                return updatedMemo
            } else {
                return $0
            }
        }
        
        memoList = updatedMemoList
    }
    
    func deleteMemo(id: UUID) {
        var filteredMemoList = memoList.filter {
            $0.id != id
        }
        
        memoList = filteredMemoList
    }
}
