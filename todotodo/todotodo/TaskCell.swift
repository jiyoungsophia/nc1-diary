//
//  TaskCell.swift
//  todotodo
//
//  Created by 지영 on 4/15/24.
//

import SwiftUI

struct TaskCell: View {
    let task: TodoData.Task
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            Text("\(task.memo)")
            Spacer()
//            Text("\(task[0].completeDate)")
        }
    }
}

#Preview {
    TaskCell(task: TodoData.sampleData[0].tasks[0])
}
