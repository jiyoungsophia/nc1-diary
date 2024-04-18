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
//    @Binding var tasks: [Task] // Binding<[Task]>
    @Binding var task: Task // Binding<Task>
    let tappedAction: (Task) -> Void
    
    @State var newMemo: String = ""
    
    var body: some View {
        HStack {
            
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .onTapGesture {
                    task.isCompleted.toggle()
                }
            
         
            switch cellType {
            case .editTodo:
                Text(task.memo ?? "")
                    
                
            case .addTodo:
                TextField("", text: $newMemo)
                    .onSubmit { // - FIXME: 마지막에 엔터 안치면 안들어가지는데 다른 좋은 방법이 있는지??? 저장버튼없이
                        let newMemo = Task(id: task.id, memo: newMemo)
                        tappedAction(newMemo)
                        print(newMemo)
                    }
            }
            
            Spacer()
        }
        
    }
}


