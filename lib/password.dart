import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> _getFilePath() async {
  final directory = await getApplicationDocumentsDirectory();
  return '${directory.path}/UserPass.txt';
}

// Save the username and PIN to the txt file
Future<void> saveUserInfo(String username, String pin) async {
  try {
    final filePath = await _getFilePath();
    final file = File(filePath);

    // call file
    if (!await file.exists()) {
      await file.create(recursive: true);
    }

    // addition of new user info to the file
    await file.writeAsString('$username:$pin\n', mode: FileMode.append, flush: true);

    print("User info saved: $username:$pin");
  } catch (e) {
    print("Error saving user info: $e");
  }
}

// Read all user info from the file
Future<List<String>> readUserInfo() async {
  try {
    final filePath = await _getFilePath();
    final file = File(filePath);

    // Read the file if it exists
    if (await file.exists()) {
      List<String> lines = await file.readAsLines();
      print("User info read from file: $lines");
      return lines;
    } else {
      print("File does not exist.");
      return [];
    }
  } catch (e) {
    print("Error reading file: $e");
    return [];
  }
}
