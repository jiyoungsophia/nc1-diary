//
//  ContentView.swift
//  todotodo
//
//  Created by 지영 on 4/11/24.
//

import SwiftUI

struct TodoListView: View {
    var body: some View {
        VStack {
          RoundedRectangle(cornerRadius: 20)
            .foregroundStyle(.cellGreen)
          RoundedRectangle(cornerRadius: 20)
            .foregroundStyle(.cellLightGreen)
          RoundedRectangle(cornerRadius: 20)
            .foregroundStyle(.cellDarkGreen)
        }
        .padding()
    }
}

#Preview {
    TodoListView()
}
