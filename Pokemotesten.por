programa
{
	inclua biblioteca Matematica
	inclua biblioteca Texto
	inclua biblioteca Util 
     cadeia  nome_pkmn[3], nomeseu_pkmn, inimigo
     real    vida_pkmn[3], vida_seu_pkmn, vida_inimigo
     real    ataq_pkmn[3], ataq_seu_pkmn, ataq_inimigo
     real    defesa_pkmn[3], defesa_seu_pkmn, defesa_inimigo 
     real    basepower[4][9], dano = 0.0
     inteiro seupkmn, inipkmn
     inteiro genero = -1
     cadeia  nome_personagem
	inteiro quantidade_carac
	inteiro escolha_
	cadeia  poder_p[8][3]
	inteiro media = 10 
	logico acabou 
	
	funcao inicio() //Aqui é a parte "principal" do jogo, cada função será utilizada.
	{
		regepokemon()
		regeenemy(2)
		genero_personagem()
		definanome()
	     escreva("\nQue pokemon voce deseja?\n")      
	     leia(seupkmn)
	     limpa()
	     regeseu()
          acabou = falso
	     BatalhaPokemon(1)
	     regepokemon()
	     escrevaLento("hhhhhhhhhhhhhhhhhhhhhhh", media)
	}
	
	
	


     funcao regeseu()//Aqui vai regir seu pokémon, com base nos atributos da outra função la
     {
           nomeseu_pkmn=nome_pkmn[seupkmn]
           vida_seu_pkmn=vida_pkmn[seupkmn]
           ataq_seu_pkmn=ataq_pkmn[seupkmn]
           defesa_seu_pkmn=defesa_pkmn[seupkmn]
     }

     funcao regeenemy(inteiro quale)//mesmo que de cima, só que pro seu inimigo nas batalhas.
     {
     	 inipkmn = quale
           inimigo=nome_pkmn[quale]
           vida_inimigo=vida_pkmn[quale]
           ataq_inimigo=ataq_pkmn[quale]
           defesa_inimigo=defesa_pkmn[quale]
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
			        vida_pkmn[1] = 45.0
			        ataq_pkmn[1] = 49.0
			        defesa_pkmn[1] = 49.0
			        poder_p[0][1] = "Tackle"
			        basepower[0][1] = 40.0
			        poder_p[1][1] = "Growl"
			        poder_p[2][1] = "Leech Seed"
			        poder_p[3][1] = "Vine Whip"
			        
			        
		
			        nome_pkmn[2] = "Squirtle"
			        vida_pkmn[2] = 44.0
			        ataq_pkmn[2] = 48.0
			        defesa_pkmn[2] = 65.0
			        poder_p[0][2] = "Tackle"
			        basepower[0][2] = 40.0
			        poder_p[1][2] = "Bubble"
			        basepower[1][2] = 30.0
			        poder_p[2][2] = "Water Gun"
			        basepower[2][2] = 20.0
			        poder_p[3][2] = "Hydro Pump"
                       basepower[3][2] = 25.0
			       
				
			      
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
	funcao BatalhaPokemon(inteiro turno)
	{//batalha
		turno =Util.sorteia(0, 1)
          enquanto(acabou == falso)
          {
          	
          
		
		se(turno %2 == 0)
		{
			regeenemy(2)
			escrevaLento("...", 1000)
			inteiro qual = Util.sorteia(0, 3)
			regedanoinimigo(basepower[qual][inipkmn])
			vida_seu_pkmn = vida_seu_pkmn - dano
			escrevaLento("Inimigo usou: " + poder_p[qual][inipkmn] + ".\nCom o dano de:" + Matematica.arredondar(dano, 0), media)
			Util.aguarde(2000)limpa()
			se(vida_seu_pkmn <= 0){
					escrevaLento("\nVoce perdeu.", media)
				acabou = verdadeiro
			}senao{
				escrevaLento("A vida do inimigo atual: " + vida_inimigo, 100)
				turno++
			}
		}
		se(turno %2 != 0)
		{
			escreva("\nO que voce quer fazer?\n")
			escreva("1 - Atacar\n")
			escreva("2 - Trocar\n")
			escreva("3 - Itens\n")
			escreva("4 - Fugir\n")
			leia(escolha_)


		
			escolha(escolha_)
			{
				caso 1:
				escreva("                Ataques        \n\n")
				para(inteiro i = 0; i < 4; i++){
					
				
				escreva(i, " - ", poder_p[i][seupkmn],"   ")
				
				
		     } 
		     escreva("\n                 Qual ataque?\n")
		     leia(escolha_)
		
				
			regedano(basepower[escolha_][seupkmn])
			vida_inimigo = vida_inimigo - dano
			escrevaLento(nome_personagem + " usou: " + poder_p[escolha_][inipkmn] + ".\nCom o dano de:" + Matematica.arredondar(dano, 0), media)
			Util.aguarde(2000)limpa()
			se(vida_inimigo <= 0){
				escrevaLento("\nVoce ganhou.", media)
				acabou = verdadeiro
			}senao{
				escrevaLento("Voce deu de dano: " + Matematica.arredondar(dano, 0), 100)
				turno++
			}
				
			
			}
		}//TURNO
		
		
	     }//BATALHA

	}//FUNCAO
	funcao regedano(real quale)
	{
		dano = (ataq_seu_pkmn / defesa_inimigo) * quale
	}
	funcao regedanoinimigo(real quale)
	{
		dano = (ataq_inimigo / defesa_seu_pkmn) * quale
	}
     		
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 5183; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */