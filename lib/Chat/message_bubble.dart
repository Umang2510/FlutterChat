import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String meaagse;
  bool isMe;
  final String userName;
  final String userImg;
  MessageBubble(this.meaagse, this.isMe, this.userName, this.userImg,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 140,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: isMe
                    ? Colors.grey[300]
                    : const Color.fromARGB(255, 245, 108, 158),
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10),
                    topRight: const Radius.circular(10),
                    bottomLeft: !isMe
                        ? const Radius.circular(0)
                        : const Radius.circular(10),
                    bottomRight: isMe
                        ? const Radius.circular(0)
                        : const Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    userName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isMe ? Colors.black : Colors.white),
                  ),
                  Text(
                    meaagse,
                    style: TextStyle(
                      color: isMe ? Colors.black : Colors.white,
                    ),
                    textAlign: isMe ? TextAlign.end : TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: isMe ? 255 : 120,
          child: CircleAvatar(
            backgroundImage: NetworkImage(userImg),
          ),
        ),
      ],
    );
  }
}
