import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: Scaffold(
        appBar: AppBar(title: const Text("StatefulWidget Example")),
        body: Center(
          child: Consumer<Model>(
            builder: (context, model, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(model.name, style: const TextStyle(fontSize: 25)),
                  const SizedBox(height: 20),
                  MaterialButton(
                    color: Colors.black,
                    textColor: Colors.white,
                    child: const Text("Change Name"),
                    onPressed: () {
                      model.changeName();
                      print(model.name);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class Model extends ChangeNotifier {
  String name = "mariam";

  changeName() {
    name = "mohamed";
    notifyListeners();
  }
}
