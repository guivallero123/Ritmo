import SwiftUI

struct LinhaHabitoView: View {
    //MARK: - INÍCIO DOS DADOS RECEBIDOS
    
    // Habito que será apresentado na linha.
    
    let habito: Habito
    
    //Ação executada quando a linha for clicada.
    
    let aoClicar: () -> Void
    
    // MARK: - FIM DOS DADOS RECEBIDOS
    
    
    // ================================================
    // INÍCIO DA INTERFACE
    // ================================================
    
    
    var body: some View {
        
        Button {
            
            //Executa a ação ao recebida da tela principal
            
            aoClicar()
            
        } label: {
            
            HStack(spacing:10) {
                
                //MARK: - INÍCIO DO INCONE
                
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
                
                //MARK: - FIM DO ÍCONE
                
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
            
            //Torna toda a linha clicavel
            .contentShape(Rectangle())
            
        } //FIM DO BUTTON
        
        //Mantém a aparência simples e nativa
        .buttonStyle(.plain)
        
    } //FIM DO BODY
    
    
    
    // ================================================
    // FIM DA INTERFACE
    // ================================================
    

} //FIM DA STRUCT LinhaHabitoView


//MARK: - INÍCIO DA PRÉVIA

#Preview {
    
    // A prévia mostra uma linha de exemplo
    // A ação está vazia porque não precisamos
    
    LinhaHabitoView(
        habito: Habito(nome: "Ler 20 minutos"),
        aoClicar: {}
    )
    
    .padding()
    
} // FIM DA PRÉVIA
