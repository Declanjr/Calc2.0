import 'package:calculator_app/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (passwordController.text != confirmPasswordController.text) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Passwords do not match!'),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }

        try {
          UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Signup Successful! Welcome, ${userCredential.user!.email}!'),
              backgroundColor: Colors.green,
            ),
          );
        } on FirebaseAuthException catch (e) {
          String message;
          if (e.code == 'email-already-in-use') {
            message = 'The account already exists for that email.';
          } else if (e.code == 'weak-password') {
            message = 'The password provided is too weak.';
          } else {
            message = 'Signup failed. Please try again.';
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: 55,
        decoration: BoxDecoration(
          color: GlobalColors.mainColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: const Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
