//
//  _2_SwiftUI_Lists_and_GridsApp.swift
//  32.SwiftUI Lists and Grids
//
//  Created by Despo on 15.12.24.
//

import SwiftUI

@main
struct _2_SwiftUI_Lists_and_GridsApp: App {
    @StateObject var viewModel = ViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
