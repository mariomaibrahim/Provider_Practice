import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider.of(context).dart';

class WidgetChild extends StatefulWidget {
  const WidgetChild({super.key});

  @override
  State<WidgetChild> createState() => _WidgetChildState();
}

class _WidgetChildState extends State<WidgetChild> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${context.watch<Model>().name}"),
          const SizedBox(height: 20),
          MaterialButton(
            color: Colors.black,
            textColor: Colors.white,

            onPressed: () {
              context.read<Model>().changeName();
            },
            child: Text("click"),
          ),
        ],
      ),
    );
  }
}
