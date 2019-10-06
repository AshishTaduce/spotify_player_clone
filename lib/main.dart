import 'package:flutter/material.dart';
import 'package:spotify_player_clone/song.dart';
import 'package:audioplayers/audioplayers.dart';


void main() {
  runApp(MaterialApp(
      theme: ThemeData(fontFamily: 'proximanova-regular'),
      home: Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        'Best of Hindi',
        style: TextStyle(
            //color: Colors.black
            ),
      ),
    ),
    body: SpotifyPlayer(),
  )));
}

class SpotifyPlayer extends StatefulWidget {
  @override
  _SpotifyPlayerState createState() => _SpotifyPlayerState();
}

class _SpotifyPlayerState extends State<SpotifyPlayer> {
  Song dummySong = Song(
      'Duniyaa',
      'https://p.scdn.co/mp3-preview/4efd033217aa13f4625d37f95efa676fb02d4778?cid=774b29d4f13844c495f206cafdad9c86',
      'https://i.scdn.co/image/f218335b215402cc2fb3b8d92652ebad48458805',
      'Luka Chuppi');
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  List<Song> allSongs = SongData().songs;
  List name = [];
  List song = [];
  List image = [];
  List artist = [];
  var index = 9;
  var state = 0;
  int result;
  var play = [Icons.play_circle_filled,Icons.pause_circle_filled];
  var icon = 0;
  var r = 0;
  var rl = [Icons.repeat,Icons.repeat_one,Colors.white,Colors.green];

  @override
  void initState() {
    listMaker();
    super.initState();
  }
  void listMaker(){
    for (var x in allSongs){
      name.add(x.name);
    }
    for (var x in allSongs){
      song.add(x.playUrl);
    }
    for (var x in allSongs){
      song.add(x.imageUrl);
    }
    for (var x in allSongs){
      song.add(x.artistName);
    }

    for (var x in name){
      print(x);
    }
    for (var x in song){
      print(x);
    }
    for (var x in image){
      print(x);
    }
    for (var x in artist){
      print(x);
    }
  }


  Widget build(BuildContext context) {
    return Container(

      color: Colors.black,
      child: Column(
        children: <Widget>[

          Expanded(
            flex: 10,
            child: Container(
              child: Text(' '),
              color: Colors.black,
            ),
          ),
          Expanded(
            flex: 50,
            child: FittedBox(
              child: Image.network(
                //'${image[0]}',
               'https://i.scdn.co/image/f218335b215402cc2fb3b8d92652ebad48458805',
              ),
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            flex: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 5),
                  child: Text(
                    'Duniyaa',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  child: Text(
                    'Luka Chuppi',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 15,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.thumb_up,
                          color: Colors.white,
                          size: 22,
                        ),
                        iconSize: 24,
                      ),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            if (index == 0){
                              index = song.length;
                            }
                            else {
                              index = index - 1;
                            }
                          },
                          );
                        },
                        icon: Icon(
                          Icons.skip_previous,
                          color: Colors.white,
                          size: 22,
                        ),
                        iconSize: 24,
                      ),
                      IconButton(
                        icon: Icon(
                          play[icon],
                          color: Colors.white,
                          size: 82,
                        ),
                        iconSize: 84,
                        onPressed: (){
                          setState(() {
                            if (state == 0){
                              audioPlayer.play(
                                '${song[index]}',);
                                state = 1;
                              }
                            else if (state == 1){
                                audioPlayer.pause();
                                state = 2;
                                icon = 1;
                              }
                            else {
                                audioPlayer.resume();
                                state = 1;
                                icon = 0;
                              }
                            },
                          );
                        },
                      ),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            if (index == song.length){
                              index = 0;
                            }
                            else {
                              index = index + 1;
                            }
                          },
                          );
                        },
                        icon: Icon(
                          Icons.skip_next,
                          color: Colors.white,
                          size: 22,
                        ),
                        iconSize: 24,
                      ),
                      IconButton(
                        icon: Icon(
                          rl[r],
                          color: rl[r + 2],
                          size: 22,
                        ),
                        onPressed: (){
                          setState(() {
                            if (r == 0){
                              r = 1;
                              //audioPlayer.setReleaseMode(ReleaseMode.LOOP);
                            }
//                            else if(r == 1){
//                            r = 0;
//                            if (index == name.length){
//                              index = 0;
//                            }
//                            //audioPlayer.setReleaseMode(ReleaseMode.STOP);
//                          }
                            else{
                             r = 0;
                             //audioPlayer.setReleaseMode(ReleaseMode.STOP);
                            }
                          });
                        },
                        iconSize: 24,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(' '),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
