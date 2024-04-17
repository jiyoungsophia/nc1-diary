//
//  TaskView.swift
//  todotodo
//
//  Created by 지영 on 4/15/24.
//

import SwiftUI

enum CellType {
    case editTodo
    case addTodo
}


struct TaskView: View {
    
    var cellType: CellType = .editTodo
    @State var newMemo: String = ""
    @State private var newTodo = TodoData(createDate: "\(DateFormatter())")
    
    @Binding var todo: TodoData
    
    var body: some View {
        VStack(alignment: .leading) {
            
            switch cellType {
                
            case .editTodo:
                Text("\(todo.createDate)")
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
                TextField("", text: $todo.title)
                    .font(.title)
                    .padding()
                    .onChange(of: newMemo) {
                        print(newMemo)
                    }
                
                // - TODO: 제목만 있고 task 없는 경우
                List {
                    // - FIXME: toggle 안눌림
                    ForEach($todo.tasks) { $task in
                        TaskCell(cellType: .editTodo, task: $task)
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
                Text("\(dateFormatter())")
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
                // -FIXME: default값 placeholder로 바꾸기
                TextField("Untitled", text: $newTodo.title)
                    .font(.title)
                    .padding()
                    .onChange(of: newTodo.title) {
                        // -TODO: 저장~
                        print(newTodo.title)
                    }
                List {
                    ForEach($newTodo.tasks) { $task in
                        TaskCell(cellType: .addTodo, task: $task)
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
//                Text("No Tasks")
//                    .font(.title2.bold())
//                    .foregroundStyle(.cellDarkGreen)
//                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                
                
            }
            

            Spacer()
            Button("Add New Task", systemImage: "plus.circle.fill", action: {
                addTask()
                print("add")
            })
            .font(.title3.bold())
            .foregroundStyle(.green)
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func dateFormatter() -> String {
        var formatter = DateFormatter()
        formatter.dateFormat = "MM월 dd일"
        var current = formatter.string(from: Date())
        return current
    }
    
    func addTask() {
        let newTask = Task()
        newTodo.tasks.append(newTask)
    }
}

//#Preview {
//    TaskView()
//}
