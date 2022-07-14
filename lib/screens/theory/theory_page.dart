import 'package:flutter/material.dart';

import '../../api/pdf_api.dart';
import 'listfilesPdf_page.dart';

class TheoryPage extends StatefulWidget {
  String uid;
  TheoryPage({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<TheoryPage> createState() => _TheoryPageState();
}

class _TheoryPageState extends State<TheoryPage> {
  late Future<List<String>> folders;

  @override
  void initState() {
    super.initState();
    folders = FirebaseApi.listAllDir("Document");
  }

  @override
  Widget build(BuildContext context) {
    return listfolders();
  }

  Widget listfolders() {
    return FutureBuilder<List<String>>(
        future: folders,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                final directories = snapshot.data ?? <String>[];

                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    margin: EdgeInsets.only(left: 24, right: 24),
                    child: Column(
                      children: [
                        SizedBox(height: 32),
                        Container(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: directories.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Card(
                                  child: ListTile(
                                title: Text(' ${directories[index]}'),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          Listfiles(path: directories[index])));
                                },
                              ));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
          }
        });
  }
}



// reference
// https://github.com/JohannesMilke/firebase_download_example/blob/master/lib/main.dart
