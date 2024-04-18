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
                            task: $task, 
                            tappedAction: { task in
                                todo.tasks.append(task)
                            }
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
                TextField("Untitled", text: $newTodo.title)
                    .font(.title)
                    .padding()
                    .onChange(of: newTodo.title) {
                        print(newTodo.title)
                    }
                List {
                    ForEach($newTodo.tasks) { $task in
                        TaskCell(
                            cellType: .addTodo,
                            task: $task,
                            tappedAction: { newTask in
                                
                                //
                                let idList = newTodo.tasks.map{ $0.id }
                                guard let findIdx = idList.firstIndex(of: newTask.id) else { return }
                                newTodo.tasks[findIdx] = newTask
//                                newTodo.tasks.append(newTask)
                            }
                        )
                        
//                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
//                            Button(role: .destructive) {
//                                print("delete")
//                                
//                            } label: {
//                                Image(systemName: "trash")
//                            }
//                        }
                    }
                    .onDelete { offsets in
                        todo.tasks.remove(atOffsets: offsets)
                        print(todo.tasks)
                        // FIXME: 삭제 안됨..ㅎ
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
                // TODO: - save
//                let newTodo = TodoData(createDate: dateFormatter(), title: newTodo.title, tasks: newTodo.tasks)
                todos.append(newTodo)
                print(newTodo)
                saveTask(todos)
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
        newTodo.tasks.append(newTask)
    }
    
    
    // FIXME: 재사용이하고시퍼요 delete하고 다시 save 해줘야,,?하지 않나,,? 근데 매개변수타입이 달라,,
    func saveTask(_ data: [TodoData]) {
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("todos.json")
        print(fileURL)
        if let data = try? JSONEncoder().encode(data) {
            try? data.write(to: fileURL)
        }
    }
    
    
    
    func deleteTask() {
        
    }

    
    func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}

//#Preview {
//    TaskView()
//}
