import 'package:cloud_firestore/cloud_firestore.dart';

class ApiService {
  // Function to save name to Firestore
  static Future<void> saveNameToFirestore(String name) async {
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'name': name,
        // You can add more fields if needed
      });
      print('Name saved to Firestore');
    } catch (error) {
      print('Failed to save name: $error');
      // Handle error
    }
  }

  // You can add more API-related methods here
}
