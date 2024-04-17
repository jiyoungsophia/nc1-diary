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
                    
                    NavigationLink {
                        TaskView(cellType: .addTodo, todo: $newTodo)
                    } label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundStyle(.green)
                    }

//                    Button{
//                        gotoNewTask = true
//                        print("addtodo")
//                        
//                    } label: {
//                        Image(systemName: "plus")
//                            .font(.title)
//                            .foregroundStyle(.green)
//                    }
                }
                .padding([.horizontal, .top])
                
                // - FIXME: 분기처리(데이터 있는 화면)
//                .navigationDestination(isPresented: $gotoNewTask) {
//                    TaskView(cellType: .addTodo, todo: $newTodo)
//                }
                
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
                                
                                NavigationLink {
                                    TaskView(cellType: .todo, todo: $todo)
                                } label: {
                                    Image(systemName: "pencil")
                                }

//                                Button {
//                                    gotoEditTask = true
//                                    print("todo")
//                                    
//                                } label: {
//                                    Image(systemName: "pencil")
//                                }
//                                .tint(.green)
                                
                              // - FIXME: 분기처리(데이터 있는 화면)
//                                .navigationDestination(isPresented: $gotoEditTask) {
//                                    TaskView(cellType: .todo, todo: $todo)
//                                }
                                
                            }
                    }
                }
                .listStyle(.plain)
                
                
                Spacer()
            }
            
            
        }
    }
}

#Preview {
    TodoMainView()
}
