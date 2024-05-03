class Filmes {
  final String nome;
  final String genero;
  final String sinopse;
  final int ano;
  final int duracao;
  final String classificacao;
  final List<String> elenco;
  final String imagem;

  Filmes({
    required this.nome,
    required this.genero,
    required this.sinopse,
    required this.ano,
    required this.duracao,
    required this.classificacao,
    required this.elenco,
    required this.imagem,
  });

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'genero': genero,
      'sinopse': sinopse,
      'ano': ano,
      'duracao': duracao,
      'classificacao': classificacao,
      'elenco': elenco,
      'imagem': imagem,
    };
  }

  factory Filmes.fromJson(Map<String, dynamic> json) {
    return Filmes(
      nome: json['nome'],
      genero: json['genero'],
      sinopse: json['sinopse'],
      ano: json['ano'],
      duracao: json['duracao'],
      classificacao: json['classificacao'],
      elenco: List<String>.from(json['elenco']),
      imagem: json['imagem'],
    );
  }
}
