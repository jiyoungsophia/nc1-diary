//
//  TaskView.swift
//  todotodo
//
//  Created by 지영 on 4/15/24.
//

import SwiftUI

struct TaskView: View {
    let todos: [TodoData] = TodoData.sampleData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(todos[0].createDate)")
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .center)
            //            TextField(<#T##title: StringProtocol##StringProtocol#>, text: <#T##Binding<String>#>)
            Text("Untitled")
                .font(.title)
                .padding()

            
            List {
                ForEach(todos[0].tasks) { task in
                    TaskCell(task: task)
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button(role: .destructive) {
                                print("delete")
                            } label: {
                                Image(systemName: "trash")
//                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            }

                        }
                }
            }
            .listStyle(.plain)
            
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

#Preview {
    TaskView()
}
