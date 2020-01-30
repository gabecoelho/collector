import SwiftUI

struct ExampleTabbedView : View {
    @State private var selection = 1
    
    var body: some View {
        TabView(selection: $selection) {
          
            Text("Tab 1")
                .tabItem({
                    selection == 1 ?
                        Image(systemName: "person.and.person.fill")
                            .imageScale(.large) :
                        Image(systemName: "person.and.person")
                            .imageScale(.large)
                    Text("Tab 1")
                })
                .tag(1)
            Text("Tab 2")
                .tabItem({
                    selection == 2 ?
                        Image(systemName: "tray.full.fill")
                            .imageScale(.large) :
                        Image(systemName: "tray.full")
                            .imageScale(.large)
                    Text("Tab 2")
                })
                .tag(2)
            Text("Tab 3")
                .tabItem({
                    selection == 3 ?
                        Image(systemName: "bubble.left.fill")
                            .imageScale(.large) :
                        Image(systemName: "bubble.left")
                            .imageScale(.large)
                    Text("Tab 3")
                })
                .tag(3)
            Text("Tab 4")
                .tabItem({
                    Image(systemName: "calendar")
                        .imageScale(.large)
                    Text("Tab 4")
                })
                .tag(4)
            Text("Tab 5")
                .tabItem({
                    selection == 5 ?
                        Image(systemName: "person.crop.circle.fill")
                            .imageScale(.large) :
                        Image(systemName: "person.crop.circle")
                            .imageScale(.large)
                    Text("Tab 5")
                })
                .tag(5)
        }.edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct ExampleTabbedView_Previews : PreviewProvider {
    static var previews: some View {
        ExampleTabbedView()
    }
}
#endif
