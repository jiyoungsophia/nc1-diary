//
//  TaskCell.swift
//  todotodo
//
//  Created by 지영 on 4/15/24.
//

import SwiftUI

struct TaskCell: View {
    enum CellType {
        case todo
        case addTodo
    }
    var cellType: CellType = .todo
    @Binding var task: Task
    
    //    let todos: [TodoData] = TodoData.sampleData
    
    @State var newTask: String = ""
    
    var body: some View {
        HStack {
            
            
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            switch cellType {
            case .todo:
                Text(task.memo ?? "")
            case .addTodo:
                TextField("\(task.memo ?? "")", text: $newTask)
            }
            
            //            Text("\(task.memo)")
            Spacer()
            //            Text("\(task[0].completeDate)")
        }
        .onTapGesture {
            task.isCompleted.toggle()
        }
    }
}

//#Preview {
//    TaskCell(task: TodoData.sampleData[0].tasks[0])
//}
