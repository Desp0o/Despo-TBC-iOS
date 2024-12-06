import SwiftUI

struct SliderButton: View {
    @Binding var isActive: Bool
    
    var body: some View {
        HStack(spacing: 10) {
            Text(isActive ? "Set Online" : "Set Offline")
                .foregroundColor(.white)
                .frame(width:90)
            
            Toggle("", isOn: $isActive)
                .labelsHidden()
        }
        .fontWeight(.bold)
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .background(Color.white.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    @Previewable @State var isActive = true
    SliderButton(isActive: $isActive)
}

