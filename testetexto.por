programa
{
	inclua biblioteca Util
	inclua biblioteca Texto
	inclua biblioteca Arquivos --> arq
	
     inteiro quantidade_carac
	
	funcao inicio()
	{
		cadeia PokemonE = "charmander"
		desenharEnimigo(PokemonE)
		//escreva("													")
		//escreva("   ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■           ")

	}
	funcao desenharEnimigo(cadeia nome){
		inteiro caminho = arq.abrir_arquivo("./"+nome+"Front.txt", arq.MODO_LEITURA)
		cadeia linha = arq.ler_linha(caminho)
		inteiro nLinha=0
		inteiro vida=10
		inteiro vidatotal=20
		inteiro vidaGrafica= RegraD3(vida,vidatotal,50)

		enquanto(linha != ""){
			se( nLinha==6 ){
				escreva("	",nome,"								")
			}
			se( nLinha==7 ){
				escreva("   ")
				para(inteiro i=0;i<vidaGrafica;i++){
					escreva("█")
					
				}
				para(inteiro i=0;i<50-vidaGrafica;i++){
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
	funcao desenharPokemon(){
		
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
 * @POSICAO-CURSOR = 994; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */