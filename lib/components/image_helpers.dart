import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:core';

bool isUrlValid(String url) {
  try {
    final uri = Uri.parse(url);
    return uri.isAbsolute && (uri.scheme == 'http' || uri.scheme == 'https') && uri.host.isNotEmpty;
  } catch (e) {
    return false;
  }
}

Widget getImage(String? imageUrl, double? size) {
  if (imageUrl == null || imageUrl.isEmpty) {
    return Icon(Icons.account_circle, size: size ?? 80, color: Colors.grey);
  } else if (!isUrlValid(imageUrl)) {
    return Icon(Icons.error_rounded, size: size ?? 80, color: Colors.red);
  } else {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
          ),
        );
      },
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Icon(Icons.error_rounded, size: size ?? 80, color: Colors.red);
      },
    );
  }
}
