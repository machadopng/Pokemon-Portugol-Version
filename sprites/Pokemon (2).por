programa
{
	inclua biblioteca Matematica
	inclua biblioteca Texto
	inclua biblioteca Util
	inclua biblioteca Arquivos --> arq
	inteiro Menu // variavel que define qual menu a funcao interface vai mostrar
	logico  seupkmn_vivos[6]  // variavel logica que define quais dos SEUS pokemons estao vivos
	logico  inimigos_vivos[6] // variavel logica que define quais pokemons INIMIGOS estao vivos
	inteiro seupkmn_vivosN=0  // variavel que mostra a AQUANTIDADE dos SEUS pokemons que estao vivos
	inteiro inimigos_vivosN=0  // variavel que mostra a AQUANTIDADE de pokemons vivos do INIMIGO
     cadeia  nome_pkmn[151], nomeseu_pkmn[6], nome_inimigos[6]
     real    vida_pkmn[151], vida_seu_pkmn[6], vida_inimigo[6]
     real    ataq_pkmn[151], ataq_seu_pkmn[6], ataq_inimigo[6]
     real    defesa_pkmn[151], defesa_seu_pkmn[6], defesa_inimigo[6]
     inteiro tipo_pkmn[161], tipo_seu_pkmn[6], tipo_inimigo[6]
     real    basepower[4][151], dano = 0.0
     inteiro item[2][9] = 
     {
     	{1,2,3,4,5,6,7,8,9},{50,100,500,9999,55,100,350,500,750}
     	
     }
     cadeia nome_item[9] = {"Poké Ball","Great ball","Ultra ball","Master ball","Poção","Super poção","Hyper poção","Poção Máxima","Reviver"}
     inteiro inventario_item[9] = {0,0,1,0,0,0,1,0,1}
     inteiro escolhaitem
     inteiro Escolha
     inteiro dinheiro = 1000
     inteiro efeito_item[9] = {25,50,75,100,15,30,35,0,0}
     inteiro curacurada = 0
     inteiro genero = -1
     cadeia  start
     inteiro seupkmn[6]   
     inteiro pkmninimigo[6] = {1,1,0,0,0,0}
     inteiro inventarioInimigoP = 0
     inteiro inventarioP = 0 // Variavel que mostra posicao atual do inventario, de 0 a 5
     cadeia inventario[6]// inventario da batalha
     inteiro seupkmn_atual = seupkmn[0]
     inteiro escolha_pokemon = 0
     inteiro pokemoncapturado // pokemon que vc capturou
     cadeia  nome_personagem = "nulo", rival = "nulo"
	inteiro quantidade_carac
	inteiro escolha_, escolha_1
	cadeia  poder_p[4][151]
	inteiro media = 3
	logico  acabou 
	real    multiplicador
	inteiro tipo_ataq[4][151] 
	inteiro qual = Util.sorteia(0, 3)                   
	real    tabela_fraquezas[18][18] = {
	   //nor0 lut1 voa2 ven3 ter4 ped5 ins6 fan7 aço8 fog9 agu0 pla1 ele2 psi3 gel4 dra5 som6 fad7
	    {1.0, 1.0, 1.0, 1.0, 1.0, 0.5, 1.0, 0.0, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0},
	    {2.0, 1.0, 0.5, 0.5, 1.0, 2.0, 0.5, 0.0, 2.0, 1.0, 1.0, 1.0, 1.0, 0.5, 2.0, 1.0, 2.0, 0.5},
	    {1.0, 2.0, 1.0, 1.0, 1.0, 0.5, 2.0, 1.0, 0.5, 1.0, 1.0, 2.0, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0},
	    {1.0, 1.0, 1.0, 0.5, 0.5, 0.5, 1.0, 0.5, 0.0, 1.0, 1.0, 2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0},
	    {1.0, 1.0, 0.0, 2.0, 1.0, 2.0, 0.5, 1.0, 2.0, 2.0, 1.0, 0.5, 2.0, 1.0, 1.0, 1.0, 1.0, 1.0},
	    {1.0, 0.5, 2.0, 1.0, 0.5, 1.0, 2.0, 1.0, 0.5, 2.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 1.0},
	    {1.0, 0.5, 0.5, 0.5, 1.0, 1.0, 1.0, 0.5, 0.5, 0.5, 1.0, 2.0, 1.0, 2.0, 1.0, 1.0, 2.0, 0.5},
	    {0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 0.5, 1.0},
	    {1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 0.5, 0.5, 0.5, 1.0, 0.5, 1.0, 2.0, 1.0, 1.0, 2.0},
	    {1.0, 1.0, 1.0, 1.0, 1.0, 0.5, 2.0, 1.0, 2.0, 0.5, 0.5, 2.0, 1.0, 1.0, 2.0, 0.5, 1.0, 1.0},
	    {1.0, 1.0, 1.0, 1.0, 2.0, 2.0, 1.0, 1.0, 1.0, 2.0, 0.5, 0.5, 1.0, 1.0, 1.0, 0.5, 1.0, 1.0},
	    {1.0, 1.0, 0.5, 0.5, 2.0, 2.0, 0.5, 1.0, 0.5, 0.5, 2.0, 0.5, 1.0, 1.0, 1.0, 0.5, 1.0, 1.0},
	    {1.0, 1.0, 2.0, 1.0, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 0.5, 0.5, 1.0, 1.0, 0.5, 1.0, 1.0},
	    {1.0, 2.0, 1.0, 2.0, 1.0, 1.0, 1.0, 1.0, 0.5, 1.0, 1.0, 1.0, 1.0, 0.5, 1.0, 1.0, 0.0, 1.0},
	    {1.0, 1.0, 2.0, 1.0, 2.0, 1.0, 1.0, 1.0, 0.5, 0.5, 0.5, 2.0, 1.0, 1.0, 0.5, 2.0, 1.0, 0.0},
	    {1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 0.0},
	    {1.0, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 0.5, 0.5},
	    {1.0, 2.0, 1.0, 0.5, 1.0, 1.0, 1.0, 1.0, 0.5, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 2.0, 1.0}
	    
	}
	
	funcao inicio() //Aqui é a parte "principal" do jogo, cada função será utilizada.
	{
		escreva("▗▄▄▖      ▗▄▖     ▗▖ ▗▖    ▗▄▄▄▖    ▗▖  ▗▖     ▗▄▖     ▗▖  ▗▖\n")
		escreva("▐▌ ▐▌    ▐▌ ▐▌    ▐▌▗▞▘    ▐▌       ▐▛▚▞▜▌    ▐▌ ▐▌    ▐▛▚▖▐▌\n")
		escreva("▐▛▀▘     ▐▌ ▐▌    ▐▛▚▖     ▐▛▀▀▘    ▐▌  ▐▌    ▐▌ ▐▌    ▐▌ ▝▜▌\n")
		escreva("▐▌       ▝▚▄▞▘    ▐▌ ▐▌    ▐▙▄▄▖    ▐▌  ▐▌    ▝▚▄▞▘    ▐▌  ▐▌\n")
		escreva("\n\n\n     ▗▄▄▖ ▗▄▄▖ ▗▄▄▄▖ ▗▄▄▖ ▗▄▄▖     ▗▄▄▖▗▄▄▄▖▗▄▖ ▗▄▄▖▗▄▄▄▖\n")
		escreva("     ▐▌ ▐▌▐▌ ▐▌▐▌   ▐▌   ▐▌       ▐▌     █ ▐▌ ▐▌▐▌ ▐▌ █  \n")
		escreva("     ▐▛▀▘ ▐▛▀▚▖▐▛▀▀▘ ▝▀▚▖ ▝▀▚▖     ▝▀▚▖  █ ▐▛▀▜▌▐▛▀▚▖ █  \n")
		escreva("     ▐▌   ▐▌ ▐▌▐▙▄▄▖▗▄▄▞▘▗▄▄▞▘    ▗▄▄▞▘  █ ▐▌ ▐▌▐▌ ▐▌ █  \n")
		leia(start)
		limpa()
          itemmais()
		regepokemon()
		regeataques()
		
		//introducaoprofessor()
	     limpa()
	    
	     
	     seupkmn[0]=3 seupkmn[1]=7 seupkmn[2]=9 seupkmn[3]=10 seupkmn[4]=11 seupkmn[5]=12
	     regeseu()
		regeataques()
          acabou = falso
          regeenemy(1)
          regepokemon()
	     //pospallet()
	     regepokemon()
	     //posprimeiroimpacto()
	     BatalhaPokemon()
	     

	     
	     //aqui vai te q ter uma funcao pra pokemon selvagem
	     

	}
	
	funcao capturapokemon()
	     {
	     inteiro pegapokemon1 = Util.sorteia(1, 18)
	     escreva("O pokemon que você pegou foi o ", nome_pkmn[pegapokemon1])
	     seupkmn[1] = pegapokemon1

	     inteiro pegapokemon2 = Util.sorteia(1, 18)
	     escreva("O pokemon que você pegou foi o ", nome_pkmn[pegapokemon2])
	     seupkmn[2] = pegapokemon2

	     inteiro pegapokemon3 = Util.sorteia(1, 18)
	     escreva("O pokemon que você pegou foi o ", nome_pkmn[pegapokemon3])
	     seupkmn[3] = pegapokemon3

	     inteiro pegapokemon4 = Util.sorteia(1, 18)
	     escreva("O pokemon que você pegou foi o ", nome_pkmn[pegapokemon4])
	     seupkmn[4] = pegapokemon4

	     inteiro pegapokemon5 = Util.sorteia(1, 18)
	     escreva("O pokemon que você pegou foi o ", nome_pkmn[pegapokemon5])
	     seupkmn[5] = pegapokemon5
	     	
	     }

     funcao cura(inteiro Escolha,inteiro Escolhapkmn){
     	se(inventario_item[Escolha] >= 1){
     		vida_seu_pkmn[Escolhapkmn] = vida_seu_pkmn[Escolhapkmn]+curacurada
     	}
     }
     
     funcao itemmais()
     {
     	inteiro escolhacompra
     	escreva("--------------LOJA DE ITENS--------------\n")
     	escreva("0 - Poké Ball [$50]                      \n")
     	escreva("1 - Great Ball [$100]                    \n")
     	escreva("2 - Ultra Ball [$500]                    \n")
     	escreva("3 - Master ball [$9999]                  \n")
     	escreva("4 - Poção [$50]                          \n")
     	escreva("5 - Super poção [$100]                   \n")
     	escreva("6 - Hyper poção [$350]                   \n")
     	escreva("7 - Poção Máxima [$500]                  \n")
     	escreva("8 - Reviver [$750]                       \n")
     	escreva("9 - Cancelar                             \n")
     	escreva("-----------------------------------------\n")
     	leia(escolhacompra)

               se(escolhacompra != 9){
               se(dinheiro>=item[1][escolhacompra]){	
          	dinheiro = item[1][escolhacompra]
          	inventario_item[escolhacompra]++
               }
               senao{
          	escreva("Você não tem dinheiro pra essa compra")
               }
               	
               }
               senao{
               	escreva("Você cancelou a compra")
               }
     	
     }
	
     funcao regeseu()//Aqui vai regir os seus 6 pokemon, status, nome, tipagem.
     {
           nomeseu_pkmn[0]    = nome_pkmn [seupkmn[0]]
           vida_seu_pkmn[0]   = vida_pkmn [seupkmn[0]]
           ataq_seu_pkmn[0]   = ataq_pkmn [seupkmn[0]]
           defesa_seu_pkmn[0] = defesa_pkmn [seupkmn[0]]
           tipo_seu_pkmn[0]   = tipo_pkmn [seupkmn[0]]

           nomeseu_pkmn[1]    = nome_pkmn [seupkmn[1]]
           vida_seu_pkmn[1]   = 3
           ataq_seu_pkmn[1]   = ataq_pkmn [seupkmn[1]]
           defesa_seu_pkmn[1] = defesa_pkmn [seupkmn[1]]
           tipo_seu_pkmn[1]   = tipo_pkmn [seupkmn[1]]

           nomeseu_pkmn[2]    = nome_pkmn [seupkmn[2]]
           vida_seu_pkmn[2]   = vida_pkmn [seupkmn[2]]
           ataq_seu_pkmn[2]   = ataq_pkmn [seupkmn[2]]
           defesa_seu_pkmn[2] = defesa_pkmn [seupkmn[2]]
           tipo_seu_pkmn[2]   = tipo_pkmn [seupkmn[2]]

           nomeseu_pkmn[3]    = nome_pkmn [seupkmn[3]]
           vida_seu_pkmn[3]   = vida_pkmn [seupkmn[3]]
           ataq_seu_pkmn[3]   = ataq_pkmn [seupkmn[3]]
           defesa_seu_pkmn[3] = defesa_pkmn [seupkmn[3]]
           tipo_seu_pkmn[3]   = tipo_pkmn [seupkmn[3]]

           nomeseu_pkmn[4]    = nome_pkmn [seupkmn[4]]
           vida_seu_pkmn[4]   = vida_pkmn [seupkmn[4]]
           ataq_seu_pkmn[4]   = ataq_pkmn [seupkmn[4]]
           defesa_seu_pkmn[4] = defesa_pkmn [seupkmn[4]]
           tipo_seu_pkmn[4]   = tipo_pkmn [seupkmn[4]]

           nomeseu_pkmn[5]    = nome_pkmn [seupkmn[5]]
           vida_seu_pkmn[5]   = vida_pkmn [seupkmn[5]]
           ataq_seu_pkmn[5]   = ataq_pkmn [seupkmn[5]]
           defesa_seu_pkmn[5] = defesa_pkmn [seupkmn[5]]
           tipo_seu_pkmn[5]   = tipo_pkmn [seupkmn[5]]

           inventario[0] = nomeseu_pkmn[0]
           inventario[1] = nomeseu_pkmn[1]
           inventario[2] = nomeseu_pkmn[2]
           inventario[3] = nomeseu_pkmn[3]
           inventario[4] = nomeseu_pkmn[4]
           inventario[5] = nomeseu_pkmn[5]
           
     }

     funcao regeenemy(inteiro quale)//Mesmo que de cima, só que pro seu inimigo nas batalhas.
     {
         para(inteiro i=0;i<5;i++){
          nome_inimigos [i] = nome_pkmn   [pkmninimigo[i]]
          vida_inimigo  [i] = vida_pkmn   [pkmninimigo[i]]
          ataq_inimigo  [i] = ataq_pkmn   [pkmninimigo[i]]
          defesa_inimigo[i] = defesa_pkmn [pkmninimigo[i]]
          tipo_inimigo  [i] = tipo_pkmn   [pkmninimigo[i]]
         }
     }  

     funcao regepokemon() //Aqui é definido os atributos de cada pokemon, como se fosse a "pokedex".
	{
// Pokémon 1 - Bulbasaur
nome_pkmn[1] = "Bulbassaur"
tipo_pkmn[1] = 11 // Planta/Veneno
vida_pkmn[1] = 45.0
ataq_pkmn[1] = 49.0
defesa_pkmn[1] = 49.0

// Pokémon 2 - Ivysaur
nome_pkmn[2] = "Ivysaur"
tipo_pkmn[2] = 11
vida_pkmn[2] = 60.0
ataq_pkmn[2] = 62.0
defesa_pkmn[2] = 63.0

// Pokémon 3 - Venusaur
nome_pkmn[3] = "Venusaur"
tipo_pkmn[3] = 11
vida_pkmn[3] = 80.0
ataq_pkmn[3] = 82.0
defesa_pkmn[3] = 83.0

// Pokémon 4 - Charmander
nome_pkmn[4] = "Charmander"
tipo_pkmn[4] = 9 // Fogo
vida_pkmn[4] = 39.0
ataq_pkmn[4] = 52.0
defesa_pkmn[4] = 43.0

// Pokémon 5 - Charmeleon
nome_pkmn[5] = "Charmeleon"
tipo_pkmn[5] = 9
vida_pkmn[5] = 58.0
ataq_pkmn[5] = 64.0
defesa_pkmn[5] = 58.0

// Pokémon 6 - Charizard
nome_pkmn[6] = "Charizard"
tipo_pkmn[6] = 9
vida_pkmn[6] = 78.0
ataq_pkmn[6] = 84.0
defesa_pkmn[6] = 78.0

// Pokémon 7 - Squirtle
nome_pkmn[7] = "Squirtle"
tipo_pkmn[7] = 10 // Água
vida_pkmn[7] = 44.0
ataq_pkmn[7] = 48.0
defesa_pkmn[7] = 65.0

// Pokémon 8 - Wartortle
nome_pkmn[8] = "Wartortle"
tipo_pkmn[8] = 10
vida_pkmn[8] = 59.0
ataq_pkmn[8] = 63.0
defesa_pkmn[8] = 80.0

// Pokémon 9 - Blastoise
nome_pkmn[9] = "Blastoise"
tipo_pkmn[9] = 10
vida_pkmn[9] = 79.0
ataq_pkmn[9] = 83.0
defesa_pkmn[9] = 100.0

// Pokémon 10 - Caterpie
nome_pkmn[10] = "Caterpie"
tipo_pkmn[10] = 6 // Inseto
vida_pkmn[10] = 45.0
ataq_pkmn[10] = 30.0
defesa_pkmn[10] = 35.0

// Pokémon 11 - Metapod
nome_pkmn[11] = "Metapod"
tipo_pkmn[11] = 7  // Inseto
vida_pkmn[11] = 50.0
ataq_pkmn[11] = 20.0
defesa_pkmn[11] = 55.0

// Pokémon 12 - Butterfree
nome_pkmn[12] = "Butterfree"
tipo_pkmn[12] = 7
vida_pkmn[12] = 60.0
ataq_pkmn[12] = 45.0
defesa_pkmn[12] = 50.0

// Pokémon 13 - Weedle
nome_pkmn[13] = "Weedle"
tipo_pkmn[13] = 7
vida_pkmn[13] = 40.0
ataq_pkmn[13] = 35.0
defesa_pkmn[13] = 30.0

// Pokémon 14 - Kakuna
nome_pkmn[14] = "Kakuna"
tipo_pkmn[14] = 7
vida_pkmn[14] = 45.0
ataq_pkmn[14] = 25.0
defesa_pkmn[14] = 50.0

// Pokémon 15 - Beedrill
nome_pkmn[15] = "Beedrill"
tipo_pkmn[15] = 7
vida_pkmn[15] = 65.0
ataq_pkmn[15] = 90.0
defesa_pkmn[15] = 40.0

// Pokémon 16 - Pidgey
nome_pkmn[16] = "Pidgey"
tipo_pkmn[16] = 1 // Voador (sugestão)
vida_pkmn[16] = 40.0
ataq_pkmn[16] = 45.0
defesa_pkmn[16] = 40.0

// Pokémon 17 - Pidgeotto
nome_pkmn[17] = "Pidgeotto"
tipo_pkmn[17] = 1
vida_pkmn[17] = 63.0
ataq_pkmn[17] = 60.0
defesa_pkmn[17] = 55.0

// Pokémon 18 - Pidgeot
nome_pkmn[18] = "Pidgeot"
tipo_pkmn[18] = 1
vida_pkmn[18] = 83.0			      
	}


	funcao escrevaLento(cadeia palavra, inteiro velocidade)//Função para escrever igual máquina de escrever.
	{

		caracter letra
	
		quantidade_carac = Texto.numero_caracteres(palavra)
		
		para(inteiro i = 0; i < quantidade_carac; i++)
		{
			letra = Texto.obter_caracter(palavra, i)
			escreva(letra) Util.aguarde(velocidade)
		}

	}
	funcao BatalhaPokemon()//Autoexplicativo, aqui é o coração do jogo, a batalha.
	{
		
		inteiro turno = Util.sorteia(0, 1)
		Menu=0
		pkmnVivos()
		se(seupkmn_vivosN>0){
          enquanto(acabou == falso)
          {
          pkmnVivos()
         	pkmnInimigosVivos()

          	
		se(turno %2 == 0)
		{//Turno inimigo.
		
			regedanoinimigo(basepower[qual][pkmninimigo[inventarioInimigoP]], tipo_seu_pkmn[inventarioP], tipo_ataq[qual][pkmninimigo[inventarioInimigoP]])   //Ataque inimigo.
			vida_seu_pkmn[inventarioP] = vida_seu_pkmn[inventarioP] - dano
			
			se(vida_seu_pkmn[inventarioP]<=0){
				
				Menu=2
				AttGraficos()
				Util.aguarde(2000)
				
				se(seupkmn_vivosN<=0){
					
					acabou = verdadeiro
					
				}senao{
					inteiro j
					
					se(inventarioP==0){
						 j=1
						
					}senao{
						
						j=0
						
					}
					para(inteiro i=0+j;i<=5;i++){
						
						se(seupkmn_vivos[i]==verdadeiro){
							
							inventarioP=i
							Menu=4
							AttGraficos()
							Util.aguarde(2000)
							
							pare
						}
					}
				}
				
			}
			senao
			{
				Menu=2
				AttGraficos()
				
				Util.aguarde(5000)
				turno++
			}
		}//Fim turno inimigo
		se(turno %2 != 0)
		{//Seu turno
			Menu=0
			AttGraficos()
			leia(escolha_)

			se(escolha_ != 1 e escolha_ !=2 e escolha_ != 3 e escolha_ != 4)
		     {
				escrevaLento("Essa opção não existe.\n", media)
		     }


		
			escolha(escolha_)
			{
			
				caso 1:
				Menu=1
				AttGraficos()
				
				leia(escolha_)
				regedano(basepower[escolha_][seupkmn_atual], tipo_inimigo[inventarioInimigoP] , tipo_ataq[escolha_][seupkmn_atual])  // Calculo seu dano
				vida_inimigo[inventarioInimigoP] = vida_inimigo[inventarioInimigoP] - dano											//
				pkmnInimigosVivos()
				
			
				se(vida_inimigo[inventarioInimigoP] <= 0)
				{
					
					se(inimigos_vivosN<=0){
						
						Menu=6
						AttGraficos()
						Util.aguarde(2000)
						
						Menu=7
						AttGraficos()
						acabou=verdadeiro
						
					}senao{
						
						para(inteiro i=0;i<5;i++){
							
							se(inimigos_vivos[i]==verdadeiro){

								Menu=6
								AttGraficos()
								Util.aguarde(2000)
								
								inventarioInimigoP=i
								Menu=5
								AttGraficos()
								Util.aguarde(2000)
								turno++
								pare
							}
						}
					}
				}
				senao
				{
					Menu=6
					AttGraficos()
					Util.aguarde(2000)
					turno++
				}
					pare
		    
		     
				
			   caso 2: escreva("Itens")
			   Menu=8
			   AttGraficos()
			   leia(escolhaitem)
			   para(inteiro i=4; i <= 7; i++){
			   	
			   	se(escolhaitem == i){
			   		
			   		Menu=3
			   		AttGraficos()
			   		leia(Escolha)
			   		
			   		curacurada = efeito_item[escolhaitem]
			   		cura(escolhaitem,Escolha)
			   		
                  		Menu=9
                  		AttGraficos()
                  		Util.aguarde(2000)
                  }
		        }			   
			   limpa()
			   
			   	
			   	
			           pare
			   caso 3:
			   		logico escolhacerta=falso
			   		limpa() 
			   		Menu=3
			          AttGraficos()
                         enquanto(escolhacerta==falso)
		               {
		               	leia(escolha_pokemon)
		               
			          se(escolha_pokemon == 0 ou escolha_pokemon ==1 ou escolha_pokemon == 2 ou escolha_pokemon == 3 ou escolha_pokemon == 4 ou escolha_pokemon == 5)
		               {
				     	se(nomeseu_pkmn[escolha_pokemon]!=""){
				     		
				     		se(seupkmn_vivos[escolha_pokemon]==verdadeiro){
				     			
				     			escolhacerta=verdadeiro
				     		}senao{
				     			escolhacerta=falso
		               			escrevaLento("escolha invalida",media)
		               			
				     		}
				     	}senao{
				     		escolhacerta=falso
		               		escrevaLento("escolha invalida",media)
		               		
				     	}
		               }senao{
		               	escolhacerta=falso
		               	escrevaLento("escolha invalida",media)
		               	
		               }
		               
		               }
		               inventarioP=escolha_pokemon
		               Menu=4
		               AttGraficos()
		               Util.aguarde(3000)
		               turno++
			           
			   		pare
			   		 
			   caso 4: escrevaLento("Voce fugiu da batalha...", media)
			   		 acabou = verdadeiro
			   		 pare
			}
		}
		
		
	     }
		}senao{
			escrevaLento("vc nao tem pokemons vivos", media)
		}
	}
	funcao regedano(real quale, inteiro tipo, inteiro tipoataq)
	{
		multiplicador = tabela_fraquezas[tipoataq][tipo]
		dano = ((ataq_seu_pkmn[inventarioP] / defesa_inimigo[inventarioInimigoP]) * quale) * multiplicador
		
	}
	funcao regedanoinimigo(real quale, inteiro tipo, inteiro tipoataq)
	{
		multiplicador = tabela_fraquezas[tipoataq][tipo]
		dano = (ataq_inimigo[inventarioInimigoP] / defesa_seu_pkmn[inventarioP]) * quale * multiplicador
	}
     funcao desenharInimigo(cadeia nome,inteiro lp, inteiro lpt){
		inteiro caminho = arq.abrir_arquivo("./sprites/"+nome+"/"+nome+"Front.txt", arq.MODO_LEITURA)
		cadeia linha = arq.ler_linha(caminho)
		inteiro nLinha=0 //nlinha é a variavel que define o nuemro da linha, serve para saber que linha o programa esta trabalhando com.
		inteiro vida=lp
		inteiro vidatotal=lpt
		
		enquanto(linha != ""){
			se( nLinha==6 ){
				escreva("	",nome,"								")
			}
			se( nLinha==7 ){
				se(vida>vidatotal){
					vida=vidatotal
				}
				se(vida<0){
					vida=0
				}
				inteiro vidaGrafica=RegraD3(vida,vidatotal,50)

			
				escreva("   ")
				para(inteiro i=0;i<vidaGrafica;i++){
					escreva("█")
					
				}
				para(inteiro i=0;i<50-vidaGrafica;i++){
					escreva("░")
					
				}escreva("	",vida,"/",vidatotal,"			")
				
			}se(nLinha!=7 e nLinha!=6){
					escreva("										")
			}
				
			nLinha++
			escreva(linha)
			
			escreva("\n")
			linha = arq.ler_linha(caminho)
			
		}arq.fechar_arquivo(caminho)

	}
	funcao desenharPokemon(cadeia nome,inteiro lp,inteiro lpt){
		inteiro caminho = arq.abrir_arquivo("./sprites/"+nome+"/"+nome+"Back.txt", arq.MODO_LEITURA)
		cadeia linha = arq.ler_linha(caminho)
		inteiro nLinha=0
		inteiro vida=lp
		inteiro vidatotal=lpt
		
		enquanto(linha!=""){
			nLinha++
			escreva(linha)
			se( nLinha==6 ){
				escreva("  ",nome)
			}
			se( nLinha==7 ){
				se(vida>vidatotal){
					vida=vidatotal
				}
				se(vida<0){
					vida=0
				}
				inteiro vidaGrafica= RegraD3(vida,vidatotal,50)

				escreva(" ")
				para(inteiro i=0;i<vidaGrafica;i++){
					escreva("█")
					
				}
				para(inteiro i=0;i<50-vidaGrafica;i++){
					escreva("░")
					
				}se(vida<0){
					vida=0
					}
				escreva(" ",vida,"/",vidatotal)
			}
				
			interface(nLinha)
			
			escreva("\n")
			linha = arq.ler_linha(caminho)
			
		}arq.fechar_arquivo(caminho)
	}
	funcao interface(inteiro linha){
		
		se(Menu==0){ //menu principal
			se(linha==9){
				escreva("[1]Ataque")
			}
			se(linha==10){
				escreva("[2]Item")
			}
			se(linha==11){
				escreva("[3]Pokemon")
			}
			se(linha==12){
				escreva("[4]Fugiu")
			}
		}
		se(Menu==1){ //menu dos seus ataques
			se(linha==9){
				escreva("[0]"+poder_p[0][seupkmn[inventarioP]])
			}
			se(linha==10){
				escreva("[1]"+poder_p[1][seupkmn[inventarioP]])
			}
			se(linha==11){
				escreva("[2]"+poder_p[2][seupkmn[inventarioP]])
			}
			se(linha==12){
				escreva("[3]"+poder_p[3][seupkmn[inventarioP]])
			}
		}
		se(Menu==2){ //menu que fala qual ataque seu INIMIGO usou
			se(linha==12){
					escrevaLento("Inimigo usou "+poder_p[qual][pkmninimigo[inventarioInimigoP]],1)
					
					se(vida_seu_pkmn[inventarioP]<=0){
						escrevaLento(", "+nomeseu_pkmn[inventarioP]+" desmaiou...",media)
						
					}				
			}
		}
		se(Menu==3){ //menu de pokemons
			
			se(linha==9){
				escreva("[0]",nomeseu_pkmn[0])
				se(nomeseu_pkmn[3]!=""){
					escreva(" [3]",nomeseu_pkmn[3])
				}
			}
			se(linha==11){
				se(nomeseu_pkmn[1]!=""){
					escreva("[1]",nomeseu_pkmn[1])
				}
				se(nomeseu_pkmn[4]!=""){
					escreva(" [4]",nomeseu_pkmn[4])
				}
			}
			se(linha==13){
				se(nomeseu_pkmn[2]!=""){
					escreva("[2]",nomeseu_pkmn[2])
				}
				se(nomeseu_pkmn[5]!=""){
					escreva(" [5]",nomeseu_pkmn[5])
				}
			}	
	}
		se(Menu==4){ //menu que fala qual pokemon VOCÊ troucou para
			se(linha==12){
				escrevaLento("Você trocou para o(a) "+nomeseu_pkmn[inventarioP],media)
			}
		}
		se(Menu==5){ //menu que fal qual pokemon o INIMIGO trocou para
			se(linha==12){
				
				escrevaLento("Inimigo trocou para o(a) "+nome_inimigos[inventarioInimigoP],media)
				
			}
		}
		se(Menu==6){ //menu que fala qual ataque VOCÊ usou
			se(linha==12){
				
				escrevaLento(nomeseu_pkmn[inventarioP]+" usou "+poder_p[escolha_][seupkmn[inventarioP]],media)
				
					se(vida_inimigo[inventarioInimigoP]<=0){ //ve se o pokemon inimigo desmaiou e informa caso verdadeiro
						
						escrevaLento(" ... "+nome_inimigos[inventarioInimigoP]+" desmaiou.",media)
			}
			}
			
			
		}
		se(Menu==7){ //menu que fala que voce ganhou
			se(linha==12){
				escrevaLento("Você ganhou...",media)
			}
		}
		se(Menu==8){ //menu que fala qual item vc tem
				inteiro n=9
				inteiro j=0
				para(inteiro i=0;i<=8;i++){
					se(inventario_item[i]!=0){
						
						se(linha==n){
							escreva(" ["+i+"]"+nome_item[i]+" ")
							
						}j++
						
						se(j==3){
							j=0
							n=n+3
						}
						
					}
				}
			}
		se(Menu==9){
			se(linha==12){
				
				escreva("Você usou "+nome_item[escolhaitem])
				
				para(inteiro i=4;i<=7;i++){
					
					se(escolhaitem==i){
						
						escreva(" em "+nomeseu_pkmn[Escolha])
						
					}
				}
			}
		}
	}
	funcao inteiro RegraD3(inteiro a,inteiro b, inteiro y)
	{
		inteiro n
		
		retorne (a*y)/b

	}
	funcao introducaoprofessor(){
	
    escrevaLento("Olá! Bem-vindo ao mundo dos Pokémon!\n", media)
    escrevaLento("Meu nome é Carvalho! Pessoas me chamam de Professor Pokémon!\n", media)
    escrevaLento("Este mundo é habitado por criaturas chamadas Pokémon!\n", media)
    escrevaLento("Para algumas pessoas, Pokémon são animais de estimação.\n", media)
    escrevaLento("Outros os utilizam para batalhas.\n", media)
    escrevaLento("Eu estudo os Pokémon como profissão.\n", media)
    Util.aguarde(1000)
	limpa()
    escrevaLento("Primeiro... qual é o seu nome?\n", media)
    
     	leia(nome_personagem)
     	
    escrevaLento("Muito bem! Então seu nome é " + nome_personagem+ "!\n", media)
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
		 	Util.aguarde(1000)
	limpa()
    escrevaLento("Este é meu neto. Ele tem sido seu rival desde que você era bebê.\n", media)
    escrevaLento("Erm... qual é o nome dele mesmo?\n", media)
    leia(rival)
    escrevaLento("Isso mesmo! Agora me lembro! O nome dele é "+ rival+ "!\n", media)
    
    escrevaLento(nome_personagem +"! Sua própria lenda Pokémon está prestes a começar!\n", media)
    escrevaLento("Um mundo de sonhos e aventuras com Pokémon espera por você!\n", media)
    escrevaLento("Vamos!\n", media)
	Util.aguarde(1000)
	limpa()
	escrevaLento("...", 200)
	Util.aguarde(1000)
	limpa()
    escrevaLento("...\n", media)
    escrevaLento("-Você acorda em seu quarto, em uma pequena cidade tranquila.\n", media)
    escrevaLento("-Um videogame está ligado, mas você tem coisas mais importantes para fazer.\n", media)
    escrevaLento("-Você desce as escadas e encontra sua mãe na sala.\n", media)
    escrevaLento("Mãe: Bom dia, " + nome_personagem + "! O Professor Carvalho estava procurando por você.\n", media)
    escrevaLento("Mãe: Parece que hoje é o dia em que você começará sua própria aventura Pokémon!\n", media)
    escrevaLento("-Você sai de casa e vai em direção ao laboratório do Professor Carvalho.\n", media)
    escrevaLento("-Dentro do laboratório, o Professor e " + rival + " já estão esperando.\n", media)
    escrevaLento("Professor Carvalho: Ah, " + nome_personagem + "! Que bom que você chegou.\n", media)
    escrevaLento("Professor Carvalho: Hoje você escolherá seu primeiro Pokémon.\n", media)
    escrevaLento("-Na mesa, você vê três Pokébolas alinhadas, cada uma contendo um Pokémon diferente.\n", media)
    escrevaLento("Professor Carvalho: Dentro dessas Pokébolas estão três Pokémon.\n", media)
    escrevaLento("Professor Carvalho: Escolha um deles para ser seu parceiro!\n", media)
    escrevaLento(rival + ": Heh! Eu vou escolher depois de você, " + nome_personagem + "!\n", media)
    escrevaLento("Agora é sua escolha...\n", media)
	escreva("\nQue pokemon voce deseja?")
	laboratorio()
	    
	     leia(escolha_1)
		escolha(escolha_1){

			caso 1: seupkmn[0] = 1
			pare
			caso 2: seupkmn[0] = 4
			pare
			caso 3: seupkmn[0] = 7
			pare
			caso contrario: escrevaLento("Essa opção não existe, diga outro pokemon.\n", media)
			pare
		}

	}
		funcao laboratorio()
		{
escreva("\n==================================================================================\n")
escreva("                           ESCOLHA SEU POKÉMON INICIAL\n")
escreva("==================================================================================\n")
escreva("\n")
escreva("   [1] BULBASAUR                 [2] CHARMANDER                 [3] SQUIRTLE\n")
escreva("\n")
escreva("        *GRAMA*                        ^FOGO^                        ~ÁGUA~\n")
escreva("==================================================================================\n")
escreva("Digite o número do Pokémon escolhido:\n")

		}
		funcao pospallet()
		{
    escrevaLento("Após derrotar " + rival + ", você sai do laboratório confiante.\n", media)
    escrevaLento("Sua jornada finalmente começou!\n", media)
    escrevaLento("Você segue em direção ao norte da cidade, rumo à próxima rota.\n", media)
    escrevaLento("O vento sopra levemente, e o mato alto balança à sua frente.\n", media)
    escrevaLento("Você dá alguns passos para dentro da grama...\n", media)
    escrevaLento("...\n", 500)
    escrevaLento("Um Pokémon selvagem apareceu!\n", media)
    escrevaLento("Prepare-se para a batalha!\n", media)			
		}
		funcao posprimeiroimpacto()
		{

    escrevaLento("Após atravessar o mato e enfrentar seu primeiro Pokémon selvagem...\n", media)
    escrevaLento(nome_personagem + " segue viagem pela rota até alcançar uma nova cidade.\n", media)
    escrevaLento("Você chegou a Viridian City!\n", media)
    escrevaLento("A cidade é tranquila, com casas simples, um Centro Pokémon e até um Ginásio misterioso.\n", media)
    escrevaLento("Você olha em volta e percebe que o Ginásio está fechado.\n", media)
    escrevaLento("Uma placa na porta diz: 'Volte mais tarde.'\n", media)
    escrevaLento("Ao explorar a cidade, você encontra o Centro Pokémon.\n", media)
    escrevaLento("Dentro, a enfermeira Joy sorri: 'Bem-vindo ao Centro Pokémon! Quer que eu cuide dos seus Pokémon?'\n", media)
    escrevaLento(". . .", 700)
    escrevaLento("Após recuperar sua equipe, você percebe a estrada que segue ao norte.\n", media)
    escrevaLento("Essa é a rota para a sua próxima aventura...\n", media)


		}
	funcao AttGraficos()
	{
		limpa()
		desenharInimigo(nome_inimigos[inventarioInimigoP],vida_inimigo[inventarioInimigoP],vida_pkmn[pkmninimigo[inventarioInimigoP]])
          desenharPokemon(nomeseu_pkmn[inventarioP],vida_seu_pkmn[inventarioP],vida_pkmn[seupkmn[inventarioP]])
	}
	funcao vazio pkmnVivos()
	{
		seupkmn_vivosN=0
		para(inteiro i=0;i<=5;i++){
			se(vida_seu_pkmn[i]<=0){
				seupkmn_vivos[i]=falso
			}senao{
				seupkmn_vivos[i]=verdadeiro
				seupkmn_vivosN++
			}
		}
	}
	funcao vazio pkmnInimigosVivos()
	{
		inimigos_vivosN=0
		para(inteiro i=0;i<=5;i++){
			se(vida_inimigo[i]<=0){
				inimigos_vivos[i]=falso
			}senao{
				inimigos_vivos[i]=verdadeiro
				inimigos_vivosN++
			}
		}
	}
	funcao regeataques() //Aqui é definido os 4 ataques de cada pokemon.
	{   
// Pokémon Kanto selecionados com ataques de dano

// 1 - Bulbasaur
poder_p[0][1]="Tackle"
basepower[0][1]=40.0
tipo_ataq[0][1]=0
poder_p[1][1]="Vine Whip"
basepower[1][1]=35.0
tipo_ataq[1][1]=11
poder_p[2][1]="Leech Seed"
basepower[2][1]=20.0
tipo_ataq[2][1]=11
poder_p[3][1]="Razor Leaf"
basepower[3][1]=55.0
tipo_ataq[3][1]=11

// 2 - Ivysaur
poder_p[0][2]="Tackle"
basepower[0][2]=40.0
tipo_ataq[0][2]=0
poder_p[1][2]="Vine Whip"
basepower[1][2]=45.0
tipo_ataq[1][2]=11
poder_p[2][2]="Seed Bomb"
basepower[2][2]=40.0
tipo_ataq[2][2]=11
poder_p[3][2]="Leech Seed"
basepower[3][2]=20.0
tipo_ataq[3][2]=11

// 3 - Venusaur
poder_p[0][3]="Tackle"
basepower[0][3]=40.0
tipo_ataq[0][3]=0
poder_p[1][3]="Vine Whip"
basepower[1][3]=50.0
tipo_ataq[1][3]=11
poder_p[2][3]="Seed Bomb"
basepower[2][3]=50.0
tipo_ataq[2][3]=11
poder_p[3][3]="Razor Leaf"
basepower[3][3]=55.0
tipo_ataq[3][3]=11

// 4 - Charmander
poder_p[0][4]="Scratch"
basepower[0][4]=40.0
tipo_ataq[0][4]=0
poder_p[1][4]="Ember"
basepower[1][4]=40.0
tipo_ataq[1][4]=9
poder_p[2][4]="Flame Charge"
basepower[2][4]=50.0
tipo_ataq[2][4]=9
poder_p[3][4]="Bite"
basepower[3][4]=60.0
tipo_ataq[3][4]=0

// 5 - Charmeleon
poder_p[0][5]="Scratch"
basepower[0][5]=40.0
tipo_ataq[0][5]=0
poder_p[1][5]="Ember"
basepower[1][5]=50.0
tipo_ataq[1][5]=9
poder_p[2][5]="Flame Burst"
basepower[2][5]=70.0
tipo_ataq[2][5]=9
poder_p[3][5]="Bite"
basepower[3][5]=60.0
tipo_ataq[3][5]=0

// 6 - Charizard
poder_p[0][6]="Flamethrower"
basepower[0][6]=90.0
tipo_ataq[0][6]=9
poder_p[1][6]="Wing Attack"
basepower[1][6]=60.0
tipo_ataq[1][6]=2
poder_p[2][6]="Fire Spin"
basepower[2][6]=35.0
tipo_ataq[2][6]=9
poder_p[3][6]="Bite"
basepower[3][6]=60.0
tipo_ataq[3][6]=0

// 7 - Squirtle
poder_p[0][7]="Tackle"
basepower[0][7]=40.0
tipo_ataq[0][7]=0
poder_p[1][7]="Water Gun"
basepower[1][7]=40.0
tipo_ataq[1][7]=10
poder_p[2][7]="Bite"
basepower[2][7]=60.0
tipo_ataq[2][7]=0
poder_p[3][7]="Rapid Spin"
basepower[3][7]=50.0
tipo_ataq[3][7]=0

// 8 - Wartortle
poder_p[0][8]="Tackle"
basepower[0][8]=40.0
tipo_ataq[0][8]=0
poder_p[1][8]="Water Gun"
basepower[1][8]=50.0
tipo_ataq[1][8]=10
poder_p[2][8]="Bite"
basepower[2][8]=60.0
tipo_ataq[2][8]=0
poder_p[3][8]="Rapid Spin"
basepower[3][8]=60.0
tipo_ataq[3][8]=0

// 9 - Blastoise
poder_p[0][9]="Water Gun"
basepower[0][9]=50.0
tipo_ataq[0][9]=10
poder_p[1][9]="Bite"
basepower[1][9]=60.0
tipo_ataq[1][9]=0
poder_p[2][9]="Aqua Tail"
basepower[2][9]=90.0
tipo_ataq[2][9]=10
poder_p[3][9]="Hydro Pump"
basepower[3][9]=110.0
tipo_ataq[3][9]=10

// 19 - Rattata
poder_p[0][19]="Tackle"
basepower[0][19]=30.0
tipo_ataq[0][19]=0
poder_p[1][19]="Quick Attack"
basepower[1][19]=40.0
tipo_ataq[1][19]=0
poder_p[2][19]="Bite"
basepower[2][19]=60.0
tipo_ataq[2][19]=0
poder_p[3][19]="Hyper Fang"
basepower[3][19]=80.0
tipo_ataq[3][19]=0

// 20 - Raticate
poder_p[0][20]="Tackle"
basepower[0][20]=35.0
tipo_ataq[0][20]=0
poder_p[1][20]="Quick Attack"
basepower[1][20]=40.0
tipo_ataq[1][20]=0
poder_p[2][20]="Bite"
basepower[2][20]=60.0
tipo_ataq[2][20]=0
poder_p[3][20]="Hyper Fang"
basepower[3][20]=80.0
tipo_ataq[3][20]=0

// 21 - Spearow
poder_p[0][21]="Peck"
basepower[0][21]=35.0
tipo_ataq[0][21]=2
poder_p[1][21]="Quick Attack"
basepower[1][21]=40.0
tipo_ataq[1][21]=0
poder_p[2][21]="Fury Attack"
basepower[2][21]=40.0
tipo_ataq[2][21]=0
poder_p[3][21]="Agility"
basepower[3][21]=0.0
tipo_ataq[3][21]=0

// 22 - Fearow
poder_p[0][22]="Peck"
basepower[0][22]=35.0
tipo_ataq[0][22]=2
poder_p[1][22]="Drill Peck"
basepower[1][22]=80.0
tipo_ataq[1][22]=2
poder_p[2][22]="Agility"
basepower[2][22]=0.0
tipo_ataq[2][22]=0
poder_p[3][22]="Fury Attack"
basepower[3][22]=40.0
tipo_ataq[3][22]=0

// 27 - Sandshrew
poder_p[0][27]="Scratch"
basepower[0][27]=40.0
tipo_ataq[0][27]=0
poder_p[1][27]="Slash"
basepower[1][27]=70.0
tipo_ataq[1][27]=0
poder_p[2][27]="Fury Swipes"
basepower[2][27]=18.0
tipo_ataq[2][27]=0
poder_p[3][27]="Rollout"
basepower[3][27]=30.0
tipo_ataq[3][27]=5

// 28 - Sandslash
poder_p[0][28]="Slash"
basepower[0][28]=70.0
tipo_ataq[0][28]=0
poder_p[1][28]="Fury Swipes"
basepower[1][28]=18.0
tipo_ataq[1][28]=0
poder_p[2][28]="Earthquake"
basepower[2][28]=100.0
tipo_ataq[2][28]=4
poder_p[3][28]="Rollout"
basepower[3][28]=30.0
tipo_ataq[3][28]=5

// 74 - Geodude
poder_p[0][74]="Tackle"
basepower[0][74]=40.0
tipo_ataq[0][74]=0
poder_p[1][74]="Rock Throw"
basepower[1][74]=50.0
tipo_ataq[1][74]=5
poder_p[2][74]="Self-Destruct"
basepower[2][74]=200.0
tipo_ataq[2][74]=0
poder_p[3][74]="Magnitude"
basepower[3][74]=70.0
tipo_ataq[3][74]=4

// 75 - Graveler
poder_p[0][75]="Tackle"
basepower[0][75]=40.0
tipo_ataq[0][75]=0
poder_p[1][75]="Rock Throw"
basepower[1][75]=50.0
tipo_ataq[1][75]=5
poder_p[2][75]="Earthquake"
basepower[2][75]=100.0
tipo_ataq[2][75]=4
poder_p[3][75]="Explosion"
basepower[3][75]=250.0
tipo_ataq[3][75]=0

// 95 - Onix
poder_p[0][95]="Tackle"
basepower[0][95]=35.0
tipo_ataq[0][95]=0
poder_p[1][95]="Rock Throw"
basepower[1][95]=50.0
tipo_ataq[1][95]=5
poder_p[2][95]="Bind"
basepower[2][95]=15.0
tipo_ataq[2][95]=0
poder_p[3][95]="Rock Slide"
basepower[3][95]=75.0
tipo_ataq[3][95]=5

// 120 - Staryu
poder_p[0][120]="Tackle"
basepower[0][120]=40.0
tipo_ataq[0][120]=0
poder_p[1][120]="Water Gun"
basepower[1][120]=50.0
tipo_ataq[1][120]=10
poder_p[2][120]="Rapid Spin"
basepower[2][120]=50.0
tipo_ataq[2][120]=0
poder_p[3][120]="Swift"
basepower[3][120]=60.0
tipo_ataq[3][120]=0

// 121 - Starmie
poder_p[0][121]="Swift"
basepower[0][121]=60.0
tipo_ataq[0][121]=0
poder_p[1][121]="Water Gun"
basepower[1][121]=50.0
tipo_ataq[1][121]=10
poder_p[2][121]="Rapid Spin"
basepower[2][121]=50.0
tipo_ataq[2][121]=0
poder_p[3][121]="Psychic"
basepower[3][121]=90.0
tipo_ataq[3][121]=13
		             
	}	
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4929; 
 * @DOBRAMENTO-CODIGO = [109, 139, 230, 358, 584, 590, 685, 688, 691, 694, 684, 698, 712, 722, 747, 752, 760, 759, 772, 777, 812, 819, 907, 920, 931, 978];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */