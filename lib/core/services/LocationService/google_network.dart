import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mojec_agent/core/constants/key_constants.dart';



// const ApiKey = 'AIzaSyAVgkQ1Q9YFoutukKPAg6WLQyhAatOLNI4';
class GoogleMapsServices{
  Future<String> getRouteCoordinates(LatLng? l1, LatLng? l2)async{
    String uri = "https://maps.googleapis.com/maps/api/directions/json?origin=${l1!.latitude},${l1.longitude}&destination=${l2!.latitude},${l2.longitude}&key=$apiKey";
    final  url  =   Uri.parse(uri);
    http.Response response = await http.get(url);
    Map values = jsonDecode(response.body);
    return values["routes"][0]["overview_polyline"]["points"];
  }
}