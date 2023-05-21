import 'dart:math';

import 'package:click/components/activity_card.dart';
import 'package:click/components/empty_activity_card.dart';

import 'package:click/models/activity_data.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TemplateSearch extends StatefulWidget {
  final List<ActivityData> activities;
  final Function(String) onAccept;
  final Function(String) onReject;
  final VoidCallback? onRefresh;
  final VoidCallback? onChangeFilters;

  const TemplateSearch({
    Key? key,
    required this.activities,
    required this.onAccept,
    required this.onReject,
    this.onRefresh,
    this.onChangeFilters,
  }) : super(key: key);

  @override
  _TemplateSearchState createState() => _TemplateSearchState();
}

class _TemplateSearchState extends State<TemplateSearch> {
  late GoogleMapController _mapController;
  LatLng? _userLocation;
  LatLng? _activityLocation;
  int _currentActivityIndex = 0;
  double swipeThreshold = 40;
  double rotationAngle = 0.0;
  double opacity = 1.0;
  final ValueNotifier<Offset> _swipePosition = ValueNotifier(Offset.zero);
  Set<Marker> _markers = {}; // Add this line

  @override
  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getUserLocation();

    if (widget.activities.isNotEmpty) {
      _activityLocation = widget.activities[0].activityPosition;
      _markers = {
        Marker(
          markerId: MarkerId(widget.activities[0].activityId),
          position: _activityLocation!,
        ),
      };
    }
  }

  Future<void> _getUserLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _userLocation = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      print("Error getting user's location: $e");
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _userLocation = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      print(e);
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    if (_userLocation != null) {
      _mapController.animateCamera(
        CameraUpdate.newLatLngZoom(_userLocation!, 15.0),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildGoogleMap(),
        _buildActivityCard(),
      ],
    );
  }

  Widget _buildGoogleMap() {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _userLocation ?? const LatLng(0, 0),
        zoom: 14,
      ),
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      markers: _markers, // Update this line
    );
  }

  Widget _buildActivityCard() {
    if (widget.activities.isEmpty) {
      return EmptyActivityCard(
        onChangeFilters: widget.onChangeFilters ?? () {},
        onRefresh: widget.onRefresh ?? () {},
      );
    } else {
      final activity = widget.activities[0];
      return LayoutBuilder(
        builder: (context, constraints) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onPanUpdate: (details) {
                _swipePosition.value += Offset(details.delta.dx, 0);
              },
              onPanEnd: (_) {
                _swipeComplete(constraints);
              },
              child: ValueListenableBuilder<Offset>(
                valueListenable: _swipePosition,
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: value,
                    child: ActivityCard(
                      activity: activity,
                      cardHeight: constraints.maxHeight * 0.35,
                      onAccept: (activityId) {
                        print('onAccept');
                        final activity = widget.activities.firstWhere(
                          (activity) => activity.activityId == activityId,
                        );
                        widget.onAccept(activityId);
                        _onActivitySelect(activity);
                      },
                      onReject: (activityId) {
                        print('onReject');
                        final activity = widget.activities.firstWhere(
                          (activity) => activity.activityId == activityId,
                        );
                        widget.onReject(activityId);
                        _onActivitySelect(activity);
                      },
                    ),
                  );
                },
              ),
            ),
          );
        },
      );
    }
  }

  void _swipeComplete(BoxConstraints constraints) {
    if (widget.activities.isNotEmpty) {
      double screenWidth = constraints.maxWidth;
      double cardOffsetX = _swipePosition.value.dx;

      if (cardOffsetX.abs() > screenWidth * 0.5) {
        if (cardOffsetX > 0) {
          widget.onAccept(widget.activities[0].activityId);
        } else {
          widget.onReject(widget.activities[0].activityId);
        }
        setState(() {
          widget.activities.removeAt(0);
        });
        if (widget.activities.isNotEmpty) {
          _onActivitySelect(widget.activities[0]);
        }
      }
    }

    _swipePosition.value = Offset.zero;
  }

  void _onActivitySelect(ActivityData activity) {
    // Set the new activity location
    setState(() {
      _activityLocation = activity.activityPosition;

      // Update the markers
      _markers = {
        Marker(
          markerId: MarkerId(activity.activityId),
          position: _activityLocation!,
        ),
      };
    });

    if (_userLocation != null && _activityLocation != null) {
      // Calculate the LatLngBounds to fit both user and activity locations
      LatLngBounds bounds = LatLngBounds(
        southwest: LatLng(
          min(_userLocation!.latitude, _activityLocation!.latitude),
          min(_userLocation!.longitude, _activityLocation!.longitude),
        ),
        northeast: LatLng(
          max(_userLocation!.latitude, _activityLocation!.latitude),
          max(_userLocation!.longitude, _activityLocation!.longitude),
        ),
      );

      // Animate the camera to fit both user and activity locations
      _mapController.animateCamera(
        CameraUpdate.newLatLngBounds(bounds, 100.0),
      );
    }
  }
}
