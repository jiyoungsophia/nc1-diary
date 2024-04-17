//
//  ToDoData.swift
//  todotodo
//
//  Created by 지영 on 4/12/24.
//

import Foundation

struct TodoData: Identifiable {
    var id = UUID()
    var createDate: String  // Date()
    var title: String = "Untitled"
    var tasks: [Task] = []
    //    var isPinned: Bool
}

struct Task: Identifiable {
    var id = UUID()
    var memo: String?
    var completeDate: String? // Date()
    var isCompleted: Bool = false
}


extension TodoData {
    static var sampleData: [TodoData] =
    [
        TodoData(createDate: "4월 15일", title: "To Buy List", tasks: [
            Task(memo: "yogurt", completeDate: "4월 16일", isCompleted: true),
            Task(memo: "bread", isCompleted: false),
            Task(memo: "peanut butter", isCompleted: false)
        ]),
        TodoData(createDate: "4월 15일", title: "To Study List", tasks: [
            Task(memo: "study0", completeDate: "4월 16일", isCompleted: true),
            Task(memo: "study1", completeDate: "4월 16일",isCompleted: true),
            Task(memo: "study2", isCompleted: false)
        ]),
        TodoData(createDate: "4월 15일", title: "To Listen List", tasks: [
            Task(memo: "listen0", completeDate: "4월 16일", isCompleted: true),
            Task(memo: "listen1", isCompleted: false),
            Task(memo: "listen2", completeDate: "4월 16일", isCompleted: true)
        ]),
        
    ]
}
