import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Map App',
      home: const MapPage(),
    );
  }
}

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late MapTileLayerController _mapController;
  late MapZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    super.initState();
    _zoomPanBehavior = MapZoomPanBehavior(
      enableDoubleTapZooming: true,
      zoomLevel: 13,
      minZoomLevel: 5,
      maxZoomLevel: 19,
    );
    _mapController = MapTileLayerController();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bus Map App')),
      body: SfMaps(
        layers: [
          MapTileLayer(
            controller: _mapController,
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            initialZoomLevel: 15,
            zoomPanBehavior: _zoomPanBehavior,
            initialFocalLatLng: MapLatLng(15.815139, 74.487056),
            markerBuilder: (context, index) => MapMarker(
              latitude: 15.815139,
              longitude: 74.487056,
              child: _buildBusIcon(),
            ),
            initialMarkersCount: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildBusIcon() {
    const busIconSvg = '''
<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 64 64">
	<path fill="#ffce31" d="M2 38.4h60v16.5H2z" />
	<path fill="black" d="M2 54.9h60v1.8H2zm11.8-10.8H62v1H13.8zm0-5.3H62v1H13.8z" />
	<path fill="black" d="M49.6 46.8c-4.6 0-8.3 3.6-8.3 8.1c0 .6.1 1.2.2 1.8h16.2c.1-.6.2-1.2.2-1.8c0-4.5-3.7-8.1-8.3-8.1m-31 0c-4.6 0-8.3 3.6-8.3 8.1c0 .6.1 1.2.2 1.8h16.2c.1-.6.2-1.2.2-1.8c-.1-4.5-3.8-8.1-8.3-8.1" />
	<path fill="#ffce31" d="M59.9 16H4.3c-1.1 0-2 .9-2.3 2v20.3h60V18c0-1.1-.9-2-2.1-2" />
	<ellipse cx="49.6" cy="54.9" fill="black" rx="7.2" ry="7.1" />
	<circle cx="49.6" cy="54.9" r="3.6" fill="#94989b" />
	<ellipse cx="18.6" cy="54.9" fill="black" rx="7.2" ry="7.1" />
	<path fill="#94989b" d="M18.6 51.3c-2 0-3.6 1.6-3.6 3.6s1.6 3.6 3.6 3.6s3.6-1.6 3.6-3.6s-1.7-3.6-3.6-3.6" />
	<path fill="black" d="M2 20.9h3.1v17.4H2z" />
	<path fill="#f5f5f5" d="M4.7 53.7c-.3.2-1.5.8-1.5.8v-3.6s1.2.5 1.5.8c.8.5.8 1.4 0 2" />
	<path fill="#ed4c5c" d="M4.1 41.8c-.2.2-1 .6-1 .6v-2.7s.8.4 1 .6c.5.3.5 1 0 1.5" />
	<path fill="black" d="M14.9 20.9h7.5v4.5h-7.5z" />
	<path fill="black" d="M14.9 27.3h7.5v4.5h-7.5z" />
	<path fill="black" d="M24.1 20.9h7.5v4.5h-7.5z" />
	<path fill="black" d="M24.1 27.3h7.5v4.5h-7.5z" />
	<path fill="black" d="M33.5 20.9H41v4.5h-7.5z" />
	<path fill="black" d="M33.5 27.3H41v4.5h-7.5z" />
	<path fill="black" d="M42.9 20.9h7.5v4.5h-7.5z" />
	<path fill="black" d="M42.9 27.3h7.5v4.5h-7.5z" />
	<path fill="black" d="M51.7 20.9h7.5v4.5h-7.5z" />
	<path fill="black" d="M51.7 27.3h7.5v4.5h-7.5zM2 33.6h60v1H2z" />
	<path fill="#f5f5f5" d="m18.5 43.8l-3.3-3.2v-4.5l3.3-3.2h4.7l3.3 3.2v4.5l-3.3 3.2z" />
	<path fill="#ed4c5c" d="m19.1 42.4l-2.5-2.3v-3.4l2.5-2.4h3.5l2.5 2.4v3.4l-2.5 2.3z" />
	<path fill="#94989b" d="M13.3 36.5h1.9v3.8h-1.9zM4 23.5h2.7v12.3H4z" />
	<path fill="black" d="M6.7 20.9H13v10.9H6.7zM2 43.6h4.7V50H2z" />
	<path fill="black" d="M2 44.5h3.8v.9H2zm0 1.8h3.8v.9H2zm0 1.9h3.8v.9H2z" />
</svg>
    ''';
    return SizedBox(
      height: 35, // Adjust size as needed
      width: 38,
      child: SvgPicture.string(busIconSvg),
    );
  }
}
