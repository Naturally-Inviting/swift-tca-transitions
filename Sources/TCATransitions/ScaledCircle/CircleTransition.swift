import ComposableArchitecture
import SwiftUI

public struct CircleTransition: ReducerProtocol {
    // MARK: - State
    public struct State: Equatable {
        
        public var circleOpacity: CGFloat
        public var circleScale: CGFloat
        public var isCircleVisible: Bool
        
        public init(
            circleOpacity: CGFloat = .zero,
            circleScale: CGFloat = 1,
            isCircleVisible: Bool = false
        ) {
            self.circleOpacity = circleOpacity
            self.circleScale = circleScale
            self.isCircleVisible = isCircleVisible
        }
    }
    
    // MARK: - Action
    public enum Action {
        case task
        case startTransition
        case dismissTransition
        case transitionEnded
        
        case setScale(scale: CGFloat)
        case setOpacity(opacity: CGFloat)
    }
    
    @Dependency(\.continuousClock) var clock
    
    public init() {}
    
    // MARK: - Reducer Body
    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .startTransition:
            return .run { send in
                await send(.setOpacity(opacity: 1), animation: .default.speed(2))
                await send(.setScale(scale: 3), animation: .easeIn)
                
                try await clock.sleep(for: .milliseconds(250))
                await send(.transitionEnded, animation: .default)
            }
            
        case let .setScale(scale):
            state.circleScale = scale
            return .none
            
        case let .setOpacity(opacity):
            state.circleOpacity = opacity
            return .none
            
        case .transitionEnded:
            state.isCircleVisible = true
            return .none
            
        case .dismissTransition:
            state.isCircleVisible = false
            
            return .run { send in
                await send(.setScale(scale: 1), animation: .easeIn)
                await send(.setOpacity(opacity: 0), animation: .default)
            }
            
        default:
            return .none
        }
    }
}
