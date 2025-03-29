import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({super.key});

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  bool isSwitched = false;
  bool? isChecked = false;

  MaterialColor _getBackgroundColor() {
    return isSwitched ? Colors.amber : Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Learn Flutter'),
        leading: IconButton(
            onPressed: Navigator.of(context).pop,
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('./images/image.png'),
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 3,
            ),
            Container(
              color: _getBackgroundColor(),
              margin: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Center(child: Text("Text Widget")),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text("Outlined Button"),
            ),
            TextButton(onPressed: () {}, child: Text("Text Button")),
            Switch(
                value: isSwitched,
                onChanged: (bool newVal) {
                  setState(() {
                    isSwitched = newVal;
                  });
                }),
            Checkbox(
                value: isChecked,
                onChanged: (bool? newVal) {
                  setState(() {
                    isChecked = newVal;
                  });
                }),
            Image.network(
                'https://images.wondershare.com/filmora/article-images/2022/04/learn-cartoon-sketch-drawing-03.jpeg'),
          ],
        ),
      ),
    );
  }
}
