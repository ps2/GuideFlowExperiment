//
//  GuideNavigationViewController.swift
//  GuideFlow
//
//  Created by Pete Schwamb on 2/13/20.
//  Copyright © 2020 Pete Schwamb. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

protocol GuidePageProvider {
    associatedtype Content
    func nextPage() -> Content
}

class ExampleGuideViewModel: GuidePageProvider {
    func nextPage() -> RegistrationView {
        return RegistrationView()
    }
}

struct RegistrationView: View {
    @State var navToSettings: Bool = false
    
    var body: some View {
        VStack {

            ZStack {
                Circle().fill(Color.green)
                Text("Registration")
            }
            NavigationLink("Register NavigationLink", destination: SettingsView(navSource: "Navlink").navigationBarBackButtonHidden(true), isActive: $navToSettings).hidden()
            Button(action: {
                self.navToSettings = true
                print("Pressed")
            }) {
                Text("Register Button")
            }
        }.onAppear() {
            self.navToSettings = false
        }
    }
}

struct SettingsView: View {
    @State var navSource: String
    
    var body: some View {
        VStack {
            ZStack {
                Circle().fill(Color.blue)
                Text("Settings")
            }
            Text(navSource)
        }
    }
}


class GuideNavigationViewController: UINavigationController {
    var guidePageProvider: ExampleGuideViewModel
    
    init(guidePageProvider: ExampleGuideViewModel) {
        self.guidePageProvider = guidePageProvider
        let firstPage = guidePageProvider.nextPage()
        let rootViewController = UIHostingController(rootView: firstPage)
        rootViewController.title = "TODO: sniff from view"
        super.init(rootViewController: rootViewController)
        self.navigationBar.prefersLargeTitles = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
