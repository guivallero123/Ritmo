
import SwiftUI

// ================================================
// INÍCIO DA TELA HOJE
// Mostra o progresso e permite concluir hábitos.
// ================================================

struct HojeView: View {

    // MARK: - INÍCIO DOS DADOS RECEBIDOS

    // Recebe a lista compartilhada de hábitos.
    // @Binding permite ler e modificar os dados.
    @Binding var habitos: [Habito]

    // MARK: - FIM DOS DADOS RECEBIDOS


    // MARK: - INÍCIO DOS CÁLCULOS DE PROGRESSO

    // Conta todos os hábitos cadastrados.
    private var totalHabitos: Int {

        habitos.count

    } // FIM DA PROPRIEDADE totalHabitos


    // Conta somente os hábitos concluídos.
    private var habitosConcluidos: Int {

        habitos.filter { habito in
            habito.concluido
        }.count

    } // FIM DA PROPRIEDADE habitosConcluidos


    // Calcula a proporção concluída, de 0.0 até 1.0.
    private var progresso: Double {

        // Evita divisão por zero.
        guard totalHabitos > 0 else {
            return 0
        }

        return Double(habitosConcluidos) / Double(totalHabitos)

    } // FIM DA PROPRIEDADE progresso

    // MARK: - FIM DOS CÁLCULOS DE PROGRESSO


    // ================================================
    // INÍCIO DA INTERFACE
    // ================================================

    var body: some View {

        VStack(alignment: .leading, spacing: 24) {

            // MARK: - INÍCIO DO CABEÇALHO

            VStack(alignment: .leading, spacing: 6) {

                Text("Hoje")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Um dia de cada vez.")
                    .foregroundStyle(.secondary)

            } // FIM DO VSTACK DO CABEÇALHO

            // MARK: - FIM DO CABEÇALHO


            // MARK: - INÍCIO DA VERIFICAÇÃO DE HÁBITOS

            if habitos.isEmpty {

                // MARK: - INÍCIO DO ESTADO VAZIO

                ContentUnavailableView(
                    "Nenhum hábito ainda",
                    systemImage: "checklist",
                    description: Text(
                        "Crie um hábito para começar a acompanhar seu progresso."
                    )
                )

                // MARK: - FIM DO ESTADO VAZIO

            } else {

                // MARK: - INÍCIO DO CARTÃO DE PROGRESSO

                VStack(alignment: .leading, spacing: 14) {

                    HStack {

                        Text("Progresso diário")
                            .font(.headline)

                        Spacer()

                        Text("\(habitosConcluidos) de \(totalHabitos)")
                            .foregroundStyle(.secondary)

                    } // FIM DO HSTACK


                    ProgressView(value: progresso, total: 1)


                    Text("\(Int(progresso * 100))% dos hábitos concluídos")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                } // FIM DO VSTACK DO CARTÃO

                .padding(20)
                .background(.quaternary.opacity(0.3))
                .clipShape(
                    RoundedRectangle(cornerRadius: 20)
                )

                // MARK: - FIM DO CARTÃO DE PROGRESSO


                // MARK: - INÍCIO DA SEÇÃO DE HÁBITOS

                VStack(alignment: .leading, spacing: 12) {

                    Text("Seus hábitos")
                        .font(.headline)


                    // MARK: - INÍCIO DA LISTA DE HÁBITOS

                    ForEach(habitos) { habito in

                        // INÍCIO DO BOTÃO DO HÁBITO

                        Button {

                            // Alterna o estado do hábito.
                            alternarConclusao(do: habito)

                        } label: {

                            HStack(spacing: 10) {

                                // Ícone de conclusão.
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


                                // Nome do hábito.
                                Text(habito.nome)
                                    .foregroundStyle(
                                        habito.concluido
                                            ? .secondary
                                            : .primary
                                    )

                                Spacer()

                            } // FIM DO HSTACK DO HÁBITO

                            // Torna a linha inteira clicável.
                            .contentShape(Rectangle())

                        } // FIM DO BUTTON

                        .buttonStyle(.plain)

                        // FIM DO BOTÃO DO HÁBITO

                    } // FIM DO FOREACH

                    // MARK: - FIM DA LISTA DE HÁBITOS

                } // FIM DO VSTACK DOS HÁBITOS

                // MARK: - FIM DA SEÇÃO DE HÁBITOS

            } // FIM DO IF / ELSE

            // MARK: - FIM DA VERIFICAÇÃO DE HÁBITOS


            Spacer()

        } // FIM DO VSTACK PRINCIPAL

        .padding(24)

        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )

    } // FIM DO BODY

    // ================================================
    // FIM DA INTERFACE
    // ================================================


    // MARK: - INÍCIO DAS FUNÇÕES

    // Alterna a conclusão do hábito selecionado.
    private func alternarConclusao(do habito: Habito) {

        // Procura o hábito pelo UUID.
        guard let indice = habitos.firstIndex(where: {
            $0.id == habito.id
        }) else {
            return
        }

        // Inverte true e false.
        habitos[indice].concluido.toggle()

    } // FIM DA FUNÇÃO alternarConclusao

    // MARK: - FIM DAS FUNÇÕES

} // FIM DA STRUCT HojeView

// ================================================
// FIM DA TELA HOJE
// ================================================


// MARK: - INÍCIO DA PRÉVIA

#Preview {

    // Dados temporários para testar o estado vazio.
    @Previewable @State var habitosExemplo: [Habito] = []

    HojeView(habitos: $habitosExemplo)

} // FIM DA PRÉVIA
