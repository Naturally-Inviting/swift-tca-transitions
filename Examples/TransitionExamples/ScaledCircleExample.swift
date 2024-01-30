import ComposableArchitecture
import TCATransitions
import SwiftUI

struct ScaledCircleExample: View {
    let store = Store(
        initialState: CircleTransition.State(),
        reducer: {
            CircleTransition()
        }
    )
    
    var body: some View {
        ZStack {
            VStack {
                Text("Example")
                Button(
                    "Show New View",
                    action: { store.send(.startTransition) }
                )
            }
            
            VStack {
                Text("Content")
                Button(
                    "Close",
                    action: { store.send(.dismissTransition) }
                )
                .foregroundColor(.white)
            }
            .circleTransition(store, style: Color.red.gradient)
        }
    }
}

// MARK: - Preview
struct CircleTransitionView_Previews: PreviewProvider {
    static var previews: some View {
        ScaledCircleExample()
    }
}
