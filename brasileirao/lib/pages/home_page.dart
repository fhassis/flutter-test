import 'package:flutter/material.dart';

import 'package:brasileirao/pages/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brasileirão'),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int i) {
            final tabela = controller.tabela;
            return ListTile(
              leading: Image.network(tabela[i].brasao),
              title: Text(tabela[i].nome),
              trailing: Text(
                tabela[i].pontos.toString(),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int i) => const Divider(),
          itemCount: controller.tabela.length),
    );
  }
}
