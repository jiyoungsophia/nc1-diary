//
//  ContentView.swift
//  todotodo
//
//  Created by 지영 on 4/11/24.
//

import SwiftUI

// - TODO: task뷰 분기처리

struct TodoMainView: View {
    let todos: [TodoData] = TodoData.sampleData
    @State private var gotoTask = false
    
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
                        gotoTask = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundStyle(.green)
                    }
                    
                }
                .padding([.horizontal, .top])
                
                
                List {
                    ForEach(todos) { todo in
                        TodoMainCell(todos: todo)
                            .listRowSeparator(.hidden)
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button(role: .destructive) {
                                    print("delete")
                                } label: {
                                    Image(systemName: "trash")
//                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                }
                                
                                
                                Button {
                                    gotoTask = true
                                } label: {
                                    Image(systemName: "pencil")
//                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                }
                                .tint(.green)
                                .navigationDestination(isPresented: $gotoTask) {
                                    TaskView()
                                }

                            }
                    }
                }
                .listStyle(.plain)

        
                Spacer()
            }
            .navigationDestination(isPresented: $gotoTask) {
                TaskView()
            }
            
        }
    }
}

#Preview {
    TodoMainView()
}
