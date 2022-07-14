import 'package:sciolism_app/screens/theory/pdf_view_page.dart';
import 'package:flutter/material.dart';

import '../../api/pdf_api.dart';
import '../../models/pdf.dart';
import '../../models/video.dart';
import 'video_player_page.dart';

class Listfiles extends StatefulWidget {
  const Listfiles({required this.path, Key? key}) : super(key: key);
  final String path; // name folder

  @override
  State<Listfiles> createState() => _ListfilesState();
}

class _ListfilesState extends State<Listfiles> with TickerProviderStateMixin {
  late Future<List<PDF>> files;
  late Future<List<Video>> videos;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    files = FirebaseApi.listAllFiles('Document/${widget.path}');
    videos = FirebaseApi.listAllVideos('Videos/${widget.path}');
    _tabController = TabController(length: 2, vsync: this);
  }


  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.widget.path}"),
        bottom: TabBar(controller: _tabController, tabs: const <Widget>[
          Tab(
              child: Text('Tài Liệu'),
              icon: Icon(Icons.library_books_outlined)),
          Tab(
            child: Text('Bài Giảng'),
            icon: Icon(Icons.ondemand_video_outlined),
          ),
        ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          listfiles(),
          listvideos(),
        ],
      ),
    );
  }

  Widget listfiles() {
    return FutureBuilder<List<PDF>>(
        future: files,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                final pdfs = snapshot.data!;

                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: pdfs.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                      title: Text('Bài ${pdfs[index].name.split('.pdf')[0]}'),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PDFViewerPage(pdfs[index])));
                      },
                    ));
                  },
                );
              }
          }
        });
  }

  Widget listvideos() {
    return FutureBuilder<List<Video>>(
        future: videos,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                final videos = snapshot.data!;

                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                          title: Text('Bài ${videos[index].name.split('.flv')[0]}'),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => VideoPlayerPage(videos[index].ref)));
                          },
                        ));
                  },
                );
              }
          }
        });
  }
}
