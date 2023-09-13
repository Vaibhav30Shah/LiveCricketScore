import 'package:flutter/foundation.dart';
import 'package:food_delivery_app/models/livelineget_model.dart';

class LiveMatchDataProvider extends ChangeNotifier {
  LiveLineMatchModel _liveMatchData = LiveLineMatchModel();

  LiveLineMatchModel get liveMatchData => _liveMatchData;

  void updateLiveMatchData(LiveLineMatchModel newData) {
    _liveMatchData = newData;
    notifyListeners();
  }
}