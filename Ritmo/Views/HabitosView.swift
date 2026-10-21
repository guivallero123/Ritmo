
import SwiftUI
import SwiftData

// ================================================
// INÍCIO DA HABITOSVIEW
// Permite cadastrar e concluir hábitos.
// ================================================

struct HabitosView: View {

    // MARK: - INÍCIO DOS DADOS

    // Contexto responsável por gerenciar os hábitos.
    @Environment(\.modelContext)
    private var modelContext

    // Lista de hábitos consultada pela ContentView.
    let habitos: [Habito]

    // Texto digitado pelo usuário.
    @State private var novoHabito = ""
    
    //MARK: - INÍCIO DOS ESTADOS DE ECXLUSÃO
    
    //Guarda qual hábito o usuário deseja excluir
    
    @State private var habitoParaExcluir: Habito?
    
    //Controla se a confirmação deve aparecer
    @State private var mostrarConfirmacaoExclusao = false
    
    //MARK: - INÍCIO DOS ESTADOS DE EDIÇÃO
    //Guarda o hábito que será renomeado.
    @State private var habitoParaEditar: Habito?
    
    //Guarda temporariamente o novo nome digitado.
    @State private var nomeEditado = ""
    
    //Controla a apresentação do formulário de edição.
    @State private var mostrarEdicao = false
    
    //MARK: -  FIM DOS ESTADOS DE EDIÇÃO
    
    
    // MARK: -  FIM DOS ESTADOS DE EXCLUSÃO
    
    

    // MARK: - FIM DOS DADOS


    // ================================================
    // INÍCIO DA INTERFACE
    // ================================================

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            // MARK: - INÍCIO DO TÍTULO

            Text("Meus hábitos")
                .font(.largeTitle)
                .fontWeight(.bold)

            // MARK: - FIM DO TÍTULO


            // MARK: - INÍCIO DO FORMULÁRIO

            HStack {

                TextField(
                    "Nome do novo hábito",
                    text: $novoHabito
                )

                Button("Adicionar") {

                    adicionarHabito()

                }
                .disabled(
                    novoHabito.trimmingCharacters(
                        in: .whitespacesAndNewlines
                    ).isEmpty
                )

            } // FIM DO HSTACK

            // MARK: - FIM DO FORMULÁRIO


            // MARK: - INÍCIO DA LISTA

            List(habitos) { habito in

                Button {

                    alternarConclusao(do: habito)

                } label: {

                    Label(
                        habito.nome,
                        systemImage: habito.concluido
                            ? "checkmark.circle.fill"
                            : "circle"
                    )
                    .foregroundStyle(
                        habito.concluido
                            ? .secondary
                            : .primary
                    )

                } // FIM DO LABEL DO BUTTON

                .buttonStyle(.plain)
                
                
                // MARK: - INÍCIO DO MENU DE CONTEXTO

                .contextMenu {
                    
                //MARK: - INÍCIO DA AÇÃO RENOMEAR
                    
                    Button(
                        "Renomear hábito",
                        systemImage: "pencil"
                    ) {
                       //Guarda o habito selecionado
                        habitoParaEditar = habito
                        
                        //Preenche o campo com o nome atual
                        nomeEditado = habito.nome
                        
                        //Solicita a abertura do formulário
                        mostrarEdicao = true
                        
                        
                    } //FIM DO BUTTON RENOMEAR
                    
                    //MARK: - FIM DA AÇÃO RENOMEAR
                
                    Divider()

                    Button(
                        "Excluir hábito",
                        systemImage: "trash",
                        role: .destructive
                    ) {

                        // Guarda o hábito clicado.
                        habitoParaExcluir = habito

                        // Solicita a confirmação.
                        mostrarConfirmacaoExclusao = true

                    } // FIM DO BUTTON DE EXCLUSÃO

                } // FIM DO CONTEXTMENU

                // MARK: - FIM DO MENU DE CONTEXTO


            } // FIM DA LISTA

            // MARK: - FIM DA LISTA

        } // FIM DO VSTACK

        .padding()
        
        
        // MARK: - INÍCIO DA CONFIRMAÇÃO DE EXCLUSÃO

        .confirmationDialog(
            "Excluir hábito?",
            isPresented: $mostrarConfirmacaoExclusao,
            titleVisibility: .visible
        ) {

            // Ação confirmada pelo usuário.
            Button(
                "Excluir hábito",
                role: .destructive
            ) {

                excluirHabito()

            } // FIM DO BUTTON DE CONFIRMAÇÃO

            // Permite desistir da exclusão.
            Button("Cancelar", role: .cancel) {

                habitoParaExcluir = nil

            } // FIM DO BUTTON CANCELAR

        } message: {

            Text(
                "Este hábito será removido permanentemente."
            )

        } // FIM DO CONFIRMATIONDIALOG

        // MARK: - FIM DA CONFIRMAÇÃO DE EXCLUSÃO
        
        
        //MARK: - INICIO DO FORMULARIO DE EDIÇÃO
        
        .alert(
            "Renomear hábito",
            isPresented: $mostrarEdicao
        ){
            //Campo com o nome atual do hábito
            TextField(
                "Nome do hábito",
                text: $nomeEditado
            )
            
            //Desiste da edição
            Button("Cancelar", role: .cancel) {
                
                habitoParaEditar = nil
                nomeEditado = ""
                
            }
            
            //Confirma a alteração.
            Button("Salvar") {
                
                renomearHabito()
                
            }
            
            .disabled(
                nomeEditado.trimmingCharacters(
                    in: .whitespacesAndNewlines
                ).isEmpty
            )
            
        } message: {
            
            Text("Digite o novo nome do hábito.")
            
        } //FIM DO ALERT
        
        //MARK: - FIM DO FORMULÁRIO DE EDIÇÃO

        

    } // FIM DO BODY

    // ================================================
    // FIM DA INTERFACE
    // ================================================


    // MARK: - INÍCIO DAS FUNÇÕES

    // Cadastra um novo hábito no SwiftData.
    private func adicionarHabito() {

        let nome = novoHabito.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        guard !nome.isEmpty else {
            return
        }

        // Cria o objeto persistente.
        let habito = Habito(nome: nome)

        // Insere o hábito no contexto SwiftData.
        modelContext.insert(habito)

        // Limpa o campo de texto.
        novoHabito = ""

    } // FIM DA FUNÇÃO adicionarHabito


    // Marca ou desmarca um hábito.
    private func alternarConclusao(do habito: Habito) {

        // O objeto é uma classe gerenciada pelo SwiftData.
        // Não precisamos procurar seu índice no array.
        habito.concluido.toggle()

    } // FIM DA FUNÇÃO alternarConclusao
    
    
    // MARK: - INÍCIO DA FUNÇÃO DE EXCLUSÃO

    // Remove um hábito do armazenamento SwiftData.
    private func excluirHabito() {

        // Confere se existe um hábito selecionado.
        guard let habito = habitoParaExcluir else {
            return
        }

        // Solicita a exclusão ao SwiftData.
        modelContext.delete(habito)

        // Limpa a referência ao hábito excluído.
        habitoParaExcluir = nil

    } // FIM DA FUNÇÃO excluirHabito
    
    
    
    //MARK: - INÍCIO DA FUNÇÃO DE EDIÇÃO
    //Atualiza o nome de um habito no SwiftData
    private func renomearHabito() {
        
        //Verificar se existe um habito selecionado.
        
        guard let habito = habitoParaEditar else {
            return
        }
        
        // Remove espaços desnecessários.
        let novoNome = nomeEditado.trimmingCharacters(
            in: .whitespacesAndNewlines
        )
        
        //Impede que o habito fique sem nome.
        guard !novoNome.isEmpty else {
            return
        }
        
        //Atualiza diretamente o objeto persistente
        habito.nome = novoNome
        
        //Limpa os estados temporarios da edição.
        habitoParaEditar = nil
        nomeEditado = ""
        
    } //FIM DA FUNÇÃO renomearHabito
    
    //MARK: - FIM DA FUNÇÃO DE EDIÇÃO
    
    
    
    
    
    

    // MARK: - FIM DA FUNÇÃO DE EXCLUSÃO


    // MARK: - FIM DAS FUNÇÕES

} // FIM DA STRUCT HABITOSVIEW

// ================================================
// FIM DA HABITOSVIEW
// ================================================
