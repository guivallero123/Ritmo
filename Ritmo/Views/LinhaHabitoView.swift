
import SwiftUI

// ================================================
// INÍCIO DO COMPONENTE LINHA DE HÁBITO
// Mostra um hábito e permite clicar nele.
// ================================================

struct LinhaHabitoView: View {

    // MARK: - INÍCIO DOS DADOS RECEBIDOS

    let habito: Habito

    // Ação executada ao clicar na linha.
    let aoClicar: () -> Void

    // MARK: - FIM DOS DADOS RECEBIDOS


    // ================================================
    // INÍCIO DA INTERFACE
    // ================================================

    var body: some View {

        Button {

            aoClicar()

        } label: {

            HStack(spacing: 10) {

                // MARK: - INÍCIO DO ÍCONE

                Image(
                    systemName: habito.concluido
                        ? "checkmark.circle.fill"
                        : "circle"
                )
                .foregroundStyle(
                    habito.concluido
                        ? .green
                        : .secondary
                )

                // MARK: - FIM DO ÍCONE


                // MARK: - INÍCIO DO NOME

                Text(habito.nome)
                    .foregroundStyle(
                        habito.concluido
                            ? .secondary
                            : .primary
                    )

                // MARK: - FIM DO NOME


                Spacer()

            } // FIM DO HSTACK

            .contentShape(Rectangle())

        } // FIM DO BUTTON

        .buttonStyle(.plain)

    } // FIM DO BODY

    // ================================================
    // FIM DA INTERFACE
    // ================================================

} // FIM DA STRUCT LINHAHABITOVIEW

// ================================================
// FIM DO COMPONENTE LINHA DE HÁBITO
// ================================================


// MARK: - INÍCIO DA PRÉVIA

#Preview {

    LinhaHabitoView(
        habito: Habito(nome: "Ler 20 minutos"),
        aoClicar: {}
    )
    .padding()

} // FIM DA PRÉVIA
