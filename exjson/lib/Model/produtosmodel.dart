class Produto {
  //Atributos

  final String nome;
  final double valor;
  final String categoria;

  //Construtor

  Produto(
    {
    required this.nome, 
    required this.valor, 
    required this.categoria
    }
    );

  //Métodos(toJson & fromJson)

  Map<String, dynamic> toJson() =>
      {
      'nome': nome, 
      'valor': valor, 
      'catergoria': categoria};

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
    nome: json['nome'], 
    valor: json['valor'], 
    categoria: json['categoria']);
  }
}
