import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart' as http;

class VideoData {
  final String title;
  final String videoId;

  VideoData({required this.title, required this.videoId});
}

class PlaylistScreen extends StatefulWidget {
  final String playlistCategory;

  const PlaylistScreen({required this.playlistCategory});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  final String apiKey = 'AIzaSyD-cIjUUbm77b_UNzcAq_lAp2tyWkeXqrc';
  final String playlistId = 'PLRBp0Fe2Gpgldp6wTkEHOmuk_l1_8OCgw';
  late List<VideoData> _videos = [];

  @override
  void initState() {
    super.initState();
    _fetchPlaylistVideos();
  }

  String? returnPlaylistId(playlistCategory) {
    if (playlistCategory == 'Plumber') {
      return 'PLRBp0Fe2Gpgldp6wTkEHOmuk_l1_8OCgw';
    } else if (playlistCategory == 'Car Washer') {
      return 'PLRBp0Fe2Gpgldp6wTkEHOmuk_l1_8OCgw';
    } else if (playlistCategory == 'Car Mechanic') {
      return 'PLRBp0Fe2Gpgldp6wTkEHOmuk_l1_8OCgw';
    } else if (playlistCategory == 'Electrician') {
      return 'PLRBp0Fe2Gpgldp6wTkEHOmuk_l1_8OCgw';
    } else {
      return '0000000';
    }
  }

  Future<void> _fetchPlaylistVideos() async {
    final response = await http.get(Uri.parse(
        'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&playlistId=${returnPlaylistId(widget.playlistCategory)}&key=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      List<VideoData> videos = [];

      for (var item in data['items']) {
        videos.add(VideoData(
          title: item['snippet']['title'],
          videoId: item['snippet']['resourceId']['videoId'],
        ));
      }

      setState(() {
        _videos = videos;
      });
    } else {
      throw Exception('Failed to load playlist');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Videos for ${widget.playlistCategory}'),
      ),
      body: _videos.isNotEmpty
          ? ListView.builder(
              itemCount: _videos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                      'https://img.youtube.com/vi/${_videos[index].videoId}/0.jpg'),
                  title: Text(_videos[index].title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoPlayerScreen(
                          videoUrl:
                              'https://www.youtube.com/watch?v=${_videos[index].videoId}',
                          videoTitle: _videos[index].title,
                        ),
                      ),
                    );
                  },
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class VideoPlayerScreen extends StatelessWidget {
  final String videoUrl;
  final String videoTitle;

  const VideoPlayerScreen({required this.videoUrl, required this.videoTitle});

  @override
  Widget build(BuildContext context) {
    return InAppWebViewScreen(initialUrl: videoUrl, title: videoTitle);
  }
}

class InAppWebViewScreen extends StatefulWidget {
  final String initialUrl;
  final String title;
  const InAppWebViewScreen({
    super.key,
    required this.initialUrl,
    required this.title,
  });

  @override
  State<InAppWebViewScreen> createState() => _InAppWebViewScreenState();
}

class _InAppWebViewScreenState extends State<InAppWebViewScreen> {
  bool isLoading = true;
  bool isLandscape = false;
  // bool showFloatingButton = true;
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: isPortrait
          ? AppBar(
              title: Text(
                widget.title,
              ),
            )
          : null,
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          if (isLandscape) {
            setState(() {
              isLandscape = false;
            });
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ]);
          } else if (!isLandscape) {
            setState(() {
              isLandscape = true;
            });
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.landscapeRight,
            ]);
          }
        },
        child: Stack(
          children: [
            Center(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri.uri(Uri.parse(widget.initialUrl)),
                ),
                onLoadStart: (controller, url) {
                  setState(() {
                    isLoading = true;
                  });
                },
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    transparentBackground: true,
                  ),
                ),
                onLoadStop: (controller, url) {
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
            ),
            if (isLoading) Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
