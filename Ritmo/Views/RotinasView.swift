
import SwiftUI

// MARK: - INÍCIO DA TELA ROTINAS
struct RotinasView: View {

    // MARK: - INÍCIO DA INTERFACE
    var body: some View {

        VStack(spacing: 16) {

            Text("Minhas rotinas")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Organize suas atividades do dia a dia.")
                .foregroundStyle(.secondary)

        } // FIM DO VSTACK
        .frame(maxWidth: .infinity, maxHeight: .infinity)

    } // FIM DO BODY
    // MARK: - FIM DA INTERFACE

} // FIM DA STRUCT RotinasView
// MARK: - FIM DA TELA ROTINAS


// MARK: - INÍCIO DA PRÉVIA
#Preview {
    RotinasView()
}
// MARK: - FIM DA PRÉVIA
