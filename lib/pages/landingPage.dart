import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://res.cloudinary.com/dcxosct8v/image/upload/e_make_transparent:10/v1673375715/kisspng-chatbot-internet-bot-facebook-messenger-online-cha-chatbots-5b205826153731.7484316415288463740869_vzm9jz.jpg"),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 100),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 20, horizontal: 30)),
                overlayColor: MaterialStateProperty.all(Colors.orange),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              child: Text(
                'Talk to me',
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
              },
            ),
          ),
        ),
      ),
    );
  }
}
