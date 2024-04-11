import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ig_database/helper/fire_auth_helper.dart';
import 'package:ig_database/views/screens/Home_Page.dart';

class login_page extends StatelessWidget {
  login_page({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(15),
            Card(
              color: Colors.grey.shade200,
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Text(
                      "Login Page",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(15),
                    TextFormField(
                      controller: email,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter your email";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.email,
                        ),
                        labelText: "Enter your email..",
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Gap(15),
                    TextFormField(
                      controller: password,
                      validator: (val) {
                        if (val!.isEmpty) {
                          print('Enter your password');
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.password,
                        ),
                        labelText: "Enter your Password..",
                        hintText: "Passwords",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Gap(25),
                    ElevatedButton.icon(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          User? user = await AuthHelper.authHelper
                              .SignInWithEmailPassword(
                            email: email.text,
                            password: password.text,
                          );
                          if (user != null) {
                            Navigator.of(context).pushReplacementNamed(
                              'home_page',
                              arguments: user,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Not done!!!"),
                              ),
                            );
                          }
                        }
                      },
                      icon: Icon(Icons.login),
                      label: Text("Login"),
                    ),
                    Gap(30),
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        Text("Don't have an account?"),
                        SizedBox(
                          width: 15,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('Sign_up_Page');
                          },
                          child: Text("Register"),
                        ),
                      ],
                    ),
                    Gap(
                      50,
                    ),
                    Text(
                      "--------------------OR--------------------",
                    ),
                    Gap(
                      50,
                    ),
                    ElevatedButton.icon(
                      onPressed: () async {
                        FirebaseAuth firebaseauth = FirebaseAuth.instance;
                        GoogleSignIn googleSignIn = GoogleSignIn(
                          scopes: ['email'],
                        );

                        GoogleSignInAccount? account =
                            await googleSignIn.signIn();
                        GoogleSignInAuthentication authentication =
                            await account!.authentication;

                        firebaseauth
                            .signInWithCredential(
                              GoogleAuthProvider.credential(
                                idToken: authentication.idToken,
                                accessToken: authentication.accessToken,
                              ),
                            )
                            .then(
                              (value) => Navigator.pushReplacementNamed(
                                  context, 'home_page'),
                            );
                      },
                      icon: Icon(Icons.g_mobiledata),
                      label: Text("Login with google"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
