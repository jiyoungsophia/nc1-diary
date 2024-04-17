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
                        TaskView(cellType: .addTodo, todo: $newTodo)
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
                                    TaskView(cellType: .editTodo, todo: $todo)
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
    }
}

#Preview {
    TodoMainView()
}
