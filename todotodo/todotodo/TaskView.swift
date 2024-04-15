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
                
            
            List(todos[0].tasks) { task in
                TaskCell(task: task)

            }
            .listStyle(.plain)
            
            Spacer()
            Button("Add New Task", systemImage: "plus", action: {
                print("add")
            })
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
//        .frame(width: UIScreen.main.bounds.width)
        .background(.pink)
//        .padding(.top, -50)
//        .ignoresSafeArea()
    }
}

#Preview {
    TaskView()
}
