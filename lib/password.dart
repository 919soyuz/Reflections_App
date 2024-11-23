import 'dart:io';
import 'package:path_provider/path_provider.dart';

// Get the path to the application's documents directory
Future<String> _getFilePath() async {
  final directory = await getApplicationDocumentsDirectory();
  return '${directory.path}/UserPass.txt';
}

// Save the username and PIN to the file
Future<void> saveUserInfo(String username, String pin) async {
  final filePath = await _getFilePath();
  final file = File(filePath);

  // Ensure file exists, create it if not
  if (!await file.exists()) {
    await file.create(recursive: true);
  }

  // Append new user info to the file
  await file.writeAsString('$username:$pin\n', mode: FileMode.append);
}

// Read all user info from the file
Future<List<String>> readUserInfo() async {
  try {
    final filePath = await _getFilePath();
    final file = File(filePath);

    // Read the file contents if it exists
    if (await file.exists()) {
      return await file.readAsLines();
    } else {
      return [];
    }
  } catch (e) {
    print("Error reading file: $e");
    return [];
  }
}
