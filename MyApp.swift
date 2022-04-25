import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
           Scene1()
            }
            .navigationViewStyle(StackNavigationViewStyle())
//            Scene3()
//            UkuleleScene()
        }
    }
}
