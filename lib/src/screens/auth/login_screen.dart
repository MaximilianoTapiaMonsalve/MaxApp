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
        backgroundColor: Colors.black.withAlpha(223),
        foregroundColor: Colors.white,
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

                const SizedBox(height: 10),

                // welcome back
                const Text("Welcome back!"),

                const SizedBox(height: 15),

                //Email texfield
                LoginTextField(
                  textEditingController: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 20),

                //Password textfield
                LoginTextField(
                  textEditingController: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 40),

                //Login Button
                LoginButton(
                  text: 'Log in',
                  onPressed: () {
                    //log in
                  },
                ),
                const SizedBox(height: 40),
                //Register
                Row(
                  children: [
                    const Text("Not registered? "),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Register now",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
