import SwiftUI

// ================================================
// INÍCIO DA HABITOSVIEW
// Responsável pela interface da página Hábitos.
// ================================================

  struct HabitosView: View {
    
    // Recebe acesso à lista de hábitos da ContentView.
    // @Binding permite ler e modificar essa lista.
    
    @Binding var habitos: [Habito]
    
    // Guarda o texto digitado nesta página.
    // Este estado pertence somente à HabitosView.
    
    @State private var novoHabito = ""
    
      // ============================================
      // INÍCIO DO BODY
      // ============================================

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
      //Título da página
            
    Text("Meus hábitos")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            
      //ÍNICIO DO FORMULÁRIO DE CADASTRO
            
            HStack {
                TextField(
                    "Nome do novo hábito",
                    text: $novoHabito
                )
                
                Button("Adicionar"){
                    adicionarHabito()
                }
                .disabled(
                    novoHabito.trimmingCharacters(
                        in: .whitespacesAndNewlines
                ).isEmpty
            )} //FIM DO HSTACK DE CADASTRO
              //INICIO DA LISTA DE HÁBITOS
            
            List(habitos) { habito in
            
                Button{
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
                }  //FIM DO CONTEUDO DO BUTTON
                
                .buttonStyle(.plain)
                
            } // FIM DA LISTA DE HABITOS
        } //FIM DO VSTACK
        
        .padding()
    } //FIM DO BODY
    
    
        // ============================================
        // INÍCIO DAS FUNÇÕES
        // ============================================

        // Adiciona um novo hábito à lista recebida.
    
    private func adicionarHabito(){
        let nome = novoHabito.trimmingCharacters(
            in: .whitespacesAndNewlines
        )
        
        guard !nome.isEmpty else{
            return
        }
        
        let habito = Habito(nome:nome)
        
        habitos.append(habito)
        novoHabito = ""
    } // FIM DA FUNÇÃO adicionarHabito
    
    
    // Marca ou desmarca um habito existente
    
    private func alternarConclusao(do habito : Habito) {
        guard let indice = habitos.firstIndex(where: {
            $0.id == habito.id
        }) else {
            return
        }
        
        habitos[indice].concluido.toggle()
    } //FIM DA FUNÇÃO alternarConclusão
    
} //FIM DA ESTRUTURA HABITOSVIEW
