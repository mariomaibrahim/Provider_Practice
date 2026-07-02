import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/changeNotifierProvider.dart';

class ProviderOf extends StatefulWidget {
  const ProviderOf({super.key});

  @override
  State<ProviderOf> createState() => _ProviderOf();
}

class _ProviderOf extends State<ProviderOf> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: Scaffold(
        appBar: AppBar(title: const Text("StatefulWidget Example")),
        body: WidgetChild(),
      ),
    );
  }
}

class WidgetChild extends StatefulWidget {
  const WidgetChild({super.key});

  @override
  State<WidgetChild> createState() => _WidgetChildState();
}

class _WidgetChildState extends State<WidgetChild> {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Model>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(model.name, style: const TextStyle(fontSize: 25)),
          const SizedBox(height: 20),
          MaterialButton(
            color: Colors.black,
            textColor: Colors.white,
            child: Text("Click"),
            onPressed: () {
              model.changeName();
              print(model.name);
            },
          ),
        ],
      ),
    );
  }
}

class Model extends ChangeNotifier {
  String name = "button";
  String name2 = "button2";

  changeName() {
    name = "change";
    notifyListeners();
  }
}
