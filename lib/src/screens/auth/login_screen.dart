import 'package:flutter/material.dart';
import 'package:maxapp/src/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                const Icon(
                  Icons.message,
                  size: 150,
                ),

                // welcome back
                const Text("Welcome back!"),

                //Email texfield
                LoginTextField(
                  textEditingController: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                //Password textfield
                LoginTextField(
                  textEditingController: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
