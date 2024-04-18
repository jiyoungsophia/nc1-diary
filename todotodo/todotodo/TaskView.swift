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
    @Environment(\.dismiss) var dismiss
    var cellType: CellType = .editTodo
    @State var newMemo: String = ""
//    @State private var newTodo = TodoData(createDate: "\(DateFormatter())")
    
    @Binding var todos: [TodoData]
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
                
                List {
                    ForEach($todo.tasks) { $task in
                        TaskCell(
                            cellType: .editTodo,
                            task: $task
                        )
                        
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
                // TODO: default값 placeholder로 바꾸기
                TextField("Untitled", text: $todo.title)
                    .font(.title)
                    .padding()
                    .onChange(of: todo.title) {
                        print(todo.title)
                    }
                List {
                    ForEach($todo.tasks) { $task in
                        TaskCell(
                            cellType: .addTodo,
                            task: $task
                        )
                    }
                    .onDelete { offsets in
                        todo.tasks.remove(atOffsets: offsets)
                        print(todo.tasks)
                        
                        // FIXME: 바인딩처리해줫으니까 그냥 이렇게 하면 되나??
//                        saveTask(todos)
                    }
                }
                .listStyle(.plain)
                
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
        .toolbar {
            Button {
                todos.append(todo)
                print(todo)
//                saveTask(todos)
                // MARK: newTodo reset
                todo = TodoData(createDate: "", title: "")
//                dismiss()
            } label: {
                Text("저장")
            }
        }
    }
    
    func dateFormatter() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM월 dd일"
        let current = formatter.string(from: Date())
        return current
    }
    
    
    // MARK: - json CRUD
    

    func addTask() {
        let newTask = Task()
        todo.tasks.append(newTask)
    }
    
    
    // FIXME: 재사용이하고시퍼요 delete하고 다시 save 해줘야,,?하지 않나,,? 근데 매개변수타입이 달라,,
//    func saveTask(_ data: [TodoData]) {
//        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("todos.json")
//        print(fileURL)
//        if let data = try? JSONEncoder().encode(data) {
//            try? data.write(to: fileURL)
//        }
//    }
    

}

//#Preview {
//    TaskView()
//}
