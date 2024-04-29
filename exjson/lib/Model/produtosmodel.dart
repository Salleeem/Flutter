class Produto {
  final String nome;
  final double valor;
  final String categoria;

  Produto({
    required this.nome,
    required this.valor,
    required this.categoria,
  });

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'valor': valor,
        'categoria': categoria,
      };

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      nome: json['nome'],
      valor: json['valor'],
      categoria: json['categoria'],
    );
  }
}
