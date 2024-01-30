import ComposableArchitecture
import SwiftUI

internal struct CircleTransitionViewModifier<S>: ViewModifier where S: ShapeStyle {
    var store: StoreOf<CircleTransition>
    
    private var shapeStyle: S
    
    internal init(
        style: S,
        store: StoreOf<CircleTransition>
    ) {
        self.shapeStyle = style
        self.store = store
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Circle()
                .fill(self.shapeStyle)
                .scaleEffect(store.circleScale)
                .opacity(store.circleOpacity)
                
            if store.isCircleVisible {
                content
                    .transition(.opacity)
            }
        }
    }
}

public extension View {
    @ViewBuilder
    func circleTransition(
        _ store: StoreOf<CircleTransition>,
        style: some ShapeStyle = Color.blue
    ) -> some View {
        self
            .modifier(
                CircleTransitionViewModifier(
                    style: style,
                    store: store
                )
            )
    }
}
