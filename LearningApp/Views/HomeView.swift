//
//  ContentView.swift
//  LearningApp
//
//  Created by Domenico Montalto on 12/17/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        NavigationView{
            
            VStack(alignment: .leading){
                
                Text("What would you like to do today?")
                    .padding(.leading, 20)
                
                ScrollView {
                    
                    LazyVStack {
                        
                        ForEach(model.modules){ module in
                            
                            VStack(spacing: 20){
                                
                                NavigationLink(
                                    destination:
                                        ContentView()
                                        .onAppear(perform: {
                                            model.beginModule(module.id)
                                        }) ,
                                    tag: module.id, // Set tag equal to the id of the module
                                    selection: $model.currentContentSelected, // Set currentContentSelected to the module.id
                                    label: {// Learning Card
                                        HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                        
                                    })
                                
                                NavigationLink(
                                    destination:
                                        TestView()
                                            .onAppear(perform: {
                                                model.beginTest(module.id)
                                        }),
                                    tag: module.id,
                                    // Set tag equal to the id of the module
                                    selection: $model.currentTestSelected,
                                    // Set currentTestSelected to the module.id
                                               label: {
                                    // Test Card
                                    HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Questions", time: module.test.time)
                                })
                            }
                            .padding(.bottom, 10)
                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
            }
            .navigationTitle("Get Started")
        }
        .navigationViewStyle(.stack) // Puts the stack navigation view style and allows us to watch videos in the app
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
