programa
{
	inclua biblioteca Util
	inclua biblioteca Texto
	inclua biblioteca Arquivos --> arq
	
     inteiro quantidade_carac
	
	funcao inicio()
	{

		inteiro caminho = arq.abrir_arquivo("./teste.txt", arq.MODO_LEITURA)
		cadeia linha = arq.ler_linha(caminho)
		inteiro nLinha=0
		inteiro vida=5
		inteiro vidatotal=10

		enquanto(linha != ""){
			se(nLinha=10){
				escreva"		"
				para(){
					
				}
			}senao{
				escreva("													")
			}
			
			nLinha++
			escreva(linha)
			escreva("\n")
			linha = arq.ler_linha(caminho)
			
		
			
		}

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
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 390; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {nLinha, 14, 10, 6};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */