import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gdg_task_1_food_ordering_app/home_screen.dart';
import 'package:gdg_task_1_food_ordering_app/services/auth_service.dart';
import 'package:gdg_task_1_food_ordering_app/sign_up_page.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({ super.key });

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Welcome'),
                  Form(
                    key: _formKey,
                    child:SizedBox(
                      height: 225.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Email'),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              border:OutlineInputBorder(),
                              hintText: 'Enter Your Email'
                            ),
                            validator: (value){
                              return null;
                            },
                          ),
                          Text('Password'),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              border:OutlineInputBorder(),
                              hintText: 'Enter Your Password'
                            ),
                            validator: (value){
                              return null;
                            },
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: () async{
                            await AuthService().signin(email: _emailController.text, password: _passwordController.text);
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> const HomeScreen()));}
                               ,child: Text("Sign In")),
                          )
                        ],
                      ),
                    )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('forgot password?', textAlign: TextAlign.right,),
                    ],
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
                        text: 'Don\'t have an account? '
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(color: const Color.fromARGB(255, 1, 98, 177), fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()..onTap = (){
                        Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const SignUpPage()),);
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