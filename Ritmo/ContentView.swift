
import SwiftUI

// ================================================
// INÍCIO DA CONTENTVIEW
// Responsável pela navegação principal do Ritmo.
// ================================================

struct ContentView: View {

    // MARK: - INÍCIO DO ESTADO DA NAVEGAÇÃO

    // Guarda a seção selecionada na barra lateral.
    // O ? indica que também pode não haver seleção (nil).
    @State private var selecao: Secao? = .hoje

    // MARK: - FIM DO ESTADO DA NAVEGAÇÃO


    // MARK: - INÍCIO DOS DADOS COMPARTILHADOS

    // A ContentView é responsável por armazenar a lista.
    // Outras telas podem receber acesso a esses dados.
    @State private var habitos: [Habito] = [
        Habito(nome: "Ler 20 minutos"),
        Habito(nome: "Caminhar 30 minutos")
    ]

    // MARK: - FIM DOS DADOS COMPARTILHADOS


    // MARK: - INÍCIO DAS SEÇÕES DO APLICATIVO

    enum Secao: String, CaseIterable, Identifiable {

        // Define as opções disponíveis na barra lateral.
        case hoje = "Hoje"
        case habitos = "Hábitos"
        case rotinas = "Rotinas"

        // Identificador utilizado pela List.
        var id: Self { self }

        // Define o símbolo SF Symbols de cada seção.
        var simbolo: String {

            switch self {

            case .hoje:
                return "checkmark.circle"

            case .habitos:
                return "repeat"

            case .rotinas:
                return "calendar"

            } // FIM DO SWITCH DOS SÍMBOLOS

        } // FIM DA PROPRIEDADE simbolo

    } // FIM DA ENUM Secao

    // MARK: - FIM DAS SEÇÕES DO APLICATIVO


    // ============================================
    // INÍCIO DO BODY
    // ============================================

    var body: some View {

        // Divide a janela em barra lateral e conteúdo.
        NavigationSplitView {

            // ====================================
            // INÍCIO DA BARRA LATERAL
            // ====================================

            List(Secao.allCases, selection: $selecao) { secao in

                // Exibe o nome e o ícone da seção.
                Label(
                    secao.rawValue,
                    systemImage: secao.simbolo
                )
                .tag(secao)

            } // FIM DA LIST DA BARRA LATERAL

            .navigationTitle("Ritmo")
            .listStyle(.sidebar)

            // ====================================
            // FIM DA BARRA LATERAL
            // ====================================

        } detail: {

            // ====================================
            // INÍCIO DO CONTEÚDO PRINCIPAL
            // ====================================

            // Escolhe a tela com base na seleção.
            switch selecao {

            // INÍCIO DO CASO HOJE
            case .hoje:

                // MUDANÇA 1:
                // Usa a tela criada em HojeView.swift.
                HojeView()

            // FIM DO CASO HOJE


            // INÍCIO DO CASO HÁBITOS
            case .habitos:

                // Passa acesso de leitura e escrita
                // à lista de hábitos compartilhada.
                HabitosView(habitos: $habitos)

            // FIM DO CASO HÁBITOS


            // INÍCIO DO CASO ROTINAS
            case .rotinas:

                // MUDANÇA 2:
                // Usa a tela criada em RotinasView.swift.
                RotinasView()

            // FIM DO CASO ROTINAS


            // INÍCIO DO CASO SEM SELEÇÃO
            case nil:

                Text("Selecione uma seção")
                    .foregroundStyle(.secondary)

            // FIM DO CASO SEM SELEÇÃO

            } // FIM DO SWITCH

            // ====================================
            // FIM DO CONTEÚDO PRINCIPAL
            // ====================================

        } // FIM DO NAVIGATIONSPLITVIEW

        // Define um tamanho mínimo para a janela.
        .frame(minWidth: 650, minHeight: 400)

    } // FIM DO BODY

} // FIM DA STRUCT ContentView

// ================================================
// FIM DA CONTENTVIEW
// ================================================
