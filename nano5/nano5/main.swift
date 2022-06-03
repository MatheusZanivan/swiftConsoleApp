// nano challenge 5 -Livro de receitas-

import Foundation

var desejaAdicionarIngrediente : Bool = false
//
////var teste = ["a","b","d","a","a","a","a","c","b"]
//var teste = [1,4,5,79,0]
//teste.sort()
//
//print(teste)


struct Receita {
    var nome: String
    var ingredientes: [(String, String)]
    var istrucoes: String
}

var models : [Receita] = [
    .init(nome: "Pao de mel", ingredientes: [("2 xicaras", "Farinha"), ("1 xicara","Mel"), ("1 Colher de chá","Cravo e Canela"), ("1 xicara","Açucar"), ("1/2 xicara","Chocolate em pó")], istrucoes: "Juntar o pao com o mel"),
    .init(nome: "Brigadeiro", ingredientes: [("1 lata", "Leite condensado"), ("1 colher","Manteiga"), ("1 colher","Chocolate em pó")], istrucoes: "Mexer tudo até ver o fundo da panela"),
    .init(nome: "Paçoca", ingredientes: [("100g", "Amendoim"), ("1 pitada ","Sal"), ("1 colher","Açucar")], istrucoes: "Juntar o pao com o mel"),
    
]

func simOuNao() -> Bool{
    print("Deseja adicionar um ingrediente?")
    print("------")
    print("[1]Sim")
    print("[2]Não")
    print("------")
    let resp = Int(readLine()!)!
    if(resp == 1){
       return true
    }
    else if(resp == 2){
        return false
    }
    else{
        print("Digite uma resposta válida")
        return simOuNao()
    }
    
}

func nome() -> String{
    print("Digite o nome da receita")
    let nome = String(readLine()!)
    return nome
}

func adicionaIngredientes() -> [(String, String)]{
    var lista = [(String, String)]()
    while(simOuNao() != false){
        print("Digite a quantidade:")
        let quantidade = (String(readLine()!))
        print("Digite o ingrediente:")
        let ingrediente = (String(readLine()!))
        lista.append((quantidade , ingrediente))
    }
    return lista
}

func instrucoes() -> String{
    print("Digite as instruções:")
    let instrucoes = String(readLine()!)
    return instrucoes
}

func verReceitas(){
    for receita in models{
        print("----------------------------------")
        print(receita.nome)
        print("Ingredientes:")
        for ingredientes in receita.ingredientes{
            print("\(ingredientes.0) de \(ingredientes.1) ")
        }
        print("Instruções: \(receita.istrucoes)")
        
        print("----------------------------------")
        print("\n")
    }
    menu()
}

func menu(){
    print("[1] - Adicionar nova receita")
    print("[2] - Ver lista de receitas")
    
    let resp : Int = Int(readLine()!)!
    if(resp == 1){
        adicionarNovaReceita()
    }
    else if(resp == 2){
        verReceitas()
    }
    else{
        print("Digite uma resposta válida")
        menu()
    }
    
}
func adicionarNovaReceita(){
    models.append(.init(nome: nome(), ingredientes: (adicionaIngredientes()), istrucoes: instrucoes()))
    menu()
}

menu()
