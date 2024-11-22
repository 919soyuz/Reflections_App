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
      theme: ThemeData(
        useMaterial3: true, // Enables Material 3 design system
      ),
      home: const LaunchScreen(),
    );
  }
}

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reflections Launching"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displaySmall, // Updated style
            ),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add),
            ),
          ],
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
