import 'package:flutter/material.dart';
import 'package:gdg_task_1_food_ordering_app/services/auth_service.dart';
class ProfilePage extends StatelessWidget {
const ProfilePage({ super.key });

  @override
  Widget build(BuildContext context){
    return Container(
      child: Center(
        child: FilledButton(onPressed: () async{
          await AuthService().signout(context: context);
        }, child: Text("Sign Out"))
      ),
    );
  }
}