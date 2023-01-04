import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rafiki_bot/models/responseModel.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _questionController = TextEditingController();
  String _answer = '';
  List<NewMessage> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 70, bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                  child: Align(
                    alignment: (messages[index].messageType == "question"?Alignment.topLeft:Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (messages[index].messageType == "question"?Colors.grey[200]:Colors.blue[200]),
                      ),
                      padding: EdgeInsets.all(15),
                      child: Text(messages[index].messageContent,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  )
                );
              }
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 15.0,
                    offset: Offset(
                      5.0,
                      5.0,
                    )
                  )
                ]
              ),
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: _questionController,
                        decoration: InputDecoration(
                          hintText: "Tell me anything..",
                          border: InputBorder.none
                        ),
                    )
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: () async {
                      // Make a request to the API endpointR
                      NewMessage question = NewMessage(messageContent: (_questionController.text), messageType: "question");
                      messages.add(question);
                      var response = await http.post(
                          'https://api.openai.com/v1/completions',
                          headers: {
                            'Content-Type': 'application/json',
                            'Authorization': 'Bearer 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',
                            'max_tokens': '7'
                          },
                          body: json.encode({
                            'prompt': _questionController.text,
                            'model': "text-davinci-003"
                          })
                      );

                      // Parse the JSON response
                      var responseJson = json.decode(response.body);
                      var answer = responseJson['choices'][0]['text'];

                      // Update the UI with the answer
                      setState(() {
                        _answer = answer;
                        NewMessage response = NewMessage(messageContent: _answer, messageType: "response");
                        messages.add(response);
                      });
                    },
                    child: Icon(Icons.send),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}