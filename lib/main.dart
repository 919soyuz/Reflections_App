import 'package:flutter/material.dart';

void main() {
  runApp(const ReflectionsApp());
}

class ReflectionsApp extends StatelessWidget {
  const ReflectionsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LaunchScreen(),
    );
  }
}

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reflections Launching"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreatePinScreen()),
            );
          },
          child: const Text("NEW User"),
        ),
      ),
    );
  }
}

class CreatePinScreen extends StatelessWidget {
  const CreatePinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Pin"),
      ),
      body: const Center(
        child: Text("Pin Creation Screen"),
      ),
    );
  }
}
