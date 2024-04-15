//
//  ContentView.swift
//  todotodo
//
//  Created by 지영 on 4/11/24.
//

import SwiftUI

struct TodoMainView: View {
    let todos: [TodoData] = TodoData.sampleData
    //    @State var tag:Int? = nil
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
                .navigationDestination(isPresented: $addTodo) {
                    TaskView()
                }
                
                ForEach(todos) { todo in
                    //                    NavigationLink(destination: TaskView()) {
                    TodoMainCell(todos: todo)
                    //                    }
                    
                }
                
                
                
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
            .padding()
            //            .navigationTitle("TODOTO")
            //            .navigationBarTitleDisplayMode(.automatic)
            //            .toolbar {
            //                ToolbarItem(placement: .topBarTrailing) {
            //                    Button("New", systemImage: "plus") {
            //                        NavigationLink(destination: TaskView()) {
            //
            //                        }
            //
            //                    }
            //                }
            //            }
        }
    }
}

#Preview {
    TodoMainView()
}
