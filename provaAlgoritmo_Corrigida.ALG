Algoritmo "ArthurCosta_ViniciusCassemira"
//feito por Arthur Costa e Vinícius Cassemira
//essa foi a versão realizada no dia da prova

//criação dos registros paciente/fila
tipo
   Rpaciente = registro
      nome : caractere
      idade : inteiro
      queixa: caractere
      codPreferencia : inteiro
   fimregistro

   Rfila = registro
      nomePaciente : caractere
      idadePaciente :inteiro
      queixaPaciente : caractere
      codPreferencia : inteiro
   fimregistro

   //usado para inserir um novo paciente na fila de atendimento
procedimento adicionarPaciente()
var
   tempNome,tempQueixa : caractere
   tempIdade,tempCodPreferencia : inteiro
inicio
   limpatela()
   se (qntPaciente < 20)entao
      qntPaciente <- qntPaciente + 1
      escreval("Preencha as informações do paciente")
      escreval("===================================")
      escreva("Nome: ")
      leia(paciente[qntPaciente].nome)
      escreva("Idade:")
      leia(paciente[qntPaciente].idade)
      escreva("Queixa:")
      leia(paciente[qntPaciente].queixa)
      repita
         escreval("Preferência")
         escreval("3. grave")
         escreval("2. media")
         escreval("1. leve")
         leia(paciente[qntPaciente].codPreferencia)
      ate(paciente[qntPaciente].codPreferencia > 0)e (paciente[qntPaciente].codPreferencia < 4)

      tamFila <- tamFila + 1
      fila[tamFila].nomePaciente <- paciente[qntPaciente].nome
      fila[tamFila].idadePaciente <- paciente[qntPaciente].idade
      fila[tamFila].queixaPaciente <-paciente[qntPaciente].queixa
      fila[tamFila].codPreferencia <- paciente[qntPaciente].codPreferencia

      //organizando fila, nao conseguimos incluir em um procedimento, bugou
      //priorização por ordem de gravidade e por idade, respectivamente
      se(tamFila > 1)entao

         se (fila[tamFila].codPreferencia = 3)entao
            para i de 1 ate 10 faca
               para j de 2 ate 10 faca
                  se (fila[j].codPreferencia = 3)e(fila[j-1].codPreferencia < 3)entao
                     tempNome <- fila[j-1].nomePaciente
                     tempIdade <- fila[j-1].idadePaciente
                     tempQueixa <- fila[j-1].queixaPaciente
                     tempcodPreferencia <- fila[j-1].codPreferencia

                     fila[j-1] <- fila[j]
                     fila[j].nomePaciente <- tempNome
                     fila[j].idadePaciente <- tempIdade
                     fila[j].queixaPaciente <- tempQueixa
                     fila[j].codPreferencia <- tempcodPreferencia
                  fimse

                  se (fila[j].codPreferencia = 3)e(fila[j-1].codPreferencia = 3)e(fila[j].idadePaciente > fila[j-1].idadePaciente)entao
                     tempNome <- fila[j-1].nomePaciente
                     tempIdade <- fila[j-1].idadePaciente
                     tempQueixa <- fila[j-1].queixaPaciente
                     tempcodPreferencia <- fila[j-1].codPreferencia

                     fila[j-1] <- fila[j]
                     fila[j].nomePaciente <- tempNome
                     fila[j].idadePaciente <- tempIdade
                     fila[j].queixaPaciente <- tempQueixa
                     fila[j].codPreferencia <- tempcodPreferencia
                  fimse
               fimpara
            fimpara
         fimse

         se (fila[tamFila].codPreferencia = 2)entao
            para i de 1 ate 10 faca
               para j de 2 ate 10 faca
                  se (fila[j].codPreferencia = 2)e(fila[j-1].codPreferencia < 2)entao
                     tempNome <- fila[j-1].nomePaciente
                     tempIdade <- fila[j-1].idadePaciente
                     tempQueixa <- fila[j-1].queixaPaciente
                     tempcodPreferencia <- fila[j-1].codPreferencia

                     fila[j-1] <- fila[j]
                     fila[j].nomePaciente <- tempNome
                     fila[j].idadePaciente <- tempIdade
                     fila[j].queixaPaciente <- tempQueixa
                     fila[j].codPreferencia <- tempcodPreferencia
                  fimse

                  se (fila[j].codPreferencia = 2)e(fila[j-1].codPreferencia = 2)e(fila[j].idadePaciente > fila[j-1].idadePaciente)entao
                     tempNome <- fila[j-1].nomePaciente
                     tempIdade <- fila[j-1].idadePaciente
                     tempQueixa <- fila[j-1].queixaPaciente
                     tempcodPreferencia <- fila[j-1].codPreferencia

                     fila[j-1] <- fila[j]
                     fila[j].nomePaciente <- tempNome
                     fila[j].idadePaciente <- tempIdade
                     fila[j].queixaPaciente <- tempQueixa
                     fila[j].codPreferencia <- tempcodPreferencia
                  fimse
               fimpara
            fimpara
         fimse

         se (fila[tamFila].codPreferencia = 1)entao
            para i de 1 ate 10 faca
               para j de 2 ate 10 faca
                  se (fila[j].codPreferencia = 1)e(fila[j-1].codPreferencia = 1)e(fila[j].idadePaciente > fila[j-1].idadePaciente)entao
                     tempNome <- fila[j-1].nomePaciente
                     tempIdade <- fila[j-1].idadePaciente
                     tempQueixa <- fila[j-1].queixaPaciente
                     tempcodPreferencia <- fila[j-1].codPreferencia

                     fila[j-1] <- fila[j]
                     fila[j].nomePaciente <- tempNome
                     fila[j].idadePaciente <- tempIdade
                     fila[j].queixaPaciente <- tempQueixa
                     fila[j].codPreferencia <- tempcodPreferencia
                  fimse
               fimpara
            fimpara
         fimse
      senao
      fimse
      //mostra a fila de atendimento atualizada
      visualizarFila()
      escreval()
   senao
      //caso a lista de atendimento esteja cheia
      escreval("Número máximo de pacientes no sistema")
   fimse
fimprocedimento

//mostra a ordem da fila atual, é atualizada automaticamente
procedimento visualizarFila()
inicio
   limpatela()
   se (tamFila >= 1) entao
      escreval("      LISTA DE PACIENTES")
      escreval("===============================")
      escreval("Nome | Idade | Cód. Preferência")
      para i de 1 ate tamFila faca
         escreval(fila[i].nomePaciente," ",fila[i].idadePaciente," ",fila[i].codPreferencia)
      fimpara
   senao
      escreval("A fila de atendimento está vazia")
   fimse
   escreval()
fimprocedimento

//irá chamar o próximo paciente da fila para ser 'atendido'
//o paciente chamado será removido da fila
procedimento chamarPaciente()
var
k : caractere
inicio
   limpatela()
   se(tamFila >= 1)entao
      limpatela()
      escreval("Vamos chamar o próximo paciente")
      escreval("Nome: ",fila[1].nomePaciente," | Idade:",fila[1].idadePaciente)
      escreval("Queixa: ",fila[1].queixaPaciente," | Preferência: ",fila[1].codPreferencia)
      //Adicionado para poder ver a mansagem antes da tela ser limpa
      escreval("")
      escreva("Digite enter para continuar...")
      leia(k)


      fila[1].nomePaciente <- ""
      fila[1].idadePaciente <- 0
      fila[1].queixaPaciente <- ""
      fila[1].codPreferencia <- 0

      tamFila <- tamFila - 1

      para i de 1 ate 10 faca
         para j de 2 ate 10 faca
            se(fila[j].idadePaciente >= 1)e(fila[j-1].nomePaciente = "")entao
               fila[j-1] <- fila[j]
               fila[j].nomePaciente <- ""
               fila[j].idadePaciente <- 0
               fila[j].queixaPaciente <- ""
               fila[j].codPreferencia <- 0
            senao
            fimse
         fimpara
      fimpara
      visualizarFila()
   senao
      escreval("Sem pacientes na fila")
   fimse
   escreval()
fimprocedimento


Var  //variáveis globais
   paciente : vetor[1..10] de Rpaciente
   fila : vetor[1..10] de Rfila
   i,j: inteiro
   opcaoMenu, qntPaciente, tamFila : inteiro
   //armazena a quantidade de paciente no estado grave e no médio
   qntG,qntM : inteiro
   
Inicio //início do algoritmo
   repita
      escreval("     HOSPITAL SÃO JOAO")
      escreval("=============================")
      escreval("1. Adicionar paciente na fila")
      escreval("2. Visualizar fila de espera")
      escreval("3. Chamar próximo paciente")
      escreval("99. Sair da aplicação")
      escreva("Digite sua opção: ")
      leia(opcaoMenu)

      escolha opcaoMenu
      caso 1
         adicionarPaciente()
      caso 2
         visualizarFila()
      caso 3
         chamarPaciente()
      caso 99
         escreval("Fechando Programa")
      outrocaso
         limpatela()
      fimescolha
   ate (opcaoMenu = 99)
Fimalgoritmo