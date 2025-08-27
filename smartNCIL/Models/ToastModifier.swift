import SwiftUI

struct ToastModifier: ViewModifier {
    @Binding var isPresented: Bool
    var message: String
    var duration: TimeInterval = 2.0

    func body(content: Content) -> some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                content
                if isPresented {
                    toastView
                        .frame(width: geometry.size.width * 0.9)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                                withAnimation {
                                    isPresented = false
                                }
                            }
                        }
                        .padding(.bottom, geometry.safeAreaInsets.bottom + 20)
                }
            }
            .ignoresSafeArea(edges: .bottom)
        }
        .animation(.easeInOut, value: isPresented)
    }

    private var toastView: some View {
        Text(message)
            .multilineTextAlignment(.center)
            .padding()
            .background(Color.black.opacity(0.85))
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}


extension View {
    func toast(isPresented: Binding<Bool>, message: String, duration: TimeInterval = 2.0) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, message: message, duration: duration))
    }
}
