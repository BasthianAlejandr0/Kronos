import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UbicationMaps extends StatelessWidget {
  const UbicationMaps({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
    initialCameraPosition:  const CameraPosition(
      target: LatLng(-33.4489, -70.6693), // Coordenadas de Santiago, Chile
      zoom: 11.0,
    ),
    markers: {
       const Marker(
      markerId: MarkerId('Santiago'),
      position: LatLng(-33.4489, -70.6693), // Coordenadas de Santiago
      ),
    },
    );
  }
}
