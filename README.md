# InMovie
Este projeto tem por finalidade o desenvolvimento de um aplicativo para iOS que mostrará os próximos filmes a serem estreados, assim como informações sobre cada filme.

# Detalhes

 - O padrão arquitetural utilizado é MVVM-C (Model-View-View-Model e Coordinators), tal padrão permite uma boa Separação de Conceitos (em inglês, Separation of Concerns), e evita a criação de "Massive View Controllers" como no padrão MVC.
 - Coordinators são utilizados com a finalidade de permitir a navegação entre a aplicação, sem a necessidade de que a própria View tenha conhecimento de em qual ponto da aplicação ela está. Este padrão pode ser aplicado de diversas maneiras, porém o método usado está em conformidade com a do livro RxSwift 2nd Edition.
 - A aplicação possui carregamento "infinito", ou seja, à medida que o usuário navega fazendo uso do scroll, novos resultados são obtidos da API (caso haja resultados para serem obtidos).
 - À medida que o usuário navega pelos detalhes de cada filme, os filmes são salvos no banco de dados Realm e posteriormente poderão ser acessados caso o usuário fique offline.
 - Há uso de Dependency Injection em diversos pontos do código.
 - Os conceitos de programação reativa e funcional estão sendo aplicados por meio das bibliotecas da ReactiveX e comunidade (RxSwift, RxCocoa, RxDataSources...). 

# Instalação
Para realizar a instação deste projeto, siga as seguintes etapas:

 1. Clone este repositório usando o Xcode (versão 9+) ou utilizando o comando: `git clone https://github.com/thealexandrelara/InMovie.git`
 2. Abra o arquivo InMovie.xcworkspace
 3. Selecione o dispositivo em que se deseja executar o aplicativo.
 4. Compile e execute o aplicativo.

# Bibliotecas utilizadas
As bibliotecas utilizadas e as explicações do que fazem:

 - RxSwift, RxCocoa, RxDataSources, Action: São bibliotecas que realizam a "mágica" por trás da programação reativa trabalhando em cima de sequências de dados.
 - Kingfisher: Utilizada para facilitar o download e armazenamento de imagens, por meio da criação de um cache na memória do dispositivo.
 - Moya, Moya/RxSwift, Moya-ObjectMapper/RxSwift: Utilizado para auxiliar na criação e manutenção da camada de rede da aplicação tornando mais fácil a escrita, leitura e manutenção do código.
 - ObjectMapper/ObjectMapper+Real: Facilita a conversão de JSON em objetos que possam ser usados no app.
 - RealmSwift: Banco de dados orientado a objetos para a persistência dos dados.
 - SnapKit: Uma biblioteca que facilita a utilização de AutoLayout na linguagem Swift.

# Considerações
É necessário algumas considerações sobre este projeto:

 - O código está escrito em inglês.
 - O design foi pensado de forma a ser bem básico, porém útil e funcional. 
 - Não faço uso de storyboards, todo o app é feito programaticamente.
 - Claramente há espaço para melhorias, porém os requisitos e algumas das melhorias sugeridas foram implantadas e de forma a respeitar o prazo definido no email, tais melhorias poderiam ser aplicadas futuramente.
 - Nem todos os filmes possuem sinopse, nesse caso a sinopse não aparece.
