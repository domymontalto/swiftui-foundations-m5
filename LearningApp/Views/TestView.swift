//
//  TestView.swift
//  LearningApp
//
//  Created by Domenico Montalto on 12/21/22.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        

        
        if model.currentQuestion != nil {
            VStack {
                //Question number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")

                // Question
                CodeTextView()

                // Answer

                // Button


            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
        }
        else {
            // Test hasn't loaded yet
            ProgressView()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
