//
//  TodoCell.swift
//  todotodo
//
//  Created by 지영 on 4/11/24.
//

import SwiftUI

struct TodoMainCell: View {
    @Binding var todo: TodoData
    //    @Binding var tasks: [Task]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(todo.title)
                .font(.title2.bold())
            
            ForEach($todo.tasks) { $task in
                TaskCell(task: $task, tappedAction: { newTask in
                    todo.tasks.append(newTask)
                })
            }
            
            Divider()
            Text(todo.createDate)
        }
        .padding()
        .background(.cellGreen)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

//#Preview {
//    TodoMainCell(todo: TodoData.sampleData[0])
//}
