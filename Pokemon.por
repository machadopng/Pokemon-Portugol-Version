programa
{
	inclua biblioteca Matematica
	inclua biblioteca Texto
	inclua biblioteca Util
	inclua biblioteca Arquivos --> arq
     cadeia  nome_pkmn[7], nomeseu_pkmn, inimigo
     real    vida_pkmn[7], vida_seu_pkmn, vida_inimigo
     real    ataq_pkmn[7], ataq_seu_pkmn, ataq_inimigo
     real    defesa_pkmn[7], defesa_seu_pkmn, defesa_inimigo 
     inteiro tipo_pkmn[7], tipo_seu_pkmn, tipo_inimigo
     real    basepower[100][100], dano = 0.0
     inteiro seupkmn, inipkmn
     inteiro genero = -1
     cadeia  start
     cadeia  nome_personagem
	inteiro quantidade_carac
	inteiro escolha_
	cadeia  poder_p[100][100]
	inteiro media = 1
	logico  acabou 
	real    multiplicador
	inteiro tipo_ataq[4][18]                    
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
		escreva("                                                                                   ▗▄▄▖      ▗▄▖     ▗▖ ▗▖    ▗▄▄▄▖    ▗▖  ▗▖     ▗▄▖     ▗▖  ▗▖\n")
		escreva("                                                                                   ▐▌ ▐▌    ▐▌ ▐▌    ▐▌▗▞▘    ▐▌       ▐▛▚▞▜▌    ▐▌ ▐▌    ▐▛▚▖▐▌\n")
		escreva("                                                                                   ▐▛▀▘     ▐▌ ▐▌    ▐▛▚▖     ▐▛▀▀▘    ▐▌  ▐▌    ▐▌ ▐▌    ▐▌ ▝▜▌\n")
		escreva("                                                                                   ▐▌       ▝▚▄▞▘    ▐▌ ▐▌    ▐▙▄▄▖    ▐▌  ▐▌    ▝▚▄▞▘    ▐▌  ▐▌\n")

		escreva("\n\n\n                                                                                       ▗▄▄▖ ▗▄▄▖ ▗▄▄▄▖ ▗▄▄▖ ▗▄▄▖     ▗▄▄▖▗▄▄▄▖▗▄▖ ▗▄▄▖▗▄▄▄▖\n")
		escreva("                                                                                       ▐▌ ▐▌▐▌ ▐▌▐▌   ▐▌   ▐▌       ▐▌     █ ▐▌ ▐▌▐▌ ▐▌ █  \n")
		escreva("                                                                                       ▐▛▀▘ ▐▛▀▚▖▐▛▀▀▘ ▝▀▚▖ ▝▀▚▖     ▝▀▚▖  █ ▐▛▀▜▌▐▛▀▚▖ █  \n")
		escreva("                                                                                       ▐▌   ▐▌ ▐▌▐▙▄▄▖▗▄▄▞▘▗▄▄▞▘    ▗▄▄▞▘  █ ▐▌ ▐▌▐▌ ▐▌ █  \n")
		leia(start)
		limpa()
		regepokemon()
		regeataques()
		regeenemy(1)
		genero_personagem()
		definanome()
	     escreva("\nQue pokemon voce deseja?")
	     escreva("\n", "1 - ",nome_pkmn[1],"\n", "2 - ",nome_pkmn[2]," \n", "3 - ",nome_pkmn[3], "\n")    
	     leia(seupkmn)

          se(seupkmn != 2 e seupkmn !=1 e seupkmn != 3)
		{
			escrevaLento("Essa opção não existe, diga outro pokemon.\n", media)
			leia(seupkmn)
		}
	     
	     limpa()
	     regeseu()
          acabou = falso
	     BatalhaPokemon(1)
	     regepokemon()
	     escrevaLento("Acabou a batalha", media)
	}
	
	
	


     funcao regeseu()//Aqui vai regir seu pokémon, com base nos atributos da outra função la
     {
           nomeseu_pkmn=nome_pkmn[seupkmn]
           vida_seu_pkmn=vida_pkmn[seupkmn]
           ataq_seu_pkmn=ataq_pkmn[seupkmn]
           defesa_seu_pkmn=defesa_pkmn[seupkmn]
           tipo_seu_pkmn=tipo_pkmn[seupkmn]
     }

     funcao regeenemy(inteiro quale)//mesmo que de cima, só que pro seu inimigo nas batalhas.
     {
     	 inipkmn = quale
           inimigo=nome_pkmn[quale]
           vida_inimigo=vida_pkmn[quale]
           ataq_inimigo=ataq_pkmn[quale]
           defesa_inimigo=defesa_pkmn[quale]
           tipo_inimigo=tipo_pkmn[quale]
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
     	
     	escrevaLento("\nAgora me diga seu nome.\n", media)
     	leia(nome_personagem)
     	escrevaLento("Entendo. Olá, " + nome_personagem + "!\n", media)
     }

     

     funcao regepokemon() //Aqui é definido os atributos de cada pokemon.
	{
			        nome_pkmn[1] = "Bulbassaur"
			        tipo_pkmn[1] = 11
			        vida_pkmn[1] = 45.0
			        ataq_pkmn[1] = 49.0
			        defesa_pkmn[1] = 49.0
			      
			        nome_pkmn[2] = "Squirtle"
			        tipo_pkmn[2] = 10
			        vida_pkmn[2] = 44.0
			        ataq_pkmn[2] = 48.0
			        defesa_pkmn[2] = 65.0
			        
			        nome_pkmn[3] = "Charmander"
			        tipo_pkmn[3] = 9
			        vida_pkmn[3] = 39.0
			        ataq_pkmn[3] = 52.0
			        defesa_pkmn[3] = 43.0
			       
				
			      
	}

	funcao regeataques()
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

					//squirtle
			        poder_p  [0][2] = "Tackle"
			        basepower[0][2] = 40.0
			        tipo_ataq[0][2] = 0
			        
			        poder_p  [1][2] = "Bubble"
			        basepower[1][2] = 30.0
			        tipo_ataq[1][2] = 100
			        
			        poder_p  [2][2] = "Water Gun"
			        basepower[2][2] = 20.0
			        tipo_ataq[2][2] = 10
			        
			        poder_p  [3][2] = "Hydro Pump"
                       basepower[3][2] = 55.0
                       tipo_ataq[3][2] = 10  

					//charmander
			        poder_p  [0][3] = "Scratch"
			        basepower[0][3] = 40.0
			        tipo_ataq[0][3] = 0
			        
			        poder_p  [1][3] = "Ember"
			        basepower[1][3] = 30.0
			        tipo_ataq[1][3] = 9
			        
			        poder_p  [2][3] = "Dragon Breath"
			        basepower[2][3] = 60.0
			        tipo_ataq[2][3] = 15
			        
			        poder_p  [3][3] = "Bite"
                       basepower[3][3] = 40.0
                       tipo_ataq[3][3] = 16                      
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
          	
          desenharInimigo(inimigo,0,10)
          desenharPokemon(nomeseu_pkmn,0,10)
		
		se(turno %2 == 0)
		{
			regeenemy(1)
			inteiro qual = Util.sorteia(0, 3)			
			regedanoinimigo(basepower[qual][inipkmn], tipo_seu_pkmn, tipo_ataq[qual][inipkmn])
			vida_seu_pkmn = vida_seu_pkmn - dano
			
			se(vida_seu_pkmn <= 0)
			{
				escrevaLento("\nVoce perdeu.", media)
				acabou = verdadeiro
			}
			senao
			{
				escrevaLento("A vida do inimigo atual: " + vida_inimigo, media)
				turno++
			}
		}
		se(turno %2 != 0)
		{
			leia(escolha_)

			se(escolha_ != 1 e escolha_ !=2 e escolha_ != 3 e escolha_ != 4)
		     {
				escrevaLento("Essa opção não existe.\n", media)
		     }


		
			escolha(escolha_)
			{
				caso 1:
				escreva("                Ataques        \n\n")
				para(inteiro i = 0; i < 4; i++){
					
				
				escreva(i, " - ", poder_p[i][seupkmn],"   ")
				
				
		     } 
		     escreva("\n                 Qual ataque?\n")
		     leia(escolha_)
		
				
			regedano(basepower[escolha_][seupkmn], tipo_inimigo , tipo_ataq[escolha_][seupkmn])
			
			vida_inimigo = vida_inimigo - dano
			escrevaLento(nome_personagem + " usou: " + poder_p[escolha_][seupkmn] + ".\nCom o dano de: " + Matematica.arredondar(dano, 0), media)
			Util.aguarde(2000)limpa()
			se(vida_inimigo <= 0){
				escrevaLento("\nVoce ganhou.", media)
				acabou = verdadeiro
			}senao{
				escrevaLento("Voce deu de dano: " + Matematica.arredondar(dano, 0), media)
				turno++
			}
				
			   caso 2: escreva("eitaaa")
			           pare
			   caso 3: escreva("puuuutz")
			   		 pare
			   caso 4: escrevaLento("Voce fugiu da batalha...", media)
			   		 acabou = verdadeiro
			   		 pare
			}
		}//TURNO
		
		
	     }//BATALHA

	}//FUNCAO
	funcao regedano(real quale, inteiro tipo, inteiro tipoataq)
	{
		multiplicador = tabela_fraquezas[tipoataq][tipo]
		dano = ((ataq_seu_pkmn / defesa_inimigo) * quale) * multiplicador
		
	}
	funcao regedanoinimigo(real quale, inteiro tipo, inteiro tipoataq)
	{
		multiplicador = tabela_fraquezas[tipoataq][tipo]
		dano = (ataq_inimigo / defesa_seu_pkmn) * quale * multiplicador
	}
     funcao desenharInimigo(cadeia nome,inteiro lp, inteiro lpt){
		inteiro caminho = arq.abrir_arquivo("./sprites/"+nome+"/"+nome+"Front.txt", arq.MODO_LEITURA)
		cadeia linha = arq.ler_linha(caminho)
		inteiro nLinha=0
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
				para(inteiro i=0;i<=vidaGrafica;i++){
					escreva("█")
					
				}
				para(inteiro i=0;i<=50-vidaGrafica;i++){
					escreva("░")
					
				}escreva("	",vida,"/",vidatotal,"			")
				
			}se(nLinha!=7 e nLinha!=6){
				para(inteiro i=0;i<10;i++){
					escreva("	")
				}
				
			}
				
			nLinha++
			escreva(linha)
			
			escreva("\n")
			linha = arq.ler_linha(caminho)
			
		}
		arq.fim_arquivo(caminho)
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
				}inteiro vidaGrafica= RegraD3(vida,vidatotal,50)

				escreva(" ")
				para(inteiro i=0;i<=vidaGrafica;i++){
					escreva("█")
					
				}
				para(inteiro i=0;i<=50-vidaGrafica;i++){
					escreva("░")
					
				}escreva(" ",vida,"/",vidatotal)
			}
			interface(nLinha,escolha_)
			
			escreva("\n")
			linha = arq.ler_linha(caminho)
		}
		arq.fechar_arquivo(caminho)
	}
	funcao interface(inteiro linha, inteiro Escolha){
		inteiro Menu=Escolha
		
		se(Menu==0){
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
		se(Menu==1){
			se(linha==9){
				escreva("[0]"+poder_p[0][seupkmn])
			}
			se(linha==10){
				escreva("[1]"+poder_p[1][seupkmn])
			}
			se(linha==11){
				escreva("[2]"+poder_p[2][seupkmn])
			}
			se(linha==12){
				escreva("[3]"+poder_p[3][seupkmn])
			}
		}
		
	}
	funcao inteiro RegraD3(inteiro a,inteiro b, inteiro y)
	{
		inteiro n
		
		retorne (a*y)/b

	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 8946; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {nomeseu_pkmn, 7, 27, 12}-{inimigo, 7, 41, 7};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */