import 'package:flutter/material.dart';

// Provides a way to update the icon displayed for adding and favoriting a subscription.
class SubscribeProcessModel with ChangeNotifier {
  IconData _addIcon = Icons.playlist_add;
  IconData _favorite = Icons.star_border_outlined;

  IconData get addIcon => _addIcon;
  // When the icon is updated, notifyListeners is called
  // to trigger a rebuild of any widgets that depend on this class.
  set addIcon(IconData i) {
    _addIcon = i;
    notifyListeners();
  }

  IconData get favorite => _favorite;
  // When the icon is updated, notifyListeners is called
  // to trigger a rebuild of any widgets that depend on this class.
  set favorite(IconData i) {
    _favorite = i;
    notifyListeners();
  }
}