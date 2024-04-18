//
//  TaskCell.swift
//  todotodo
//
//  Created by 지영 on 4/15/24.
//

import SwiftUI


// FIXME: 메인화면, 태스트화면 분기처리 수정
struct TaskCell: View {
    
    var cellType: CellType = .editTodo
    @Binding var task: Task // Binding<Task>
    
    @State var newMemo: String = ""
    
    var body: some View {
        HStack {
            
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .onTapGesture {
                    task.isCompleted.toggle()
                }

            switch cellType {
            case .editTodo:
                Text(task.memo)
                
            case .addTodo:
                TextField("", text: $task.memo)

            }
            
            Spacer()
        }
        
    }
}


