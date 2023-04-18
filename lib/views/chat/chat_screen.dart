import 'package:flutter/material.dart';
import 'package:tagumpai/constants/global_variables.dart';
import 'package:tagumpai/models/chat_message.dart';
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
              child: ListView.builder(
                itemCount: _messages.length,
                reverse: true,
                itemBuilder: (context, index) {
                  return _messages[index];
                },
              ),
            ),
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
