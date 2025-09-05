programa
{
	inclua biblioteca Util
	inclua biblioteca Texto
	inclua biblioteca Arquivos --> arq
	
     inteiro quantidade_carac
	inteiro escolha_
	funcao inicio()
	{
		cadeia PokemonE = "charmander"
		desenharEnimigo(PokemonE,2,20)
		desenharPokemon("charmander",11,20)


		//escreva("													")
		//escreva("   ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■           ")

	}
	funcao desenharEnimigo(cadeia nome,inteiro lp, inteiro lpt){
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
			interface(nLinha,0)
			
			escreva("\n")
			linha = arq.ler_linha(caminho)
		}
	}
	funcao interface(inteiro linha, inteiro Escolha){
		inteiro Menu=0
		
		se(Menu==0){
			se(linha==9){
				escreva("[0]Ataque")
			}
			se(linha==10){
				escreva("[1]Item")
			}
			se(linha==11){
				escreva("[2]Pokemon")
			}
			se(linha==12){
				escreva("[3]Fugiu")
			}
		}
		se(Menu==1){
			se(linha==9){
				escreva("[0]Ataque")
			}
			se(linha==10){
				escreva("[1]Item")
			}
			se(linha==11){
				escreva("[2]Pokemon")
			}
			se(linha==12){
				escreva("[3]Fugiu")
			
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
 * @POSICAO-CURSOR = 2499; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */