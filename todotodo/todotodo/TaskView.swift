//
//  TaskView.swift
//  todotodo
//
//  Created by 지영 on 4/15/24.
//

import SwiftUI

struct TaskView: View {
    
    @State var newMemo: String = ""
    
    let todos: [TodoData] = TodoData.sampleData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(todos[0].createDate)")
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .center)
            TextField("Untitled", text: $newMemo)
                .font(.title)
                .padding()
                .onChange(of: newMemo) {
                    print(newMemo)
                }
            
            
            if todos[0].tasks != nil {
                List {
//                    ForEach(todos[0].tasks ?? []) { task in
//                        TaskCell(task: task)
//                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
//                                Button(role: .destructive) {
//                                    print("delete")
//                                } label: {
//                                    Image(systemName: "trash")
//                                    //                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
//                                }
//                                
//                            }
//                    }
                }
                .listStyle(.plain)
            } else {
                Text("No Tasks")
                    .font(.title2.bold())
                    .foregroundStyle(.cellDarkGreen)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            }
            
            
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
