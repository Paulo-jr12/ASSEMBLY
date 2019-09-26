# NOME : PAULO CESAR GARCIA JUNIOR
# MATRICULA : 11811BCC003

# OBJETIVO DO CODIGO : Este programa apresenta uma entrada para dois numeros inteiros (Dividendo e Divisor ),
# onde o numero inteiro numerador vai ser dividido pelo o numero inteiro denominador, sendo assim,
# o mesmo imprime o quociente e o resto da divisao.

# DATA DE INICIO : 07/09/19

# DATA DE FIM : 09/09/19

# LINGUAGEM : ASSEMBLY

.data
     dividendo: .asciiz "Dividendo: "
     Divisor: .asciiz "Divisor: "
      #Explica o que sera printado na tela
     Quociente: .asciiz "\nResultado: "
     Resto: .asciiz "\nResto:"
.text
      li $v0,4 #chama o syscall para exibir o primeiro texto(Numerador) - - x
      la $a0,dividendo
      syscall #Realiza a chamada no sistema x
     
      li $v0,5    #Realiza a chamada syscall no '5' para ler o Divisor digitado pelo usuario x
      syscall #Realiza a chamada no sistema x
     
      move $t0,$v0 # Move o numero digitado na entrada para o outro registrador($t0)  x
     
      li $v0,4 #chama o syscall para exibir o segundo texto (divisor) x
      la $a0,Divisor
      syscall #Realiza a chamada no sistema x
     
      li $v0,5 #Chamada syscall no '5' para ler o divisor que o usuario digitar  
      syscall #Realiza a chamada no sistema  
     
      move $t1,$v0
     
      div $t0,$t1   #Divide o 1º registrador pelo 2ºregistrador e armazena dentro dos registradores especiais 

      mflo $s3 #Guarda o quociente em Lo e o guarda o resto em Hi 
     
      li $v0,4 #chamada syscall para exibir o Quociente 
      la $a0,Quociente
      syscall #Realiza a chamada no sistema 
     
      li $v0,1    #chamada syscall para exibir o quociente 
      move $a0,$s3
      syscall #Realiza a chamada no sistema 
     
     
      mfhi $s0 #Registrador onde fica armazenado o resto de divisao 
     
      li $v0,4 #chamada syscall para exibir o Resto de divisao 
      la $a0,Resto
      syscall     #Realiza a chamada no sistema 

      li $v0,1 #Chamada syscall para exibir resto (inteiro) 
      move $a0,$s0
      syscall #Realiza a chamada no sistema 

     Finish: li $v0, 10	  # Prepara o processo de finaliza�ao 
		syscall	   # finaliza o processo
             
    
