# GIT

<h3>LOGIN PADÃO DO SEU GIT</h3>
• Cadastrar seu usuário git<br> 
<code>git config --global user.name "usuario"</code><br>
• Cadastrar seu email no git<br>
<code>git config --global user.email "email@email.com"</code>

<h3>CONFIGURAÇÕES DO SEU GIT</h3>
• Comando para listar essas configurações<br>
<code>git config --list</code>

<h3>VERIFICAR SE HOUVE ALGUMA ALTERAÇÃO</h3>
• Comando para mostrar se algo foi alterado<br>
<code>git status</code>

<h3>MUDANDO DE BRANCH</h3>
• Comando para mudar a branch que irá subir suas alterações<br> 
<code>git checkout <'nome da branch'></code>

<h3>VERIFICANDO HISTÓRICO</h3>
• Comando para ser verificado<br> 
<code>git log</code><br> 
• De forma mais simplificada<br> 
<code>git log --oneline</code><br> 
• Trazer uma quantidade determinada de log<br> 
<code>git log -n 5</code><br> 
• Trazer por data<br> 
<code>git log --since=2020-10-01</code><br>
• Trazendo datas anteriores<br> 
<code>gti log --until=2020-10-01</code><br> 
• Filtrar log pelo autor<br> 
<code>git log --author=Nome_do_autor</code><br> 
• Filtrando por um nome especifico<br> 
<code>Filtrar log --grep="init"</code><br> 

<h3>VERIFICANDO ALTERAÇÕES QUE FORAM FEITAS</h3>
• Verificando quais alterações foram realizadas<br>
<code>git diff</code><br>

<h3>PRIMEIRO COMMIT</h3>
• Gravando as configurações do seu repositório<br>
<code>git init</code><br>
• Adicionando seus aquivos<br>
<code>git add .</code><br>
• Subindo seu arquivo editado<br>
<code>git commit -m "Algum comentário"</code><br>