import 'package:flutter/material.dart';
import 'package:tagumpai/constants/global_variables.dart';
import 'package:tagumpai/models/chat_message.dart';
import 'package:tagumpai/widgets/text_widget.dart';

class ChatMessageWidget extends StatelessWidget {
  final ChatMessage chatMessage;
  const ChatMessageWidget({
    super.key,
    required this.chatMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Container(
            child: CircleAvatar(
              child: Image.asset(
                tChatbotDp,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.all(10),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    label:
                        "Describe a time when you had to work with a team to solve a complex problem",
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
