import CircleTransition
import ComposableArchitecture
import SwiftUI

struct ExampleView: View {
    let store = Store(
        initialState: CircleTransition.State(),
        reducer: CircleTransition()
    )
    
    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                VStack {
                    Text("Example")
                    Button(
                        "Show New View",
                        action: { viewStore.send(.startTransition) }
                    )
                }
                
                VStack {
                    Text("Content")
                    Button(
                        "Close",
                        action: { viewStore.send(.dismissTransition) }
                    )
                    .foregroundColor(.white)
                }
                .circleTransition(store, style: Color.red.gradient)
            }
        }
    }
}

// MARK: - Preview
struct CircleTransitionView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
