import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tagumpai/constants/global_variables.dart';
import 'package:tagumpai/models/chat_message.dart';
import 'package:tagumpai/models/syllabus.dart';
import 'package:tagumpai/services/api.dart';
import 'package:tagumpai/widgets/form_widget.dart';
import 'package:tagumpai/widgets/text_widget.dart';

import '../../widgets/chat_message.dart';

class ChatScreen extends StatefulWidget {
  static String route = "chatScreen";

  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _chatController = TextEditingController();
  final List<ChatMessageWidget> _messages = [];
  String message = "";

  List<String> botAnswer = [
    "How have you adapted to changes in the Technology industry?",
    "What challenges have you faced in your previous roles and how did you overcome them?",
  ];

  List<String> userAnswer = [
    "I try to adapt by always keeping track of the latest trends and innovations",
    "I usually have a trouble at communication but with the help of my teammates, I managed to overcome it",
  ];

  void _sendMessage() {
    ChatMessageWidget _message = ChatMessageWidget(
      chatMessage: ChatMessage(
        text: _chatController.text,
        sender: "user",
      ),
    );

    setState(() {
      _messages.insert(0, _message);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _chatController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF183C9F),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF183C9F),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    label: "Practice Interview",
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                  TextWidget(
                    label:
                        "Qorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.white,
              thickness: 3,
              indent: 30,
              endIndent: 30,
            ),
            Container(
              height: 60,
            ),

            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            botAnswer[0],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: 300,
                          decoration: BoxDecoration(
                            color: tLightColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            userAnswer[0],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            botAnswer[1],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: 300,
                          decoration: BoxDecoration(
                            color: tLightColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            userAnswer[1],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EvaluationLoading()),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.check),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),

            // Flexible(
            //   child: ListView.builder(
            //     itemCount: 2,
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: const EdgeInsets.all(20.0),
            //         child: Container(
            //           padding: EdgeInsets.all(20),
            //           width: 300,
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.only(
            //               topRight: Radius.circular(20),
            //               bottomRight: Radius.circular(20),
            //               bottomLeft: Radius.circular(20),
            //             ),
            //           ),
            //           child: Text("Hi!"),
            //         ),
            //       );
            //     },
            //   ),
            // ),

            Container(
              color: Colors.white,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.emoji_emotions_outlined,
                    color: tBlueColor,
                    size: 40,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 20.0,
                      ),
                      child: TextField(
                        controller: _chatController,
                        onChanged: (value) {
                          setState(() {
                            message = value;
                          });
                        },
                        textCapitalization: TextCapitalization.sentences,
                        autocorrect: true,
                        enableSuggestions: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: CircleAvatar(
                                backgroundColor: tBlueColor,
                                child: Center(
                                  child: IconButton(
                                    onPressed: () => _sendMessage(),
                                    icon: Icon(
                                      Icons.send,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: tLightColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EvaluationLoading extends StatefulWidget {
  const EvaluationLoading({super.key});

  @override
  State<EvaluationLoading> createState() => _EvaluationLoadingState();
}

class _EvaluationLoadingState extends State<EvaluationLoading> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => EvaluationScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimationWidget.hexagonDots(
              color: tBlueColor,
              size: 50,
            ),
            SizedBox(
              height: 20,
            ),
            TextWidget(
              label: "Evaluating",
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}

class EvaluationScreen extends StatelessWidget {
  const EvaluationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final evaluationList = [
      [
        "Question: How have you adapted to changes in the Technology industry?",
        "Answer: I try to adapt by always keeping track of the latest trends and innovations.",
        "Score: 6/10",
        "Review: This answer shows that the applicant is aware of the importance of staying up to date with the latest trends and innovations in the Technology industry. However, it does not provide any concrete examples of how they have adapted to changes in the Technology industry. It would be beneficial to hear more about the applicant's experience in adapting to changes in the Technology industry.",
      ],
      [
        "Question: What challenges have you faced in your previous roles and how did you overcome them?",
        "Answer: I usually have a trouble at communication but with the help of my teammates, I managed to overcome it.",
        "Score: 6/10",
        "Review: The applicant has demonstrated the ability to work with others to overcome a challenge, which is a positive sign. However, the answer does not provide any details about the challenge or how it was overcome. It would be beneficial to hear more about the applicant's experience in order to get a better understanding of their qualifications and skills, personality and work style, cultural fit, motivation and enthusiasm, potential for growth and development, and flexibility. Provide more detail about the challenge and how it was overcome.",
      ],
    ];
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          label: "Evaluation",
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: evaluationList.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: 10,
                      ),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: tLightColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            label: evaluationList[index][0],
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                            label: evaluationList[index][1],
                            fontSize: 16,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: TextWidget(
                              label: evaluationList[index][2],
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                            label: evaluationList[index][3],
                            fontSize: 16,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: TextWidget(
                  label: "Overall: 6/10",
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
