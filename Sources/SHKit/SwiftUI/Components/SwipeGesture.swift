//
//  SwipeGesture.swift
//  
//
//  Created by Mohamed Shemy on 20/05/2023.
//

import SwiftUI

public struct SwipeGesture: ViewModifier {
    
    let up: ((DragGesture.Value) -> Void)?
    let down: ((DragGesture.Value) -> Void)?
    let left: ((DragGesture.Value) -> Void)?
    let right: ((DragGesture.Value) -> Void)?
    let padding: CGFloat
    let state: State
    
    public init(padding: CGFloat, state: State,
                up: ((DragGesture.Value) -> Void)? = nil,
                down: ((DragGesture.Value) -> Void)? = nil,
                left: ((DragGesture.Value) -> Void)? = nil,
                right: ((DragGesture.Value) -> Void)? = nil) {
        self.up = up
        self.down = down
        self.left = left
        self.right = right
        self.padding = padding
        self.state = state
    }
    
    public func body(content: Content) -> some View {
        content.gesture(
            DragGesture()
                .onChanged { value in
                    if state == .onChanged {
                        calculateDragPosition(from: value)
                    }
                }
                .onEnded { value in
                    if state == .onEnded {
                        calculateDragPosition(from: value)
                    }
                })
    }
    
    private func calculateDragPosition(from value: DragGesture.Value) {
        let p = padding
        let w = value.translation.width
        let h = value.translation.height
        if w > 0 && h.inRange(closed: -p, p) { right?(value) }
        else if w < 0 && h.inRange(closed: -p, p) { left?(value) }
        else if h < 0 && w.inRange(closed: -p, p) { up?(value) }
        else if h > 0 && w.inRange(closed: -p, p){ down?(value) }
    }
}

public extension SwipeGesture {
    
    enum State {
        
        case onEnded
        case onChanged
    }
}

public extension View {
    
    func onDrag(padding: CGFloat = 50, state: SwipeGesture.State = .onEnded,
                up: ((DragGesture.Value) -> Void)? = nil,
                down: ((DragGesture.Value) -> Void)? = nil,
                left: ((DragGesture.Value) -> Void)? = nil,
                right: ((DragGesture.Value) -> Void)? = nil) -> some View {
        
        modifier(SwipeGesture(padding: padding, state: state, up: up, down: down, left: left, right: right))
    }
}
