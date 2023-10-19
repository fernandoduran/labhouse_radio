import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labhouse_radio/cubits/stations_cubit.dart';
import 'package:labhouse_radio/data/models/stations_model.dart';
import 'package:labhouse_radio/views/screens/screens.dart';
import 'package:labhouse_radio/views/themes/theme.dart';
import 'package:labhouse_radio/views/widgets/appbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() { 
    super.initState();
    BlocProvider.of<StationsCubit>(context).loadSpainStations();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: const AppBarBuild(),
     backgroundColor: AppTheme.backgroundColor,
     body: BlocBuilder<StationsCubit, StationsState>(
       builder: (context, state) {
         
         List<dynamic> stations = state.stations ?? [];

         if(stations.isEmpty) return const Text('No hay estaciones de radio');

         if(state is StationsLoading) return const CircularProgressIndicator();
         
         return  ListWheelScrollView.useDelegate(
           itemExtent: 300,
           perspective: 0.005,
           physics: const FixedExtentScrollPhysics(),
           childDelegate: ListWheelChildBuilderDelegate(
             childCount: stations.length,
             builder: (context, index) => radioCards(stations[index]),
           ),
         );
       },
     ),
    );
  }
  
  radioCards(StationsModel station) {

    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RadioPlay(station: station))),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppTheme.thirdColor,
          border: Border.all(color: AppTheme.secondaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(10.0))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (station.favicon != "" && station.favicon != null)
              ? Image.network(
                station.favicon!, 
                fit: BoxFit.fitWidth, 
                height: 190, 
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  'assets/radio.png',
                  fit: BoxFit.fitWidth,
                  height: 190,
                )
              )
            : Image.asset(
                'assets/radio.png',
                fit: BoxFit.fitWidth,
                height: 190,
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(station.name!, overflow: TextOverflow.clip,),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Estilos: ${station.tags}", overflow: TextOverflow.ellipsis),
            )
          ],
        ),
      ),
    );
  }
}