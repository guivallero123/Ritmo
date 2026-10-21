
import SwiftUI
import SwiftData

// ================================================
// INÍCIO DA CONTENTVIEW
// Organiza a navegação principal do Ritmo.
// ================================================

struct ContentView: View {

    // MARK: - INÍCIO DOS ESTADOS

    // Controla a seção selecionada na barra lateral.
    @State private var selecao: Secao? = .hoje

    // Consulta os hábitos armazenados pelo SwiftData.
    @Query(sort: \Habito.nome)
    private var habitos: [Habito]

    // MARK: - FIM DOS ESTADOS


    // MARK: - INÍCIO DAS SEÇÕES

    enum Secao: String, CaseIterable, Identifiable {

        case hoje = "Hoje"
        case habitos = "Hábitos"
        case rotinas = "Rotinas"

        var id: Self { self }

        var simbolo: String {

            switch self {

            case .hoje:
                return "checkmark.circle"

            case .habitos:
                return "repeat"

            case .rotinas:
                return "calendar"

            }

        } // FIM DA PROPRIEDADE simbolo

    } // FIM DO ENUM SECAO

    // MARK: - FIM DAS SEÇÕES


    // ================================================
    // INÍCIO DA INTERFACE
    // ================================================

    var body: some View {

        NavigationSplitView {

            // MARK: - INÍCIO DA BARRA LATERAL

            List(Secao.allCases, selection: $selecao) { secao in

                Label(
                    secao.rawValue,
                    systemImage: secao.simbolo
                )
                .tag(secao)

            } // FIM DA LISTA DE SEÇÕES

            .navigationTitle("Ritmo")
            .listStyle(.sidebar)

            // MARK: - FIM DA BARRA LATERAL

        } detail: {

            // MARK: - INÍCIO DA NAVEGAÇÃO

            switch selecao {

            case .hoje:

                HojeView(habitos: habitos)

            case .habitos:

                HabitosView(habitos: habitos)

            case .rotinas:

                RotinasView()

            case nil:

                Text("Selecione uma seção")
                    .foregroundStyle(.secondary)

            } // FIM DO SWITCH

            // MARK: - FIM DA NAVEGAÇÃO

        } // FIM DO NAVIGATIONSPLITVIEW

        .frame(minWidth: 650, minHeight: 400)

    } // FIM DO BODY

    // ================================================
    // FIM DA INTERFACE
    // ================================================

} // FIM DA STRUCT CONTENTVIEW


// MARK: - INÍCIO DA PRÉVIA

#Preview {

    ContentView()
        .modelContainer(
            for: Habito.self,
            inMemory: true
        )

} // FIM DA PRÉVIA
