programa
{
	
	funcao inicio()
	{
    
	     inteiro inventario
          inteiro escolha_
          cadeia pokemons[5] = {"Erik", "Jorge", "Matheus", "Miotti","Fonseca"}
		escreva("Qual pokemon você quer?\n")
		para(inteiro i=0; i < 3; i++){
			escreva(i," - ",pokemons[i], " ", "\n")
		}
		escreva("\n")
		leia(escolha_)
		enquanto(escolha_ != 0 e escolha_ != 1 e escolha_ != 2){
			se(escolha_ != 0 e escolha_ != 1 e escolha_ != 2){
			escreva("Essa opçao nao existe\n")
			leia(escolha_)
		}
			
		}
		escreva("Entao vc escolheu o ", pokemons[escolha_])
		escreva("\nVoce capturou o Miotti!\n")
		escreva("Voce quer abrir seu inventario?\n\n1 PARA SIM 2 PARA NAO\n")
		leia(inventario)
		se(inventario == 1){
			escreva("Seus seguintes pokemons são:\n")
			escreva(pokemons[escolha_],"\n", pokemons[3],"\n")
			
		}
		escreva("\nJorge te deu o fonfon!\n")
		escreva("\nVoce quer abrir seu inventario?\n\n1 PARA SIM 2 PARA NAO\n")
		leia(inventario)
		se(inventario == 1){
			escreva("Seus seguintes pokemons são:\n")
			escreva(pokemons[escolha_],"\n", pokemons[3], "\n",pokemons[4])
			
		}
		
		
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1079; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
