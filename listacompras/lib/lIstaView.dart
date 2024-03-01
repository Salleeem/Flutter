import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ListaControll.dart';
import 'ListaModel.dart';

class ComprasView extends StatefulWidget {
  @override
  _ComprasViewState createState() => _ComprasViewState();
}

class _ComprasViewState extends State<ComprasView> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Compras'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Item',
                ),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Insira o nome do item.';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _quantidadeController,
                decoration: const InputDecoration(
                  labelText: 'Quantidade',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Insira a quantidade.';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _precoController,
                decoration: const InputDecoration(
                  labelText: 'Preço',
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Insira o preço.';
                  }
                  if (double.tryParse(value) == null) {
                    return 'O preço precisa ser um número.';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _adicionarItem(context);
                }
              },
              child: const Text('Adicionar Item'),
            ),
            Expanded(
              child: Consumer<ComprasController>(
                builder: (context, model, child) {
                 

                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: model.itens.length,
                          itemBuilder: (context, index) {
                            final item = model.itens[index];
                            return ListTile(
                              title: Text(item.nome),
                              subtitle: Text(
                                'Quantidade: ${item.quantidade}, Preço: R\$${item.preco}'
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                    value: item.concluido,
                                    onChanged: (value) {
                                      model.marcarItemComoConcluido(
                                        index,
                                        value!,
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.edit_outlined),
                                    onPressed: () {
                                      _editarItem(context, model, index);
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      _removerItem(context, model, index);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                     
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  

  // Adicionar item à lista
  void _adicionarItem(BuildContext context) {
    final nome = _nomeController.text.trim();
    final quantidade = int.tryParse(_quantidadeController.text) ?? 0;
    final preco = double.tryParse(_precoController.text) ?? 0.0;

    final controller = Provider.of<ComprasController>(context, listen: false);

    controller.adicionarItem(nome, quantidade, preco);

    _nomeController.clear();
    _quantidadeController.clear();
    _precoController.clear();
  }

  // Editar item na lista
  void _editarItem(BuildContext context, ComprasController model, int index) {
    final TextEditingController _nomeEditController =
        TextEditingController(text: model.itens[index].nome.trim());
    final TextEditingController _quantidadeEditController =
        TextEditingController(text: model.itens[index].quantidade.toString());
    final TextEditingController _precoEditController =
        TextEditingController(text: model.itens[index].preco.toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nomeEditController,
                decoration: const InputDecoration(hintText: 'Nome do item'),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _quantidadeEditController,
                decoration: const InputDecoration(hintText: 'Quantidade'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _precoEditController,
                decoration: const InputDecoration(hintText: 'Preço'),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 8),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                final novoNome = _nomeEditController.text.trim();
                final novaQuantidade =
                    int.tryParse(_quantidadeEditController.text) ?? 0;
                final novoPreco =
                    double.tryParse(_precoEditController.text) ?? 0.0;

                if (novoNome.isNotEmpty &&
                    novaQuantidade > 0 &&
                    novoPreco > 0) {
                  model.editarItem(index, novoNome, novaQuantidade, novoPreco);
                  Navigator.of(context).pop();
                } else {
                  print(
                      "Os campos devem ser preenchidos corretamente.");
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  // Remover item da lista
  void _removerItem(BuildContext context, ComprasController model, int index) {
    model.removerItem(index);
  }
}
