import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geo_stories/models/marker_dto.dart';
import 'package:latlong/latlong.dart';

class MarkerService {
  static FirebaseFirestore database = FirebaseFirestore.instance;




  static Future<void> createMarker(String title, String description, LatLng point) async {
    try{
        await database.collection("markers")
            .add({
          'latitude': point.latitude,
          'longitude': point.longitude,
          'title' : title,
          'description' : description,
        });
      }
      catch(e){
        print(e);
      }
  }
  static updateMarker(String title, String description,MarkerDTO dto){
       database.collection("markers").doc(dto.id).update({
         'title' : title,
         'description' : description,
       });
  }

  static Future<List<MarkerDTO>> getMarkers() async {
    final query = await database.collection("markers").get();
    return query.docs.map((marker) => MarkerDTO.fromJSON(marker.data(),marker.id)).toList();
  }
  static Stream<QuerySnapshot> getMarkerSnapshots() {
    return database.collection("markers").snapshots();
  }
}
