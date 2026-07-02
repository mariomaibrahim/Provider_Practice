import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiProvidersExample extends StatelessWidget {
  const MultiProvidersExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyModel()),
        Provider(create: (_) => MyModel2()),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text("Multi Provider Example")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Provider 1
              Consumer<MyModel>(
                builder: (context, model, child) {
                  return Column(
                    children: [
                      Text(model.name, style: const TextStyle(fontSize: 25)),
                      ElevatedButton(
                        onPressed: () {
                          model.changeName();
                        },
                        child: const Text("Change Name 1"),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 30),

              // Provider 2
              Consumer<MyModel2>(
                builder: (context, model2, child) {
                  return Column(
                    children: [
                      Text(model2.name, style: const TextStyle(fontSize: 25)),
                      ElevatedButton(
                        onPressed: () {
                          model2.changeName2();
                        },
                        child: const Text("Change Name 2"),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyModel extends ChangeNotifier {
  String name = "Welcome";

  void changeName() {
    name = "Flutter";
    notifyListeners();
  }
}

class MyModel2 {
  String name = "Hi";

  void changeName2() {
    name = "Mariam";
  }
}
