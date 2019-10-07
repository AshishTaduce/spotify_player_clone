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
  AudioPlayer audioPlayer = AudioPlayer();
  List<Song> allSongs = SongData().songs;

  var play = [Icons.play_circle_filled,Icons.pause_circle_filled];
  var icon = 0;
  var r = 0;
  var rl = [Icons.repeat,Icons.repeat_one,Colors.white,Colors.green];

  Song currentSong ;
  var index = 0;
  var state = 0;

  @override
  void initState() {
    super.initState();
  }



  Widget build(BuildContext context) {
    currentSong = allSongs[index];
    return Container(

      color: Colors.black,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 50,
            child: Image.network(
              '${currentSong.imageUrl}',
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
                    currentSong.name,
                    //name[index],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  child: Text(
                    currentSong.artistName,
                    //artist[index],
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
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        onPressed: (){
                          setState(() {
                            print(index);
                            print(r);
                            print(state);
                          }
                          );
                        },
                        iconSize: 24,
                      ),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            if (index == 0){
                              index = allSongs.length - 1;
                            }
                            else {
                              index = index - 1;
                            }
                            audioPlayer.stop();
                            audioPlayer.play(
                              currentSong.playUrl,);
                            state = 4;
                            icon = 1;
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
                            print(state);
                            if (state == 0){
                              audioPlayer.play(
                                currentSong.playUrl,

                              );
                              state = 1;
                              }
                            else if (state == 4){
                              audioPlayer.pause();
                              icon = 1;
                              state = 5;
                            }
                            else if (state == 5){
                              audioPlayer.resume();
                              icon = 0;
                              state = 4;
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
                            if (index == allSongs.length - 1){
                              index = 0;
                            }
                            else {
                              index = index + 1;
                            }
                            audioPlayer.stop();
                            audioPlayer.play(
                              currentSong.playUrl,);
                            state = 4;
                            icon = 1;
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
                             // audioPlayer.onPlayerCompletion.listen((event) {setState(() {audioPlayer.play('${song[index]}',);})});
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
