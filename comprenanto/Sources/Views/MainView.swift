import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            SidebarView()
            ContentView()
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct SidebarView: View {
    var body: some View {
        List {
            NavigationLink(destination: ContentView()) {
                Text("Item 1")
            }
            NavigationLink(destination: ContentView()) {
                Text("Item 2")
            }
        }
        .listStyle(SidebarListStyle())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Content goes here")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
} 