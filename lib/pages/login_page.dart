import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:legalai/components/my_button.dart';
import 'package:legalai/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {

    // show loading circle
    showDialog(context: context, builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);

      // pop the loading circle
      Navigator.pop(context);

    } on FirebaseAuthException catch(e) {
      // pop the loading circle
      Navigator.pop(context);

      // Wrong Email 
      if(e.code == 'INVALID_LOGIN_CREDENTIALS') {
        // show error to user 
        wrongLoginMessage();
      } 
    }
  }

  // wrong email message popup
  void wrongLoginMessage() {
    showDialog(context: context, builder: (context) {
      return const AlertDialog(
        title: Text('Invalid Login Credentials'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[300],
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_page.png"),
            fit: BoxFit.cover
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // logo
                  const Text("Legal.ai", style: TextStyle(color: Colors.white, fontWeight:FontWeight.w900, fontSize: 32),),
                  const Text("Your personalized legal solution", style: TextStyle(color: Colors.white, fontSize: 16,),),
                  const SizedBox(
                    height: 50,
                  ),
            
                  // welcome back, you've been missed
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      //padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.symmetric(horizontal: 27.0),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
            
                  // email textfield
                  MyTextField(
                    controller: emailController,
                    hintText: 'Username',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
            
                  // passsword textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),
            
                  // sign in button
                  MyButton(onTap: signUserIn, text: "Login",),
                  const SizedBox(height: 25),
            
                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("New User?",
                        style: TextStyle(color: Colors.white, fontSize: 16,),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                          child: const Text('Register now',
                          style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w900, fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
