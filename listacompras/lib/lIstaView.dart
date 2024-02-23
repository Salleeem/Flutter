import 'package:flutter/material.dart';
import 'package:listacompras/ListaControll.dart';
import 'package:provider/provider.dart';

class ListaComprasScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Novo Item',
                suffixIcon: IconButton(
                  onPressed: () {
                    Provider.of<ListaComprasController>(context, listen: false)
                        .adicionarCompra(_controller.text);
                    _controller.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<ListaComprasController>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.compras.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(model.compras[index].nome),
                      trailing: Checkbox(
                        value: model.compras[index].comprado,
                        onChanged: (value) {
                          model.marcarComoComprado(index);
                        },
                      ),
                      onLongPress: () {
                        model.removerCompra(index);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
