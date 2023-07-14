//
//  SHScrollView.swift
//  
//
//  Created by Mohamed Shemy on 20/05/2023.
//

import SwiftUI

///
/// [Source][spec]
///
/// [spec]: https://www.swiftbysundell.com/articles/observing-swiftui-scrollview-content-offset/
///
public struct SHScrollView<Content: View>: View {
    
    internal var axes: Axis.Set = [.vertical]
    internal var showsIndicators = true
    @Binding internal var offset: CGPoint
    @ViewBuilder internal var content: () -> Content
    
    // The name of our coordinate space doesn't have to be
    // stable between view updates (it just needs to be
    // consistent within this view), so we'll simply use a
    // plain UUID for it:
    private let coordinateSpaceName = UUID()
    
    public var body: some View {
        ScrollView(axes, showsIndicators: showsIndicators) {
            PositionObservingView(
                coordinateSpace: .named(coordinateSpaceName),
                position: Binding(
                    get: { offset },
                    set: { newOffset in
                        offset = CGPoint(
                            x: -newOffset.x,
                            y: -newOffset.y
                        )
                    }
                ),
                content: content
            )
        }
        .coordinateSpace(name: coordinateSpaceName)
    }
    
    public init(_ axes: Axis.Set, showsIndicators: Bool = true, offset: Binding<CGPoint>, content: @escaping () -> Content) {
        self.axes = axes
        self.showsIndicators = showsIndicators
        self._offset = offset
        self.content = content
    }
}

internal extension SHScrollView {
    
    struct PositionObservingView<Content: View>: View {
        
        var coordinateSpace: CoordinateSpace
        @Binding var position: CGPoint
        @ViewBuilder var content: () -> Content
        
        var body: some View {
            content()
                .background(GeometryReader { geometry in
                    Color.clear.preference(
                        key: PositionPreferenceKey.self,
                        value: geometry.frame(in: coordinateSpace).origin
                    )
                })
                .onPreferenceChange(PositionPreferenceKey.self) { position in
                    self.position = position
                }
        }
    }
}

internal extension SHScrollView.PositionObservingView {
    
    struct PositionPreferenceKey: PreferenceKey {
        
        static var defaultValue: CGPoint { .zero }
        
        static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
            // No-op
        }
    }
}
