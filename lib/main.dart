// Soyuz Bhattarai + Abiskar Oli
//11/21/2024 - ? Version 1.0
//Reflections App


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ReflectionsApp());
}

class ReflectionsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LaunchScreen(),
    );
  }
}

//Launch screen for the app. V.1.0
class LaunchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reflections - Launch"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreatePinScreen()),
            );
          },
          child: Text("NEW USER"),
        ),
      ),
    );
  }
}

class CreatePinScreen extends StatefulWidget {
  @override
  _CreatePinScreenState createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();

  Future<void> _saveUserInfo(String name, String pin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    await prefs.setString('userPin', pin);
  }

  void _onSubmit() async {
    String name = _nameController.text;
    String pin = _pinController.text;

    if (name.isEmpty || pin.length != 4 || int.tryParse(pin) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid name and a 4-digit PIN")),
      );
      return;
    }

    await _saveUserInfo(name, pin);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Pin"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Pin for:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "Enter your name",
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Enter 4-digit PIN:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _pinController,
              decoration: InputDecoration(
                hintText: "Enter PIN",
              ),
              maxLength: 4,
              keyboardType: TextInputType.number,
              obscureText: true,
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _onSubmit,
                child: Text("Save & Continue"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Stateful widget representing the home screen
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _clickCount = 0;

  void _incrementClickCount() {
    setState(() {
      _clickCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _incrementClickCount,
              child: Text("Click"),
            ),
            SizedBox(height: 20),
            Text(
              "Clicked $_clickCount times",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
