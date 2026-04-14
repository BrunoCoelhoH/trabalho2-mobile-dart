# Sistema de Biblioteca em Dart

**Estudante:** Bruno Coelho Hasse

---

## Descrição do Sistema

Sistema de gerenciamento de biblioteca desenvolvido em Dart, executado via terminal. Permite realizar operações completas de CRUD (Create, Read, Update, Delete) sobre um conjunto de livros, aplicando conceitos de Programação Orientada a Objetos.

---

## Classes Utilizadas

### `Livro`
Representa um livro da biblioteca.

| Atributo        | Tipo   | Descrição                     |
|-----------------|--------|-------------------------------|
| `id`            | int    | Identificador único gerado automaticamente |
| `titulo`        | String | Título do livro               |
| `autor`         | String | Nome do autor                 |
| `anoPublicacao` | int    | Ano de publicação             |
| `isbn`          | String | Código ISBN do livro          |

Possui um construtor nomeado com parâmetros obrigatórios e o método `toString()` sobrescrito para exibição formatada.

### `Biblioteca`
Gerencia a coleção de livros e contém os métodos do CRUD.

| Método            | Descrição                                      |
|-------------------|------------------------------------------------|
| `cadastrarLivro()`| Lê os dados do terminal e adiciona um livro    |
| `listarLivros()`  | Exibe todos os livros cadastrados              |
| `atualizarLivro()`| Permite editar os dados de um livro existente  |
| `removerLivro()`  | Remove um livro pelo ID                        |
| `_buscarPorId()`  | Método privado auxiliar para localizar um livro|

Utiliza uma `List<Livro>` para armazenar os objetos e um contador interno para geração automática de IDs.

---

## Como Executar

### Pré-requisitos

- [Dart SDK](https://dart.dev/get-dart) instalado.

### Passos

1. Clone o repositório:
   ```bash
   git clone https://github.com/BrunoCoelhoH/trabalho2-mobile-dart.git
   ```

2. Acesse a pasta do projeto:
   ```bash
   cd trabalho2-mobile-dart
   ```

3. Execute o programa:
   ```bash
   dart main.dart
   ```

---

## Exemplo de Uso

```
=============================
     SISTEMA DE BIBLIOTECA   
=============================
1 - Cadastrar livro
2 - Listar livros
3 - Atualizar livro
4 - Remover livro
5 - Sair
=============================
Escolha uma opção: 1

--- Cadastrar Livro ---
Título: O Senhor dos Anéis
Autor: J.R.R. Tolkien
Ano de publicação: 1954
ISBN: 978-8533613379

Livro cadastrado com sucesso! (ID: 1)

Escolha uma opção: 2

--- Lista de Livros ---

  ID:              1
  Título:          O Senhor dos Anéis
  Autor:           J.R.R. Tolkien
  Ano:             1954
  ISBN:            978-8533613379
```
