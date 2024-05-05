import 'package:naruciekoapp/globalData.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class MarketModel {
  late LatLong latLong;
  late MarketsEnum marketEnum;
  MarketModel({required this.latLong, required this.marketEnum});
}
