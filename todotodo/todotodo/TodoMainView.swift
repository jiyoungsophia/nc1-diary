//
//  ContentView.swift
//  todotodo
//
//  Created by 지영 on 4/11/24.
//

import SwiftUI

struct TodoMainView: View {
    let todos: [TodoData] = TodoData.sampleData
    @State private var addTodo = false
    
    var body: some View {
        NavigationStack {
            VStack  {
                HStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 60)
                    Spacer()
                    
                    Button{
                        addTodo = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundStyle(.green)
                    }
                    
                }
                .padding([.horizontal, .top])
                .navigationDestination(isPresented: $addTodo) {
                    TaskView()
                }
                
                List {
                    ForEach(todos) { todo in
                        TodoMainCell(todos: todo)
                            .listRowSeparator(.hidden)
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button(role: .destructive) {
                                    print("delete")
                                } label: {
                                    Image(systemName: "trash")
                                }
                                
                                Button {
                                    print("update")
                                } label: {
                                    Image(systemName: "pencil")
                                }
                                .tint(.green)

                            }
                    }
                }
                .listStyle(.plain)
                
                
                
                //                List(todos[0].tasks) { task in
                //                    TaskCell(task: task)
                //                        .listRowBackground(
                //                            RoundedRectangle(cornerRadius: 16)
                //                                .fill(.white)
                //                                .padding(4)
                //                        )
                //                        .listRowSeparator(.hidden)
                //                        .frame(height: 50)
                //
                //                }
                //                .listStyle(.plain)
                //                .padding([.horizontal], 14)
                
                Spacer()
            }
            //            .padding()
        }
    }
}

#Preview {
    TodoMainView()
}
