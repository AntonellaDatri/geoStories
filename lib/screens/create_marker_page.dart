import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geo_stories/screens/map_page.dart';
import 'package:geo_stories/services/marker_service.dart';
import 'package:latlong/latlong.dart';

import '../main.dart';

class CreateMarkerPage extends StatefulWidget{
  LatLng point;
  CreateMarkerPage(LatLng point){
    this.point = point;
  }

  @override
  MarkerPage createState() => MarkerPage(point);

}
class MarkerPage extends State<CreateMarkerPage> {
  LatLng point;
   TextEditingController titleTextController;
   TextEditingController descriptTextController;

  MarkerPage(LatLng point){
    this.point = point;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar un nuevo marker "),
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
      child : Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration (labelText: "Título",
              hintText: "Ingrese un título"
            ),
<<<<<<< HEAD
            controller: titleTextController,
=======
            controller: nameTextController,
            key: ValueKey("field1"),
>>>>>>> test corregidos
          ),

          TextField(
            decoration: InputDecoration(labelText: "Descripción",
            hintText: "Ingrese una breve descripción"),
            controller: descriptTextController,
            key: ValueKey("field2"),
          ),
          RaisedButton(
              child: Text("Guardar Marker"),
              onPressed: () {
                if (titleTextController.value.text != "" || descriptTextController.value.text != "") {
                  _crearMarker(context);
                } else {
                  showDialog(context: context, child:
                  new AlertDialog(
                    title: new Text("Por favor, ingrese un título o una descripción."),
                      actions: [
                        FlatButton(
                        child: Text('Ok'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ]
                  ));
                }
              }
          )
        ],
      ),
    )
    );
  }
  void _crearMarker(BuildContext context){
    MarkerService.createMarker(titleTextController.text,descriptTextController.text,point);
    titleTextController.clear();
    descriptTextController.clear();
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MapPage()));

  }
  @override
  void initState() {
    titleTextController = TextEditingController();
    descriptTextController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    titleTextController.dispose();
    descriptTextController.dispose();
    super.dispose();
  }
}

