import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String meaagse;
  const MessageBubble(this.meaagse, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 140,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            meaagse,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
