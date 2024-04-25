//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by bruno on 25/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var langs: [String] = ["Swift", "Kotlin", "JavaScript", "Python"]
    @State private var addLang = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false
    
    var body: some View {
        VStack { // Início do VStack principal
            VStack(spacing: 8) { // Início do VStack aninhado
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick-a-Pal")
            } // Fim do VStack aninhado
            .font(.title)
            .bold()
            
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
            
            List {
                ForEach(langs, id: \.self) { lang in Text(lang) }
            }
            
            TextField("Add Name", text: $addLang)
                .autocorrectionDisabled()
                .onSubmit {
                    if !addLang.isEmpty {
                        langs.append(addLang)
                        addLang = ""
                    }
                }
            
            Toggle("Remove picked names", isOn: $shouldRemovePickedName)
            
            Button {
                if let randomLang = langs.randomElement() {
                    pickedName = randomLang
                    
                    if shouldRemovePickedName {
                        langs.removeAll { lang in lang == randomLang }
                    }
                } else {
                    pickedName = ""
                }
            } label: {
                Text("Pick Random Name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        } // Fim do VStack principal
        .padding()
    }
}



#Preview {
    ContentView()
}
