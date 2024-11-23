// Soyuz Bhattarai + Abiskar Oli
//11/21/2024 - ? Version 1.0
//Reflections App


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'password.dart';


void main() {
  runApp(const ReflectionsApp());
}

class ReflectionsApp extends StatelessWidget {
  const ReflectionsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LaunchScreen(),
    );
  }
}

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reflections - Launch"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreatePinScreen()),
                );
              },
              child: const Text("NEW USER"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen(welcomeBack: true)),
                );
              },
              child: const Text("EXISTING USER"),
            ),
          ],
        ),
      ),
    );
  }
}

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({Key? key}) : super(key: key);

  @override
  CreatePinScreenState createState() => CreatePinScreenState();
}

class CreatePinScreenState extends State<CreatePinScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();

  void _onSubmit() async {
    String name = _nameController.text;
    String pin = _pinController.text;

    if (name.isEmpty || pin.length != 4 || int.tryParse(pin) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid name and a 4-digit PIN")),
      );
      return;
    }

    // Save user info
    await saveUserInfo(name, pin);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen(welcomeBack: false)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Pin"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: "Enter your name"),
            ),
            TextField(
              controller: _pinController,
              maxLength: 4,
              obscureText: true,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "Enter 4-digit PIN"),
            ),
            ElevatedButton(
              onPressed: _onSubmit,
              child: const Text("Save & Continue"),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final bool welcomeBack;

  const HomeScreen({Key? key, required this.welcomeBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: Center(
        child: Text(welcomeBack ? "Welcome back!" : "Welcome!"),
      ),
    );
  }
}
