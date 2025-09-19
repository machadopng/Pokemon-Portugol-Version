programa
{
	inclua biblioteca Matematica
	inclua biblioteca Texto
	inclua biblioteca Util
	inclua biblioteca Arquivos --> arq
	inteiro Menu
     cadeia  nome_pkmn[151], nomeseu_pkmn[6], inimigo
     real    vida_pkmn[151], vida_seu_pkmn[6], vida_inimigo
     real    ataq_pkmn[151], ataq_seu_pkmn[6], ataq_inimigo
     real    defesa_pkmn[151], defesa_seu_pkmn[6], defesa_inimigo
     inteiro tipo_pkmn[161], tipo_seu_pkmn[6], tipo_inimigo
     real    basepower[100][100], dano = 0.0
     inteiro inipkmn
     inteiro genero = -1
     cadeia  start
     inteiro seupkmn[6] = {1,0,0,0,0,0}
     cadeia inventario[6]// inventario da batalha
     inteiro seupkmn_atual = seupkmn[0]
     inteiro escolha_pokemon = 0
     inteiro pokemoncapturado // pokemon que vc capturou
     cadeia  nome_personagem = "nulo", rival = "nulo"
	inteiro quantidade_carac
	inteiro escolha_, escolha_1
	cadeia  poder_p[100][100]
	inteiro media = 3
	logico  acabou 
	real    multiplicador
	inteiro tipo_ataq[4][18] 
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

		regepokemon()
		regeataques()
		
		//introducaoprofessor()
	     limpa()
	    
	     regeseu()
	     
          acabou = falso
          regeenemy(1)
          regepokemon()
	     //pospallet()
	     regepokemon()
	     posprimeiroimpacto()
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
	
	
	


     funcao regeseu()//Aqui vai regir os seus 6 pokemon, status, nome, tipagem.
     {
           nomeseu_pkmn[0]   = nome_pkmn [seupkmn[0]]
           vida_seu_pkmn[0]   = vida_pkmn [seupkmn[0]]
           ataq_seu_pkmn[0]   = ataq_pkmn [seupkmn[0]]
           defesa_seu_pkmn[0] = defesa_pkmn [seupkmn[0]]
           tipo_seu_pkmn[0]   = tipo_pkmn [seupkmn[0]]

           nomeseu_pkmn[1]   = nome_pkmn [seupkmn[1]]
           vida_seu_pkmn[1]   = vida_pkmn [seupkmn[1]]
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
     	 inipkmn 		 =              quale
           inimigo        =nome_pkmn	[quale]
           vida_inimigo   =vida_pkmn	[quale]
           ataq_inimigo   =ataq_pkmn	[quale]
           defesa_inimigo =defesa_pkmn  [quale]
           tipo_inimigo	 =tipo_pkmn	[quale]
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

	funcao regeataques() //Aqui é definido os 4 ataques de cada pokemon.
	{
					//bulbassaur
		 		   poder_p  [0][1] = "Tackle"
			        basepower[0][1] = 40.0
			        tipo_ataq[0][1] = 0
			        
			        poder_p  [1][1] = "Growl"
			        
			        poder_p  [2][1] = "Leech Seed"
			        basepower[2][1] = 20.0
			        tipo_ataq[2][1] = 11
			        
			        poder_p  [3][1] = "Vine Whip"
			        basepower[3][1] = 40.0
			        tipo_ataq[3][1] = 11     
					//ivyssaur
		 		   poder_p  [0][2] = "Tackle"
			        basepower[0][2] = 40.0
			        tipo_ataq[0][2] = 0
			        
			        poder_p  [1][2] = "Growl"
			        
			        poder_p  [2][2] = "Leech Seed"
			        basepower[2][2] = 20.0
			        tipo_ataq[2][2] = 11
			        
			        poder_p  [3][2] = "Vine Whip"
			        basepower[3][2] = 40.0
			        tipo_ataq[3][2] = 11  
					//venussaur
		 		   poder_p  [0][3] = "Tackle"
			        basepower[0][3] = 40.0
			        tipo_ataq[0][3] = 0
			        
			        poder_p  [1][3] = "Growl"
			        
			        poder_p  [2][3] = "Leech Seed"
			        basepower[2][3] = 20.0
			        tipo_ataq[2][3] = 11
			        
			        poder_p  [3][3] = "Vine Whip"
			        basepower[3][3] = 40.0
			        tipo_ataq[3][3] = 11  			        

					//charmander
			        poder_p  [0][4] = "Scratch"
			        basepower[0][4] = 40.0
			        tipo_ataq[0][4] = 0
			        
			        poder_p  [1][4] = "Ember"
			        basepower[1][4] = 30.0
			        tipo_ataq[1][4] = 9
			        
			        poder_p  [2][4] = "Dragon Breath"
			        basepower[2][4] = 60.0
			        tipo_ataq[2][4] = 15
			        
			        poder_p  [3][4] = "Bite"
                       basepower[3][4] = 40.0
                       tipo_ataq[3][4] = 16
					//charmeleon
			        poder_p  [0][5] = "Scratch"
			        basepower[0][5] = 40.0
			        tipo_ataq[0][5] = 0
			        
			        poder_p  [1][5] = "Ember"
			        basepower[1][5] = 30.0
			        tipo_ataq[1][5] = 9
			        
			        poder_p  [2][5] = "Dragon Breath"
			        basepower[2][5] = 60.0
			        tipo_ataq[2][5] = 15
			        
			        poder_p  [3][5] = "Bite"
                       basepower[3][5] = 40.0
                       tipo_ataq[3][5] = 16
					//charizard
			        poder_p  [0][6] = "Scratch"
			        basepower[0][6] = 40.0
			        tipo_ataq[0][6] = 0
			        
			        poder_p  [1][6] = "Ember"
			        basepower[1][6] = 30.0
			        tipo_ataq[1][6] = 9
			        
			        poder_p  [2][6] = "Dragon Breath"
			        basepower[2][6] = 60.0
			        tipo_ataq[2][6] = 15
			        
			        poder_p  [3][6] = "Bite"
                       basepower[3][6] = 40.0
                       tipo_ataq[3][6] = 16                            
					//squirtle
			        poder_p  [0][7] = "Tackle"
			        basepower[0][7] = 40.0
			        tipo_ataq[0][7] = 0
			        
			        poder_p  [1][7] = "Bubble"
			        basepower[1][7] = 30.0
			        tipo_ataq[1][7] = 100
			        
			        poder_p  [2][7] = "Water Gun"
			        basepower[2][7] = 20.0
			        tipo_ataq[2][7] = 10
			        
			        poder_p  [3][7] = "Hydro Pump"
                       basepower[3][7] = 55.0
                       tipo_ataq[3][7] = 10  
					//wartotle
			        poder_p  [0][8] = "Tackle"
			        basepower[0][8] = 40.0
			        tipo_ataq[0][8] = 0
			        
			        poder_p  [1][8] = "Bubble"
			        basepower[1][8] = 30.0
			        tipo_ataq[1][8] = 100
			        
			        poder_p  [2][8] = "Water Gun"
			        basepower[2][8] = 20.0
			        tipo_ataq[2][8] = 10
			       
			        poder_p  [3][8] = "Hydro Pump"
                       basepower[3][8] = 55.0
                       tipo_ataq[3][8] = 10  
					//blastoise
			        poder_p  [0][9] = "Tackle"
			        basepower[0][9] = 40.0
			        tipo_ataq[0][9] = 0
			       
			        poder_p  [1][9] = "Bubble"
			        basepower[1][9] = 30.0
			        tipo_ataq[1][9] = 100
			        
			        poder_p  [2][9] = "Water Gun"
			        basepower[2][9] = 20.0
			        tipo_ataq[2][9] = 10
			       
			        poder_p  [3][9] = "Hydro Pump"
                       basepower[3][9] = 55.0
                       tipo_ataq[3][9] = 10 
                    
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
          enquanto(acabou == falso)
          {
          	
		se(turno %2 == 0)
		{//Turno inimigo.
		
			regedanoinimigo(basepower[qual][inipkmn], tipo_seu_pkmn[seupkmn_atual], tipo_ataq[qual][inipkmn])   //Ataque inimigo.
			vida_seu_pkmn[seupkmn_atual] = vida_seu_pkmn[seupkmn_atual] - dano
			
			se(vida_seu_pkmn[seupkmn_atual] <= 0)
			{
				escrevaLento("\nVoce perdeu.", media)
				acabou = verdadeiro
				
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
				regedano(basepower[escolha_][seupkmn_atual], tipo_inimigo , tipo_ataq[escolha_][seupkmn_atual])  // Calculo seu dano
				vida_inimigo = vida_inimigo - dano											//
				
				
			
				se(vida_inimigo <= 0)
				{
					escrevaLento("\nVoce ganhou.", media)
					acabou = verdadeiro
				}
				senao
				{
					escrevaLento("Voce deu de dano: " + Matematica.arredondar(dano, 0) + "\n", media)
					Util.aguarde(2000)
					turno++
				}
					pare
		    
		     
				
			   caso 2: escreva("Iten")
			   	limpa()
			   	
			           pare
			   caso 3:
			   		limpa() 
			   		Menu=3
			          AttGraficos()
		               leia(escolha_pokemon)
			           
			           
			           
			           

			          enquanto(escolha_pokemon != 0 e escolha_pokemon !=1 e escolha_pokemon != 2 e escolha_pokemon != 3 e escolha_pokemon != 4 e escolha_pokemon != 5)
		               {
		               	
			          se(escolha_pokemon != 0 e escolha_pokemon !=1 e escolha_pokemon != 2 e escolha_pokemon != 3 e escolha_pokemon != 4 e escolha_pokemon != 5)
		               {
				     escrevaLento("Essa opção não existe.\n", media)
		               }
		               
		               }
			           
			   		pare
			   		 
			   caso 4: escrevaLento("Voce fugiu da batalha...", media)
			   		 acabou = verdadeiro
			   		 pare
			}
		}
		
		
	     }

	}
	funcao regedano(real quale, inteiro tipo, inteiro tipoataq)
	{
		multiplicador = tabela_fraquezas[tipoataq][tipo]
		dano = ((ataq_seu_pkmn[seupkmn_atual] / defesa_inimigo) * quale) * multiplicador
		
	}
	funcao regedanoinimigo(real quale, inteiro tipo, inteiro tipoataq)
	{
		multiplicador = tabela_fraquezas[tipoataq][tipo]
		dano = (ataq_inimigo / defesa_seu_pkmn[seupkmn_atual]) * quale * multiplicador
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
				}inteiro vidaGrafica=RegraD3(vida,vidatotal,50)

			
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
		inteiro caminho = arq.abrir_arquivo("./sprites/"+nomeseu_pkmn[seupkmn_atual]+"/"+nomeseu_pkmn[seupkmn_atual]+"Back.txt", arq.MODO_LEITURA)
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
				}inteiro vidaGrafica= RegraD3(vida,vidatotal,50)

				escreva(" ")
				para(inteiro i=0;i<vidaGrafica;i++){
					escreva("█")
					
				}
				para(inteiro i=0;i<50-vidaGrafica;i++){
					escreva("░")
					
				}escreva(" ",vida,"/",vidatotal)
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
				escreva("[0]"+poder_p[0][seupkmn_atual])
			}
			se(linha==10){
				escreva("[1]"+poder_p[1][seupkmn_atual])
			}
			se(linha==11){
				escreva("[2]"+poder_p[2][seupkmn_atual])
			}
			se(linha==12){
				escreva("[3]"+poder_p[3][seupkmn_atual])
			}
		}
		se(Menu==2){ //menu do ataque do inimigo
			se(linha==12){
			escrevaLento("Inimigo usou "+poder_p[qual][inipkmn],1)
			}
		}
		se(Menu==3){ //menu de pokemons
			se(linha==9){
				escreva("[0]",nomeseu_pkmn[seupkmn[0]])
				se(nomeseu_pkmn[3]!=""){
					escreva(" [3]",nomeseu_pkmn[seupkmn[3]])
				}
			}
			se(linha==11){
				se(nomeseu_pkmn[1]!=""){
					escreva(" [1]",nomeseu_pkmn[seupkmn[1]])
				}
				se(nomeseu_pkmn[4]!=""){
					escreva(" [4]",nomeseu_pkmn[seupkmn[4]])
				}
			}
			se(linha==13){
				se(nomeseu_pkmn[2]!=""){
					escreva(" [2]",nomeseu_pkmn[seupkmn[5]])
				}
				se(nomeseu_pkmn[5]!=""){
					escreva(" [5]",nomeseu_pkmn[seupkmn[5]])
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
		desenharInimigo(inimigo,vida_inimigo,vida_pkmn[inipkmn])
          desenharPokemon(nomeseu_pkmn[seupkmn_atual],vida_seu_pkmn[seupkmn_atual],vida_pkmn[seupkmn[0]])
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3837; 
 * @DOBRAMENTO-CODIGO = [89, 164, 565, 571, 655, 658, 661, 664, 654, 668, 682, 712];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */