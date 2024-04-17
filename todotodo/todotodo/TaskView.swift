//
//  TaskView.swift
//  todotodo
//
//  Created by 지영 on 4/15/24.
//

import SwiftUI

enum CellType {
    case todo
    case addTodo
}

// - FIXME: 제목만 있고 task 없는 경우
struct TaskView: View {
    
    var cellType: CellType = .todo
    @State var newMemo: String = ""
    
    @Binding var todo: TodoData 
    
    var body: some View {
        VStack(alignment: .leading) {
            
            switch cellType {
                
            case .todo:
                Text("\(todo.createDate)")
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
                TextField("", text: $todo.title)
                    .font(.title)
                    .padding()
                    .onChange(of: newMemo) {
                        print(newMemo)
                    }
                List {
                    ForEach($todo.tasks) { $task in
                        TaskCell(task: $task)
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button(role: .destructive) {
                                    print("delete")
                                } label: {
                                    Image(systemName: "trash")
                                }

                            }
                    }
                }
                .listStyle(.plain)
                
            case .addTodo:
                Text("현재날짜")
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
                TextField("Untitled", text: $newMemo)
                    .font(.title)
                    .padding()
                    .onChange(of: newMemo) {
                        print(newMemo)
                    }
                Text("No Tasks")
                    .font(.title2.bold())
                    .foregroundStyle(.cellDarkGreen)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                
            }
            
            
            

            
            
            Spacer()
            Button("Add New Task", systemImage: "plus.circle.fill", action: {
                print("add")
            })
            .font(.title3.bold())
            .foregroundStyle(.green)
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    TaskView()
//}
