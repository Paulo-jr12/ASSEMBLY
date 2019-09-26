.data 
  
              Hello : .asciiz "Hello world"    # Hello  guarda o valor da string " Hello word "  
              

.text      
        li  $v0, 4                 # o progama  da um load imediate no registrador v0 com  a instrucao de numero 4 que é armazenar uma string . # 
        la $a0, Hello       # o progama carrega o endereco da string no registrador a0  #
        syscall                    # syscall chama Hello e printa na tela o hello world #
        
        
 