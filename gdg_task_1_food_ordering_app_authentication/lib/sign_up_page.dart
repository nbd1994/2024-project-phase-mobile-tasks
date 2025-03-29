import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gdg_task_1_food_ordering_app/home_screen.dart';
import 'package:gdg_task_1_food_ordering_app/sign_in_page.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({ super.key });

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey =  GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 107, 148, 238), const Color.fromARGB(255, 68, 183, 255)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
            )
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: SizedBox(
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Create New Account'),
                  Form(
                    key: _formKey,
                    child:SizedBox(
                      height: 370.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Full Name'),
                          TextFormField(
                            decoration: InputDecoration(
                              border:OutlineInputBorder(),
                              hintText: 'Enter Your Full Name'
                            ),
                            validator: (value){
                              return null;
                            },
                          ),
                          Text('Password'),
                          TextFormField(
                            decoration: InputDecoration(
                              border:OutlineInputBorder(),
                              hintText: 'Enter Your Password'
                            ),
                            validator: (value){
                              return null;
                            },
                          ),
                          Text('Email'),
                          TextFormField(
                            decoration: InputDecoration(
                              border:OutlineInputBorder(),
                              hintText: 'Enter Your Email'
                            ),
                            validator: (value){
                              return null;
                            },
                          ),
                          Text('Phone Number'),
                          TextFormField(
                            decoration: InputDecoration(
                              border:OutlineInputBorder(),
                              hintText: 'Enter Your Phone Number'
                            ),
                            validator: (value){
                              return null;
                            },
                          ),


                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(onPressed: (){
                            Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const HomeScreen()),
                                                  );
                                                }, child: Text("Sign Up")),
                          )
                        ],
                      ),
                    )
                  ),
                  Text('OR'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 30,child: Icon(Icons.facebook),),
                      Icon(Icons.facebook)
                    ],
                  ),
                  RichText(text:
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account?'
                      ),
                      TextSpan(
                        text: 'Sign in',
                        style: TextStyle(color: const Color.fromARGB(255, 4, 62, 109), fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()..onTap = (){
                        Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const SignInPage()),);
                        }

                      ),
                    ]
                  )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}