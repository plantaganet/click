import 'package:click/components/image_helpers.dart';
import 'package:click/models/activity_data.dart';
import 'package:click/models/user_data.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final ActivityData activity;
  final double cardHeight;
  final Function(String) onAccept;
  final Function(String) onReject;

  const ActivityCard({
    Key? key,
    required this.activity,
    required this.cardHeight,
    required this.onAccept,
    required this.onReject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: cardHeight * 0.1,
        top: cardHeight * 0.03,
      ),
      child: Container(
        height: cardHeight,
        child: Card(
          color: Colors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, size: 32),
                    SizedBox(width: 8),
                    Text(
                      activity.activityName ?? 'activity doing something',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  activity.activityLocation ?? 'No location chosen',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: activity.currentAttendees
                      .map(
                        (user) => CircleAvatar(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: getImage(user.imageUrl, 40),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
