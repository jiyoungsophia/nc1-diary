//
//  TodoCell.swift
//  todotodo
//
//  Created by 지영 on 4/11/24.
//

import SwiftUI

struct TodoMainCell: View {
    let todos: TodoData
//    let backgroundColors: [Color] = [.ce, .yellow, .blue]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(todos.title)
                .font(.title2.bold())
            
            ForEach(todos.tasks) { task in
                HStack {
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    Text(task.memo)
                }
            }
            
            Divider()
            Text(todos.createDate)
        }
        .padding()
        .background(.cellGreen)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    TodoMainCell(todos: TodoData.sampleData[0])
}
