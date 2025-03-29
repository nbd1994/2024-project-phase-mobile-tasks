import 'package:flutter/material.dart';
import 'package:gdg_task_1_food_ordering_app/sign_up_page.dart';
class LandingPage extends StatelessWidget {
const LandingPage({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color.fromARGB(255, 33, 100, 243), const Color.fromARGB(255, 68, 183, 255)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                  )
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(child: Image.asset('assets/images/plate_of_food.jpg', width: 350, height: 350, fit: BoxFit.cover,)),
                      SizedBox(height: 20.0,),
                      Text('Enjoy Your food', style: TextStyle(color: Colors.white,fontSize: 24.0, fontWeight: FontWeight.bold),),
                      SizedBox(height: 20.0,),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 35)
                        ),
                        onPressed: (){
                        Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const SignUpPage()),
                      );
                    }, child: Text('Get Started', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold, color: Colors.black),)),
              ]
                  ),
                ),
              ),
      ),
    );
  }
}