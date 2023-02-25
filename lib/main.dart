import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:party_planner/side_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Party Planner",
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: const MyHomePage(title: "FestoCloud Home Page"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/img.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "FestoCloud",
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                fontSize: 28.0),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
          ),
          child: const SideBar(),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.cyan,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0))),
                      onPressed: () {
                        setState(() {
                          selectImages();
                        });
                      },
                      child: const Text("Select images to upload"),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.cyan,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0))),
                      onPressed: () {
                        setState(() {
                          print("connect to google drive api");
                        });
                      },
                      child: const Text("Holi 2023 Photos"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Text(
                  "Selected Images",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                imageFileList != null
                    ? Wrap(
                        children: imageFileList!.map((img) {
                          return Container(
                            child: Card(
                              child: Container(
                                height: 100,
                                width: 100,
                                child: Image.file(
                                  File(img.path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// decoration: const BoxDecoration(
// image: DecorationImage(
// image: AssetImage('assets/images/img.jpg'),
// fit: BoxFit.cover,
// colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
// ),

// Expanded(
//   child: Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: GridView.builder(
//         itemCount: imageFileList!.length,
//         gridDelegate:
//             const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3),
//         itemBuilder: (BuildContext context, int index) {
//           return Image.file(File(imageFileList![index].path),
//               fit: BoxFit.cover);
//         }),
//   ),
// )
