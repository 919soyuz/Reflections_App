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

  // Format the string to include username and PIN in the desired format
  String formattedData = 'Username: $username\n$username\'s Password: $pin\n';

  // Append the formatted string to the file
  await file.writeAsString(formattedData, mode: FileMode.append, flush: true);

  print("User info saved:\n$formattedData");
}

// Read all user info from the file
Future<List<String>> readUserInfo() async {
  try {
    final filePath = await _getFilePath();
    final file = File(filePath);

    // Read the file contents if it exists
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
