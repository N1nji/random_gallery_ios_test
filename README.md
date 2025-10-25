# Galeria Aleatória

Um aplicativo simples e elegante que exibe imagens aleatórias da API **Picsum Photos**, desenvolvido como parte de um desafio técnico para a vaga de **Desenvolvedor iOS Júnior**.

Apesar de o desafio original sugerir o uso de Swift e Xcode, o projeto foi implementado em **Flutter** devido ao ambiente de desenvolvimento atual (Windows).  
A escolha do Flutter permitiu aplicar **boas práticas de arquitetura, performance e experiência do usuário**, mantendo todos os requisitos funcionais solicitados.

## 🎬 Demonstração

![App Demo](assets/demo.gif)

____

##  Funcionalidades

✅ Exibição das imagens em **grade responsiva (2 colunas)**  
✅ Atualização com **Pull-to-Refresh**  
✅ Abertura da imagem em **modo tela cheia (zoom e swipe)**  
✅ Exibição do **autor da imagem**  
✅ Animações sutis e suaves (**Hero transition** + **fade loading**)  
✅ **Tema claro/escuro** automático conforme o sistema  
✅ **Skeleton loading (Shimmer)** durante carregamento  
✅ Layout adaptável para diferentes tamanhos de tela  

____

## 🧩 Arquitetura e Organização

O projeto segue uma estrutura modular inspirada no padrão **MVVM**, separando responsabilidades em camadas claras:

lib/

├── models/ # Estruturas de dados (ImageItem)  
├── viewmodels/ # Lógica de estado e comunicação com API (GalleryViewModel)  
├── views/ # Telas principais (GalleryPage, ImageDetailPage)  
├── widgets/ # Componentes reutilizáveis (ShimmerGridItem)  
└── main.dart # Inicialização do app e providers  


____

##  Tecnologias e pacotes usados

- **Flutter 3.x**
- **Provider** → gerenciamento de estado  
- **CachedNetworkImage** → cache de imagens e placeholders  
- **PhotoView** → visualização em tela cheia com zoom  
- **Shimmer** → skeleton loading moderno  
- **Material 3** → tema dinâmico com suporte a dark/light mode  

____

##  Experiência do Usuário

O app foi desenvolvido com foco em uma **experiência fluida e agradável**, garantindo:
- **Rolagem suave e natural** (BouncingScrollPhysics)  
- **Transições visuais suaves e consistentes**  
- **Carregamento visual elegante (Shimmer)**  
- **Adaptabilidade total** a telas pequenas e grandes  

____

##  Como rodar o projeto?

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/galeria-aleatoria.git

2. Entre na pasta:
    ```bash
    cd galeria_aleatoria

3. Instale as dependências:
    ```bash
    flutter pub get

4. Rode o app:
    ```bash
    flutter run
____

## Decisão técnica

Por estar em um ambiente Windows, não foi possível executar o Xcode ou Swift nativamente.
Por isso, optei por implementar em Flutter, garantindo a entrega funcional e aplicando os mesmos princípios de arquitetura e boas práticas que seriam usados em Swift.

Essa abordagem permitiu manter o foco na lógica, experiência do usuário e estrutura de código, que são os principais pontos avaliados no desafio.

____

## 📋 Lista de tarefas

✅ Criar estrutura base do projeto Flutter  
✅ Integrar com API Picsum Photos  
✅ Implementar exibição em grade  
✅ Implementar pull-to-refresh  
✅ Criar visualização em tela cheia (zoom e swipe)  
✅ Adicionar autor da imagem  
✅ Implementar animações Hero  
✅ Adicionar shimmer loading  
✅ Implementar tema claro/escuro  
✅ Corrigir contraste no modo claro  
✅ Criar transição customizada entre telas (fade + slide) (extra)  
✅ Gravar GIF de demonstração (extra)  
✅ Revisão do README final e documentação das decisões técnicas  
____

## Autor

Pedro Felipe (N1nji)

💼 Meu site: https://portfolio-n1nji.vercel.app



## Resultado Final

Um app rápido, responsivo e com visual moderno, desenvolvido com carinho e atenção aos detalhes.