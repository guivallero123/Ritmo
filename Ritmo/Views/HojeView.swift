
import SwiftUI
import SwiftData

// ================================================
// INÍCIO DA TELA HOJE
// Mostra o progresso e permite concluir hábitos.
// ================================================

struct HojeView: View {

    // MARK: - INÍCIO DOS DADOS RECEBIDOS

    // Lista de objetos persistentes do SwiftData.
    let habitos: [Habito]

    // MARK: - FIM DOS DADOS RECEBIDOS


    // MARK: - INÍCIO DOS CÁLCULOS

    private var totalHabitos: Int {

        habitos.count

    } // FIM DA PROPRIEDADE totalHabitos


    private var habitosConcluidos: Int {

        habitos.filter { habito in
            habito.concluido
        }.count

    } // FIM DA PROPRIEDADE habitosConcluidos

    // MARK: - FIM DOS CÁLCULOS


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


            // MARK: - INÍCIO DA VERIFICAÇÃO

            if habitos.isEmpty {

                // MARK: - INÍCIO DO ESTADO VAZIO

                ContentUnavailableView(
                    "Nenhum hábito ainda",
                    systemImage: "checklist",
                    description: Text(
                        "Crie um hábito para começar a acompanhar seu progresso."
                    )
                )
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )

                // MARK: - FIM DO ESTADO VAZIO

            } else {

                // MARK: - INÍCIO DO CARTÃO DE PROGRESSO

                ProgressoHabitosView(
                    concluidos: habitosConcluidos,
                    total: totalHabitos
                )

                // MARK: - FIM DO CARTÃO DE PROGRESSO


                // MARK: - INÍCIO DA SEÇÃO DE HÁBITOS

                VStack(alignment: .leading, spacing: 12) {

                    Text("Seus hábitos")
                        .font(.headline)

                    // MARK: - INÍCIO DA LISTA DE HÁBITOS

                    ForEach(habitos) { habito in

                        LinhaHabitoView(habito: habito) {

                            alternarConclusao(do: habito)

                        } // FIM DA AÇÃO DA LINHA

                    } // FIM DO FOREACH

                    // MARK: - FIM DA LISTA DE HÁBITOS

                } // FIM DO VSTACK DOS HÁBITOS

                // MARK: - FIM DA SEÇÃO DE HÁBITOS

            } // FIM DO IF / ELSE

            // MARK: - FIM DA VERIFICAÇÃO


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

    // Alterna a conclusão do hábito.
    private func alternarConclusao(do habito: Habito) {

        // Altera diretamente o objeto persistente.
        habito.concluido.toggle()

    } // FIM DA FUNÇÃO alternarConclusao

    // MARK: - FIM DAS FUNÇÕES

} // FIM DA STRUCT HOJEVIEW

// ================================================
// FIM DA TELA HOJE
// ================================================


// MARK: - INÍCIO DA PRÉVIA

#Preview {

    HojeView(habitos: [])

        // Usa um armazenamento temporário
        // apenas para a prévia do Xcode.
        .modelContainer(
            for: Habito.self,
            inMemory: true
        )

} // FIM DA PRÉVIA
