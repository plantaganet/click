import 'package:click/Data/global_enums.dart';
import 'package:click/components/image_helpers.dart';
import 'package:click/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:core';
import 'package:click/components/component_infocard.dart';

class ProfileTemplate extends StatefulWidget {
  final Color backgroundColor;
  final UserData currentUser;
  final List<UserData> friends;
  final ProfileAction profileAction;
  final VoidCallback onActionPressed;
  final ValueChanged<String> onFriendPressed;

  ProfileTemplate({
    required this.backgroundColor,
    required this.currentUser,
    required this.friends,
    required this.profileAction,
    required this.onActionPressed,
    required this.onFriendPressed,
  });

  @override
  _ProfileTemplateState createState() => _ProfileTemplateState(friends);
}

class _ProfileTemplateState extends State<ProfileTemplate> {
  ScrollController _scrollController = ScrollController();
  double _scrollProgress = 0;

  final ValueNotifier<bool> _imageErrorNotifier = ValueNotifier<bool>(false);
  List<ValueNotifier<bool>> _friendsImageErrorNotifiers;

  _ProfileTemplateState(List<UserData> friends) : _friendsImageErrorNotifiers = List.generate(friends.length, (index) => ValueNotifier<bool>(false));

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollProgress = (_scrollController.offset / 200).clamp(0, 1);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String actionText;
    switch (widget.profileAction) {
      case ProfileAction.edit:
        actionText = 'Edit';
        break;
      case ProfileAction.addFriend:
        actionText = 'Add Friend';
        break;
      case ProfileAction.pending:
        actionText = 'Pending';
        break;
      case ProfileAction.options:
        actionText = 'Options';
        break;
    }

    final double imageSize = 50.0 + (MediaQuery.of(context).size.width * 0.4 - 50) * (1 - _scrollProgress);
    return Scaffold(
      body: Stack(
        children: [
          Container(color: widget.backgroundColor),
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                backgroundColor: widget.backgroundColor,
                elevation: 0,
                expandedHeight: MediaQuery.of(context).size.height * 0.3,
                floating: false,
                pinned: true,
                automaticallyImplyLeading: false,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: SizedBox(
                    width: imageSize,
                    child: widget.currentUser.imageUrl != null
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: imageSize / 2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(imageSize / 1.1),
                                child: getImage(widget.currentUser.imageUrl, imageSize / 1.1),
                              ),
                            ),
                          )
                        : Icon(
                            Icons.account_circle,
                            size: imageSize,
                            color: Colors.white,
                          ),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: widget.onActionPressed,
                    child: Text(
                      actionText,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  InfoCard(
                    title: 'Age:',
                    value: '${widget.currentUser.age}',
                  ),
                  InfoCard(
                    title: 'Gender:',
                    value: '${widget.currentUser.gender.toString().split('.').last}',
                  ),
                  InfoCard(
                    title: 'Activities attended:',
                    value: '${widget.currentUser.activitiesAttended}',
                  ),
                  InfoCard(
                    title: 'Activities hosted:',
                    value: '${widget.currentUser.activitiesHosted}',
                  ),
                  InfoCard(
                    title: 'Favourite activity type:',
                    value: '${widget.currentUser.activitiesFavourite}',
                  ),
                  FriendsCard(
                    friends: widget.friends,
                    onFriendPressed: widget.onFriendPressed,
                  ),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
