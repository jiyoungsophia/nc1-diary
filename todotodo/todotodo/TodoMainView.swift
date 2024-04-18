//
//  ContentView.swift
//  todotodo
//
//  Created by 지영 on 4/11/24.
//

import SwiftUI

// - TODO: task뷰 분기처리

struct TodoMainView: View {
    @State private var todos: [TodoData] = TodoData.sampleData
    @State private var gotoNewTask = false
    @State private var gotoEditTask = false
    
    @State private var newTodo: TodoData = TodoData(createDate: "", title: "")
    
    var body: some View {
        NavigationStack {
            VStack  {
                HStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 60)
                    Spacer()
                    
                    NavigationLink { // 버튼 대신
                        TaskView(cellType: .addTodo, todos: $todos, todo: $newTodo)
                    } label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundStyle(.green)
                    }
                }
                .padding([.horizontal, .top])
                
                List {
                    ForEach($todos) { $todo in
                        TodoMainCell(todo: $todo)
                            .listRowSeparator(.hidden)
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button(role: .destructive) {
                                    print("delete")
                                } label: {
                                    Image(systemName: "trash")
                                }
                                
                                NavigationLink { // 버튼 대신
                                    TaskView(cellType: .editTodo, todos: $todos, todo: $newTodo)
                                } label: {
                                    Image(systemName: "pencil")
                                }
                            }
                    }
                }
                .listStyle(.plain)
                
                Spacer()
            }
            
            
        }
        
//        func loadTask() {
//            let fileURL = getDocumentsDirectory().appendingPathComponent("todos.json")
//            if let data = try? Data(contentsOf: fileURL) {
//                if let decoded = try? JSONDecoder().decode([Person].self, from: data) {
//                    self.people = decoded
//                }
//            }
//        }
        
//        func getDocumentsDirectory() -> URL {
//            FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//        }
        
    }
}

#Preview {
    TodoMainView()
}
