import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalprojects/screens/home/home_screen.dart';

class AuthenticationService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<String?> registerUser(String email, String password, String username) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user?.updateDisplayName(username);
      return null;
    } on FirebaseAuthException catch (e) {
      print(e);
      return e.code;
    }
  }

  static Future<String?> loginUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static String? get displayName => _auth.currentUser?.displayName;
  static String? get email => _auth.currentUser?.email;

  static Future<bool> updateCredentials({
    String? newEmail,
    String? newPassword,
    String? newDisplayName,
  }) async {
    final user = _auth.currentUser;
    if (user == null) return false; // null check

    try {
      if (newEmail != null && newEmail.isNotEmpty) {
        await user.verifyBeforeUpdateEmail(newEmail);
      }

      if (newPassword != null && newPassword.isNotEmpty) {
        await user.updatePassword(newPassword);
      }

      if (newDisplayName != null && newDisplayName.isNotEmpty) {
        await user.updateDisplayName(newDisplayName);
      }

      await user.reload();
      return true;
    } on FirebaseAuthException catch (e) {
      print("Error updating credentials: ${e.code}");
      return false;
    }
  }

  static Future<bool> reauthenticateWithDialog(BuildContext context) async {
    final user = _auth.currentUser;
    if (user == null || user.email == null) return false;

    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => ReauthenticateDialog(user: user),
    );

    return result == true;
  }

  Future<void> updateEmailWithConfirmation(BuildContext context, String newEmail) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      _showDialog(context, 'Error', 'No user is currently signed in.');
      return;
    }

    try {
      await user.verifyBeforeUpdateEmail(newEmail);

      _showDialog(
        context,
        'Verify Email',
        'A verification link has been sent to $newEmail. '
        'Please check your inbox and click the link to confirm the update.',
      );
    } on FirebaseAuthException catch (e) {
      _showDialog(context, 'Update Failed', e.message ?? 'An unknown error occurred.');
    }
  }

  void _showDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}

class ReauthenticateDialog extends StatefulWidget {
  final User user;

  const ReauthenticateDialog({required this.user, super.key});

  @override
  State<ReauthenticateDialog> createState() => _ReauthenticateDialogState();
}

class _ReauthenticateDialogState extends State<ReauthenticateDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  String? _authError;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Reauthenticate", style: TextStyle(color: primaryColor)),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Enter your password to continue.", style: TextStyle(color: Colors.black)),
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                errorText: _authError,
              ),
              validator: (value) =>
                  value == null || value.isEmpty ? "Password is required" : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              try {
                final cred = EmailAuthProvider.credential(
                  email: widget.user.email!,
                  password: _passwordController.text,
                );
                await widget.user.reauthenticateWithCredential(cred);
                Navigator.pop(context, true); // success
              } on FirebaseAuthException catch (e) {
                setState(() {
                  _authError = e.code;
                });
              }
            }
          },
          child: const Text("Continue", style: TextStyle(color: primaryColor)),
        ),
      ],
    );
  }
}
