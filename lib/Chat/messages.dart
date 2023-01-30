import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (ctx, chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          final user = FirebaseAuth.instance.currentUser;
          return ListView.builder(
            reverse: true,
            itemCount: chatSnapshot.data!.docs.length,
            itemBuilder: (ctx, index) => MessageBubble(
              chatSnapshot.data!.docs[index]['text'],
              chatSnapshot.data!.docs[index]['userID'] == user?.uid,
              chatSnapshot.data!.docs[index]['username'],
              chatSnapshot.data!.docs[index]['userImage'],
              key: ValueKey(chatSnapshot.data!.docs[index].id),
            ),
          );
        }
      },
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
    );
  }
}
