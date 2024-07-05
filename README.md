# JogoFeira2024
Jogo desenvolvido pelo PET Computação UFPR para a Feira de Cursos.

## Visão Geral
O Feirinho da Lâmpada (nome escolhido para o Jogo da Feira de Cursos de 2024) é um seletor de personalidade. O jogo, após um tempo "calculando", seleciona uma pessoa da área da computação aleatória, mostrando algumas informações sobre ela, incluindo nome, foto e algumas curiosidades.

O principal objetivo do jogo é ajudar na divulgação dos cursos de computação da UFPR. As curiosidades sobre os trabalhos de diversos importantes cientistas da computação ajuda a mostrar a importância da computação na sociedade, incluindo a relevância de mulheres na área, uma vez que o jogo é composto por diversas mulheres que tiveram um grande impacto na computação.

O projeto foi completamente desenvolvido em ambiente Linux, sendo desenvolvido um APK para ser usados em dispositivos Android.

## Como executar o projeto
### Instalando repositório
Assim como qualquer projeto do GitHub, o projeto pode ser baixado com o comando git clone:
```console
git clone git@github.com:PETComputacaoUFPR/JogoFeira2024.git
```

### Instalando Lua e LOVE2D
O projeto foi desenvolvido usando a linguagem de programação Lua e o framework LOVE2D. Para instalá-los em ambiente Linux, use os seguintes comandos:
```console
sudo apt install lua5.4
```
```console
sudo apt install love
```
Também é recomendado seguir as instruções no site oficial da Lua, em especial da sessão Building: https://www.lua.org/download.html.

### Executando a aplicação
Para iniciar o jogo, simplesmente entre no diretório do projeto (onde está o arquivo "main.lua") e execute o seguinte comando:
```console
love .
```

## Organização do Projeto
Os arquivos se dividem em algumas categorias:
- Auxiliares: arquivos que não são utilizados diretamente no jogo, mas servem de auxílio para fazer as aplicações: class.lua, mesh.lua, push.lua. Esses arquivos são interessantes de usar em praticamente qualquer projeto em LOVE2D;
- TADs: arquivos que definem a lógica dos tipos abstratos de dados, provavelmente não precisam ser editados: Button.lua, ProgressBar.lua, ImageObj.lua. Esses arquivos também são interessantes de usar em praticamente qualquer projeto em LOVE2D;
- Assets e Opções: arquivos que não são código e são utilizados para criar elementos importantes do projeto, como imagens e textos: fonts/, images/, options.lua, colors.lua, config.lua. A maioria é bem particular desse jogo.
- GitHub: arquivos que são comuns em projetos de GitHub: README, LICENSE;
- Principais: arquivos de código que de fato impactam no funcionamento do jogo: Calculating.lua, Initial.lua, main.lua, Result.lua. São os arquivos mais ligados a esse jogo em si, e definem quase toda a lógica do jogo.

## Como desenvolver mudanças
O projeto foi feito de forma a ser facilmente modificado para o interesse do desenvolvedor.

Novas personalidades podem ser facilmente adicionadas modificando a pasta "images/" e o arquivo "options.lua".

Se você quiser fazer um jogo com outra temática (ex: selecionar uma linguagem de programação aleatória) também é simples. As opções podem ser escolhidas modificando a pasta "images/" e o arquivo "options.lua", e quaisquer alterações nas telas (como títulos e fundo) podem ser alterados nos arquivos das suas respectivas telas.

