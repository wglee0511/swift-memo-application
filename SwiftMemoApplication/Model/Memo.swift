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
    private let userDefault = UserDefaults.standard
    @Published var memoList: MemoListType = []
    @Published var isEmptyMemoList: Bool = false
    
    init() {
        let savedMemoList = userDefault.array(forKey: MEMO_LIST) as? MemoListType
        
        guard let checkedSavedMemoList = savedMemoList else {
            self.memoList = []
            self.isEmptyMemoList = true
            return
        }
        
        self.memoList = checkedSavedMemoList
        self.isEmptyMemoList = checkedSavedMemoList.isEmpty
    }
    
    func setUserDefault(memoList: MemoListType) {
        userDefault.set(memoList, forKey: MEMO_LIST)
    }
    
    func addMemo (memo: Memo) {
        var copyMemoList = memoList
        copyMemoList.insert(memo, at: 0)
        
        
        self.memoList = copyMemoList
        self.isEmptyMemoList = copyMemoList.isEmpty
        setUserDefault(memoList: copyMemoList)
    }
    
    func deleteMemo(id: UUID) {
        let copyMemoList = memoList.filter {
            $0.id != id
        }
        
        self.memoList = copyMemoList
        self.isEmptyMemoList = copyMemoList.isEmpty
        setUserDefault(memoList: copyMemoList)
    }
    
    func updateMemo(content: String, id: UUID) {
        let copyMemoList = memoList.map {
            if($0.id != id) {
                return $0
            } else {
                return Memo(content: content, insertedDate: Date())
            }
        }
        
        self.memoList = copyMemoList
        self.isEmptyMemoList = copyMemoList.isEmpty
        setUserDefault(memoList: copyMemoList)
    }
    
}
