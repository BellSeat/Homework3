//
//  ContentView.swift
//  Homework3
//
//  Created by qingran shao on 5/5/24.
//

import SwiftUI
import SwiftData

class TextStore: ObservableObject {
    @Published var texts: [String] = []

    init() {
        loadTexts()
    }

    func addText(_ text: String) {
        texts.append(text)
        saveTexts()
    }

    func saveTexts() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(texts) {
            UserDefaults.standard.set(encoded, forKey: "submittedTexts")
        }
    }

    func loadTexts() {
        if let textsData = UserDefaults.standard.data(forKey: "submittedTexts"),
           let decodedTexts = try? JSONDecoder().decode([String].self, from: textsData) {
            texts = decodedTexts
        }
    }
}

struct ContentView: View {
    @State private var searchText = ""
    @ObservedObject var textStore = TextStore()

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter search term", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    if !searchText.isEmpty {
                        textStore.addText(searchText)
                        searchText = ""
                    }
                }) {
                    Text("Submit")
                        .bold()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .accessibilityLabel("Submit Button")
                .accessibilityHint("Tap to submit the entered search term")
                
                List(textStore.texts, id: \.self) { text in
                    Text(text)
                }
            }
            .navigationTitle("User Inputs")
            // for assignment only
            .onAppear {
                textStore.loadTexts()
            }
            .onDisappear{
                textStore.saveTexts()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



