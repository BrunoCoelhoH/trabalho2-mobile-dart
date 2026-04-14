import 'dart:io';

class Livro {
  int id;
  String titulo;
  String autor;
  int anoPublicacao;
  String isbn;

  Livro({
    required this.id,
    required this.titulo,
    required this.autor,
    required this.anoPublicacao,
    required this.isbn,
  });

  @override
  String toString() {
    return '''
  ID:              $id
  Título:          $titulo
  Autor:           $autor
  Ano:             $anoPublicacao
  ISBN:            $isbn
''';
  }
}

class Biblioteca {
  List<Livro> _livros = [];
  int _proximoId = 1;

  void cadastrarLivro() {
    print('\n--- Cadastrar Livro ---');

    stdout.write('Título: ');
    String titulo = stdin.readLineSync() ?? '';

    stdout.write('Autor: ');
    String autor = stdin.readLineSync() ?? '';

    stdout.write('Ano de publicação: ');
    int ano = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

    stdout.write('ISBN: ');
    String isbn = stdin.readLineSync() ?? '';

    Livro novoLivro = Livro(
      id: _proximoId++,
      titulo: titulo,
      autor: autor,
      anoPublicacao: ano,
      isbn: isbn,
    );

    _livros.add(novoLivro);
    print('\nLivro cadastrado com sucesso! (ID: ${novoLivro.id})');
  }

  void listarLivros() {
    print('\n--- Lista de Livros ---');

    if (_livros.isEmpty) {
      print('Nenhum livro cadastrado.');
      return;
    }

    for (Livro livro in _livros) {
      print(livro);
    }
  }

  void atualizarLivro() {
    print('\n--- Atualizar Livro ---');

    if (_livros.isEmpty) {
      print('Nenhum livro cadastrado.');
      return;
    }

    listarLivros();

    stdout.write('Digite o ID do livro que deseja atualizar: ');
    int id = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

    Livro? livro = _buscarPorId(id);

    if (livro == null) {
      print('Livro com ID $id não encontrado.');
      return;
    }

    print('Deixe em branco para manter o valor atual.');

    stdout.write('Novo título (${livro.titulo}): ');
    String novoTitulo = stdin.readLineSync() ?? '';
    if (novoTitulo.isNotEmpty) livro.titulo = novoTitulo;

    stdout.write('Novo autor (${livro.autor}): ');
    String novoAutor = stdin.readLineSync() ?? '';
    if (novoAutor.isNotEmpty) livro.autor = novoAutor;

    stdout.write('Novo ano (${livro.anoPublicacao}): ');
    String novoAnoStr = stdin.readLineSync() ?? '';
    if (novoAnoStr.isNotEmpty) {
      int? novoAno = int.tryParse(novoAnoStr);
      if (novoAno != null) livro.anoPublicacao = novoAno;
    }

    stdout.write('Novo ISBN (${livro.isbn}): ');
    String novoIsbn = stdin.readLineSync() ?? '';
    if (novoIsbn.isNotEmpty) livro.isbn = novoIsbn;

    print('\nLivro atualizado com sucesso!');
  }

  void removerLivro() {
    print('\n--- Remover Livro ---');

    if (_livros.isEmpty) {
      print('Nenhum livro cadastrado.');
      return;
    }

    listarLivros();

    stdout.write('Digite o ID do livro que deseja remover: ');
    int id = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

    Livro? livro = _buscarPorId(id);

    if (livro == null) {
      print('Livro com ID $id não encontrado.');
      return;
    }

    _livros.remove(livro);
    print('\nLivro "${livro.titulo}" removido com sucesso!');
  }

  Livro? _buscarPorId(int id) {
    try {
      return _livros.firstWhere((livro) => livro.id == id);
    } catch (e) {
      return null;
    }
  }
}

void exibirMenu() {
  print('''
=============================
     SISTEMA DE BIBLIOTECA   
=============================
1 - Cadastrar livro
2 - Listar livros
3 - Atualizar livro
4 - Remover livro
5 - Sair
=============================''');
  stdout.write('Escolha uma opção: ');
}

void main() {
  Biblioteca biblioteca = Biblioteca();

  while (true) {
    exibirMenu();
    String opcao = stdin.readLineSync() ?? '';

    switch (opcao) {
      case '1':
        biblioteca.cadastrarLivro();
        break;
      case '2':
        biblioteca.listarLivros();
        break;
      case '3':
        biblioteca.atualizarLivro();
        break;
      case '4':
        biblioteca.removerLivro();
        break;
      case '5':
        print('\nEncerrando o sistema. Até logo!');
        exit(0);
      default:
        print('\nOpção inválida. Tente novamente.');
    }
  }
}
