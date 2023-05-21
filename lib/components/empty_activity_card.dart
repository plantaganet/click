import 'package:flutter/material.dart';

class EmptyActivityCard extends StatelessWidget {
  final VoidCallback onChangeFilters;
  final VoidCallback onRefresh;

  const EmptyActivityCard({Key? key, required this.onChangeFilters, required this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 64),
        child: Card(
          color: Colors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'There are no activities with your filters near you',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: onChangeFilters,
                      child: Text('Change filters'),
                    ),
                    ElevatedButton(
                      onPressed: onRefresh,
                      child: Text('Refresh'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
