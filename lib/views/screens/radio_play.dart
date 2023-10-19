import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:labhouse_radio/data/models/stations_model.dart';
import 'package:labhouse_radio/views/themes/theme.dart';
import 'package:labhouse_radio/views/widgets/appbar.dart';
import 'package:radio_player/radio_player.dart';

class RadioPlay extends StatefulWidget {
  final StationsModel? station;
  RadioPlay({Key? key, this.station}) : super(key: key);

  @override
  _RadioPlayState createState() => _RadioPlayState();
}

class _RadioPlayState extends State<RadioPlay> with TickerProviderStateMixin {
 

  RadioPlayer _radioPlayer = RadioPlayer();
  bool isPlaying = false;
  List<String>? metadata;

  @override
  void initState() {
    super.initState();
    initRadioPlayer();
  }

  void initRadioPlayer() {
    _radioPlayer.setChannel(
      title: 'Radio Player',
      url: widget.station!.urlResolved.toString(),
      imagePath: widget.station!.favicon,
    );

    _radioPlayer.stateStream.listen((value) {
      setState(() {
        isPlaying = value;
      });
    });

    _radioPlayer.metadataStream.listen((value) {
      setState(() {
        metadata = value;
      });
    });
  }

  @override
  void dispose() { 
    _radioPlayer.stop();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBuild(),
      backgroundColor: AppTheme.backgroundColor,
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: const ParticleOptions(
            baseColor: AppTheme.secondaryColor,
            spawnMinSpeed: 70.0,
            spawnMaxSpeed: 100.0,
            particleCount: 250
          ),
        ),
        vsync: this,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
    
              (widget.station!.favicon != "" && widget.station!.favicon != null)
              ? Image.network(
                widget.station!.favicon!, 
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
              Text(
                metadata?[0] ?? "${widget.station?.name}",
                softWrap: false,
                overflow: TextOverflow.fade,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                metadata?[1] ?? '${widget.station?.tags}',
                softWrap: false,
                overflow: TextOverflow.fade,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isPlaying ? _radioPlayer.pause() : _radioPlayer.play();
        },
        child: Icon(
          isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
        ),
      ),
    );
  }
}