import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectorExample extends StatefulWidget {
  const SelectorExample({super.key});

  @override
  State<SelectorExample> createState() => _SelectorExample();
}

class _SelectorExample extends State<SelectorExample> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProveOne(),
      child: Scaffold(
        appBar: AppBar(title: const Text("StatefulWidget Example")),
        body: ListView(
          children: <Widget>[
            Selector<ProveOne, int>(
              selector: (context, provs1) => provs1.showOne,
              builder: (context, proveone, child) {
                print("Selector text1");
                return Text("${proveone}");
              },
            ),
            Selector<ProveOne, String>(
              selector: (context, provs1) => provs1.showTwo,
              builder: (context, proveone, child) {
                print("Selector text2");
                return Text(proveone);
              },
            ),
            Consumer<ProveOne>(
              builder: (context, proveone, child) {
                return MaterialButton(
                  onPressed: () {
                    proveone.changeName();
                  },
                  child: Text("click:" + "${proveone}"),
                );
              },
            ),
            Consumer<ProveOne>(
              builder: (context, proveone, child) {
                return MaterialButton(
                  onPressed: () {
                    proveone.changeName2();
                  },
                  child: Text("click2:" + proveone.name2),
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
  var name = 1;
  var name2 = "button2";

  get showOne => name;

  get showTwo => name2;

  changeName() {
    name++;
    notifyListeners();
  }

  changeName2() {
    name2 = "change2";
    notifyListeners();
  }
}
