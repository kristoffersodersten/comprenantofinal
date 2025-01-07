import SwiftUI

struct iPadMainView: View {
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

struct iPadMainView_Previews: PreviewProvider {
    static var previews: some View {
        iPadMainView()
    }
} 