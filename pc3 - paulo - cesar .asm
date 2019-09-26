# NOME : PAULO CESAR GARCIA JUNIOR
# MATRICULA : 11811BCC003	
# OBJETIVO DO CODIGO : Esse codigo tem o objetivo de demostrar como eh o funcionamento da Conjectura de Collatz ou Problema 3x + 1 .
# DATA DE INICIO : 13/09/19
# DATA DE FIM :  15/09/19
# LINGUAGEM : ASSEMBLY

.text 

	main:
	
	li $v0, 4	        #Realiza a impressao  do Termo 
 	la $a0, Termo
 	syscall
 		
 	li $v0,5	        # Realiza a chamada syscall no '5' para fazer a leitura do termo que o usuario digitar 
 	syscall
 		
 	move $t0,$v0	        #Move o $v0 para o registrador $t0  * 
 		
 	add $t4,$zero,1         #Coloca o valor 1 no resgistrador $t0 , e testa se o numero digitado e maior que zero *
 		
 	beq $t4,$t0,Sair	# Realiza a verificao e se o valor de $t0 for 1, então o progama encerra a funçao *
 	bgtz $t0,Compara	#Realiza a verificacao e se numero em $t0 for maior que zero, então o mesmo funciona corretamente *
 	blez $t0,falha          #$t0 < zero  * 
	
	li $v0,4	        #Realiza a impressao da lista *
 	la $a0,Erro
 	syscall
	
	Sair:	
	
	li $v0,1               # Realiza a impressao  do numero 1 
	move $a0,$t0
	syscall
	  	
 	li $v0, 10             # Realiza a acao de encerramento 
	syscall	
 	
	falha:
	  	
	li $v0,4	       # Realiza a chamada Syscall no '4' para imprimir o  mesmo 
	la $a0,Erro
	syscall
	  	
        li $v0, 10
	syscall
 		
	Compara:
 		
 	li $v0,4	        #Realiza a impressao da lista de termos  
 	la $a0,Lista
 	syscall
 		
 	add $t3,$zero,3	        #O registrador $t3 recebe o numero 3 
 	li $t1, 2	        # O registrador $t1 recebe o valor 2, para dividir e testar se o resto eh 0 ou 1 
 	
 	div $t0,$t1 	    	#Realiza a Divisao do registrador $t0 pelo registrador $t1  
 	mfhi $s0	     	# O registrador $s0 recebe o resto da divisao  
 		
 	beq $s0,$zero,par    	# compara se o resto eh 0 , e verifica se eh par  
 	bne $s0,$zero,impar  	# compara se o resto eh diferente de 0 e verifica se eh impar  
	  	

	par:
	  	
	li $v0,1             	#Realiza a impressao do termo 
	move $a0,$t0
	syscall
	  	
        move $t0,$a0         	#  Move o numero para o registrador $t0 	
	  	
	li $v0,4	     	#Realiza a impressao da primeira virgula 
	la $a0,Virgula
 	syscall
 		
 	div  $t0,$t1    	#Realiza a Divisao por 2  
 	mflo $t0        	# O registrador $t0 recebe o valor do quociente 
 		
 	div $t0, $t1    	#Realiza a Divisao por 2 novamente	e armazena o resto da divisao
 	mfhi $s0                #Resto da divisao  

 	beq $t4,$t0,Encerra	    # Se o valor no registrador $t0 for 1, então a funcao eh encerrada   
 	beq $s0,$zero,par	    # Se o resto da divisao eh igual a zero, então o valor eh par  
 	bgt $s0,$zero,impar     #Se o resto da divisao eh diferente de zero, então eh impar  
 		
 		
 	impar:
 		
 	li $v0,1        	#Realiza a impressao  
	move $a0,$t0
	syscall
	  	
	move $t0,$a0      	#Move o numero para o registrador $t0  
	  	
	li $v0,4	  	#Realiza a impressao  da primeira virgula 
	la $a0,Virgula
	syscall
	  	
	mul $t2,$t0,$t3	  	#Realiza a Multiplicacao do valor por 3 e coloca o mesmo no registrador $t2  
	add $t2,$t2,1     	#Realiza a Soma de 1 com o resultado da multiplicacao 
	
	move $t0,$t2      	#Move o resultado para o registrador $t0 
	  	
	div $t0,$t1       	#Realiza a Divisao    
	mfhi $s0           	#Realiza o Resto da divisao  
 		
 	beq $t4,$t0,Encerra	#Se o valor do registrador $t0 for 1, entao encerra a funçao		
	beq $s0,$zero,par	#se o resto de divisao for 0, entao o valor eh par
 	bgt $s0,$zero,impar   #se o resto de divisao eh diferente de 0, entao o  valor eh impar
	  	
 		
 	Encerra:
 		
 	li $v0,1      		#Realiza a Impressao 
	move $a0,$t0
	syscall         
	  	
 	li $v0, 10 		#Realiza a acao de encerramento 
	syscall				


.data
       Termo: .asciiz "Digite o Primeiro termo: " 
       Erro: .asciiz  "Erro, eh necessario que digite um numero maior que zero ! Digite novamente !" 
       Lista: .asciiz "Seq : " 
       Virgula: .asciiz " ," 
