import 'package:flutter/material.dart';
class CartPage extends StatelessWidget {
const CartPage({ super.key });

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
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset('assets/images/burger.png', width: 300, height: 300,),
              ),
            ),
            Container(
              height: 300.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15,6,10,6),
                          child: Text('4.8', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                        ),
                      ),
                      Text('\$22', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),),
                  ],),

                  Text('Beef Burger', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)),                  
                  Text('some random text about the description of the meal will be stated...'),
                  
                  Text('add ons', style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/burger.png', width: 60, height: 60),
                      Image.asset('assets/images/burger.png', width: 60, height: 60),
                      Image.asset('assets/images/burger.png', width: 60, height: 60),
                    ],
                  ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style: TextButton.styleFrom(backgroundColor:Colors.blue),
                        onPressed:(){}, child: Text('Add To Cart', style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white),)),
                    ),
                  ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}