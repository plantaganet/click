import 'package:click/components/image_helpers.dart';
import 'package:click/models/user_data.dart';
import 'package:flutter/material.dart';

class FriendCard extends StatelessWidget {
  final UserData friend;
  final VoidCallback onPressed;

  const FriendCard({super.key, required this.friend, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              child: ClipRRect(borderRadius: BorderRadius.circular(40), child: getImage(friend.imageUrl, null)),
            ),
            const SizedBox(height: 8),
            Text(friend.username),
          ],
        ),
      ),
    );
  }
}
