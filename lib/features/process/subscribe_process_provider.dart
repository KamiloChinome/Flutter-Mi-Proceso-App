import 'package:flutter/material.dart';

class SubscribeProcessModel with ChangeNotifier {
  IconData _addIcon = Icons.playlist_add;
  IconData _favorite = Icons.star_border_outlined;

  IconData get addIcon => _addIcon;
  set addIcon(IconData i) {
    _addIcon = i;
    notifyListeners();
  }
  IconData get favorite => _favorite;
  set favorite(IconData i) {
    _favorite = i;
    notifyListeners();
  }
}