//
//  InstructionListView.swift
//  DashKitUI
//
//  Created by Pete Schwamb on 2/7/20.
//  Copyright © 2020 Tidepool. All rights reserved.
//

import SwiftUI

struct InstructionListView: View {
    let instructions: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(instructions.indices, id: \.self) { index in
                HStack(alignment: .top) {
                    Text("\(index+1)")
                        .padding(6)
                        .background(Circle().fill(Color.accentColor))
                        .foregroundColor(Color.white)
                        .font(.caption)
                    Text(self.instructions[index])
                        .padding(2)
                }
            }
        }
    }
}
