programa
{
	inclua biblioteca Texto
	inclua biblioteca Util 
     cadeia  nome_pkmn[3], nomeseu_pkmn, inimigo
     real    vida_pkmn[3], vida_seu_pkmn, vida_inimigo
     real    ataq_pkmn[3], ataq_seu_pkmn, ataq_inimigo
     inteiro seupkmn
     inteiro genero = -1
     cadeia  nome_personagem
	inteiro quantidade_carac
	inteiro escolha_
	cadeia poder_p[4][2]
	inteiro media = 10 
	
	funcao inicio() //Aqui é a parte "principal" do jogo, cada função será utilizada.
	{
		regepokemon()
		genero_personagem()
		definanome()
	     escreva("\nQue pokemon voce deseja?\n")      
	     leia(seupkmn)
	     regeseu()

	     BatalhaPokemon(1)
	}
	
	
	


     funcao regeseu()//Aqui vai regir seu pokémon, com base nos atributos da outra função la
     {
           nomeseu_pkmn=nome_pkmn[seupkmn]
           vida_seu_pkmn=vida_pkmn[seupkmn]
           ataq_seu_pkmn=ataq_pkmn[seupkmn]
     }

     funcao regeenemy(inteiro quale)//mesmo que de cima, só que pro seu inimigo nas batalhas.
     {
           inimigo=nome_pkmn[quale]
           vida_inimigo=vida_pkmn[quale]
           ataq_inimigo=ataq_pkmn[quale]
     }

     funcao genero_personagem()//Essa função vai definir o genero do personagem.
	{

		
		 enquanto(genero != 2 e genero !=1)
		 {
			escrevaLento("Você é uma garota ou um garoto?\n", media)
			escreva("(1) - Garota\n(2) - Garoto\n")
			leia(genero)

			se(genero != 2 e genero !=1)
		     {
				escrevaLento("Essa opção não existe.\n", media)
		     }
		
	     	escolha(genero)
	     	{

			   caso 1: 
			   
			   escrevaLento("Certo. Você é uma garota então.\n", media)
			   pare
			   caso 2:
			   
			   escrevaLento("Certo. Você é um garoto então.\n", media)
			   pare
			   caso contrario:
			   pare
			 }
		 }
     }

     funcao definanome()//Essa função define o nome do personagem.
     {
     	
     	escrevaLento("Agora me diga seu nome.\n", media)
     	leia(nome_personagem)
     	escrevaLento("Entendo. Olá, " + nome_personagem + "!", media)
     }

     

     funcao regepokemon() //Aqui é definido os atributos de cada pokemon.
	{
			        nome_pkmn[1] = "Bulbassaur"
			        vida_pkmn[1] = 20.0
			        ataq_pkmn[1] = 5.0
			        poder_p[0][1] = "Tackle"
			        poder_p[1][1] = "Growl"
			        poder_p[2][1] = "Leech Seed"
			        poder_p[3][1] = "Vine Whip"
			        
			        
		
			        nome_pkmn[2] = "Squirtle"
			        vida_pkmn[2] = 15.0
			        ataq_pkmn[2] = 7.5

			       
				
			      
	}

	funcao escrevaLento(cadeia palavra, inteiro velocidade)//funcao pra escreve devagarinho
	{

		caracter letra
	
		quantidade_carac = Texto.numero_caracteres(palavra)
		
		para(inteiro i = 0; i < quantidade_carac; i++)
		{
			letra = Texto.obter_caracter(palavra, i)
			escreva(letra) Util.aguarde(velocidade)
		}

	}
	funcao BatalhaPokemon(inteiro turno){//batalha

		turno = 1
		se(turno %2 == 0){
			regeenemy(2)
			escreva("\nNome do pokemon inimigo: ",inimigo)
			escreva("\nVida do pokemon inimigo: ",vida_inimigo, "\n")
			escreva("\nNome do seu pokemon: ", nomeseu_pkmn)
			escreva("\nVida do seu pokemon: ", vida_seu_pkmn)
		}
		se(turno %2 != 0){
			escreva("\nO que voce quer fazer?\n")
			escreva("1 - Atacar\n")
			escreva("2 - Trocar\n")
			escreva("3 - Itens\n")
			escreva("4 - Fugir\n")
			leia(escolha_)


		
			escolha(escolha_){
				caso 1:
				para(inteiro i = 0; i < 3; i++){
					
				
				escreva(poder_p[i][seupkmn])
				
				}
				
				
			}
		}
		
		
	}
     		
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3351; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {poder_p, 13, 8, 7};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */