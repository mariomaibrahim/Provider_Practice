import 'package:flutter/material.dart';
import 'package:provider_app/changeNotifierProvider.dart';
import 'package:provider_app/mulitProviders_example.dart';
import 'package:provider_app/provider.of(context).dart';

void main() {
  runApp(const ProviderApp());
}

class ProviderApp extends StatefulWidget {
  const ProviderApp({super.key});

  @override
  State<ProviderApp> createState() => _ProviderAppState();
}

class _ProviderAppState extends State<ProviderApp> {
  String name = "welcome";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvidersExample(),
    );
  }
}
