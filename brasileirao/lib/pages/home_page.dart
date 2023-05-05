import 'package:flutter/material.dart';

import 'package:brasileirao/pages/home_controller.dart';
import 'package:brasileirao/pages/time_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TimePage(
                        key: Key(tabela[i].nome),
                        time: tabela[i],
                      ),
                    ));
              },
            );
          },
          separatorBuilder: (BuildContext context, int i) => const Divider(),
          itemCount: controller.tabela.length),
    );
  }
}
