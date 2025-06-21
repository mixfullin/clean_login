import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image(image: AssetImage("assets/mock-login-image.png")),
          TextFormField(),
          TextFormField(),
          ElevatedButton(
            onPressed: () {
              // Todo
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
