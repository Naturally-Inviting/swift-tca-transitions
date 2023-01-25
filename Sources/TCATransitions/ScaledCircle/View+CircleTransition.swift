import ComposableArchitecture
import SwiftUI

internal struct CircleTransitionViewModifier<S>: ViewModifier where S: ShapeStyle {
    @ObservedObject var viewStore: ViewStoreOf<CircleTransition>
    
    private var shapeStyle: S
    
    internal init(
        style: S,
        viewStore: ViewStoreOf<CircleTransition>
    ) {
        self.shapeStyle = style
        self.viewStore = viewStore
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Circle()
                .fill(self.shapeStyle)
                .scaleEffect(viewStore.circleScale)
                .opacity(viewStore.circleOpacity)
                
            if viewStore.isCircleVisible {
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
                    viewStore: ViewStore(store)
                )
            )
    }
}
