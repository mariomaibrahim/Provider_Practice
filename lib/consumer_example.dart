import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConsumerExample extends StatefulWidget {
  const ConsumerExample({super.key});

  @override
  State<ConsumerExample> createState() => _ConsumerExample();
}

class _ConsumerExample extends State<ConsumerExample> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProveOne(),
      child: Scaffold(
        appBar: AppBar(title: const Text("StatefulWidget Example")),
        body: ListView(
          children: <Widget>[
            Consumer<ProveOne>(
              builder: (context, proveone, child) {
                print("text");
                return Text(proveone.name);
              },
            ),
            Consumer<ProveOne>(
              builder: (context, proveone, child) {
                print("name2");
                return Text(proveone.name);
              },
            ),
            Consumer<ProveOne>(
              builder: (context, proveone, child) {
                return MaterialButton(
                  onPressed: () {
                    print("button");
                    proveone.changeName();
                  },
                  child: Text("click:" + proveone.name),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProveOne extends ChangeNotifier {
  String name = "button";
  String name2 = "button2";

  changeName() {
    name = "change";
    notifyListeners();
  }
}
