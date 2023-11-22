import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/common/common_widget.dart';
import 'package:flutter_project/screens/homescreen.dart';
import 'package:flutter_project/screens/signUp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Log In",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF0F2A45),
          Color(0xFF243C44),
          Color(0xFF527638),
          Color(0xFF668E35)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 120,
                ),
                customTextField(
                    width: width,
                    controller: _emailTextController,
                    label: 'Email id',
                    hintText: 'Enter email id',
                    color: Colors.white),
                const SizedBox(
                  height: 20,
                ),
                customTextField(
                    width: width,
                    controller: _passwordTextController,
                    label: 'Password',
                    hintText: 'Enter password',
                    color: Colors.white),
                const SizedBox(
                  height: 25,
                ),
                //forgetPassword(context),
                customButton(() {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    if(value==null){
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  }).onError((error, stackTrace) {
                    
                    print("Error ${error.toString()}");
                  });
                }, width, height * 0.07, 'Log In'),
                const SizedBox(
                  height: 15,
                ),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUp()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
