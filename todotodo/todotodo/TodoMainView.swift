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
    @State private var isShowingAddTask = false
    @State private var isShowingEditTask = false
    
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
                    
                    Button {
                        isShowingAddTask.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundStyle(.green)
                    }
                    .sheet(isPresented: $isShowingAddTask) {
                        TaskView(cellType: .addTodo, todos: $todos, todo: $newTodo)
                    }
                    
                    //                    NavigationLink { // 버튼 대신
                    //                        TaskView(cellType: .addTodo, todos: $todos, todo: $newTodo)
                    //                    } label: {
                    //                        Image(systemName: "plus")
                    //                            .font(.title)
                    //                            .foregroundStyle(.green)
                    //                    }
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
                                
                                Button {
                                    isShowingEditTask.toggle()
                                } label: {
                                    Image(systemName: "plus")
                                        .font(.title)
                                        .foregroundStyle(.green)
                                }
                                .sheet(isPresented: $isShowingEditTask) {
                                    TaskView(cellType: .editTodo, todos: $todos, todo: $newTodo)
                                }
                                
//                                NavigationLink { // 버튼 대신
//                                    TaskView(cellType: .editTodo, todos: $todos, todo: $newTodo)
//                                } label: {
//                                    Image(systemName: "pencil")
//                                }
                            }
                    }
                    // MARK: 확인하기~,,
                    .onDelete { offsets in
                        todos.remove(atOffsets: offsets)
                    }
                }
                .listStyle(.plain)
                
                Spacer()
            }
            .onAppear {
                // TODO:  newTODO reset
                print(todos)
                //                print(todos)
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
