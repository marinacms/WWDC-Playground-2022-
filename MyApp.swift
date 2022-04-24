import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
            Scene6()
            }
            .navigationViewStyle(StackNavigationViewStyle())
//            Scene3()
//            UkuleleScene()
        }
    }
}
