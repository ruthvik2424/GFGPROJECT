import 'dart:html';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:newapp/pages/sidemenu.dart';
import 'package:open_file/open_file.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? filetoDisplay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sidemenu(),
      appBar: AppBar(
        title: Text('SaySmooth'),
        backgroundColor: Color.fromARGB(255, 18, 85, 255),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/1758.jpg"), fit: BoxFit.cover)),
        child: ElevatedButton(
            onPressed: () async {
              final result = await FilePicker.platform.pickFiles();
              final file = result?.files.first;
              openFile(file);
            },
            child: Text('Pick File')),
      ),
    );
  }

  void openFile(PlatformFile? file) {
    OpenFile.open(file?.path!);
  }
}

// class Home2 extends StatelessWidget {
//   const Home2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: SideDrawer(),
//       appBar: AppBar(
//         title: Text('Stuttered Speech Recognition System'),
//         centerTitle: true,
//       ),
//     );
//   }
// }

// class SideDrawer extends StatelessWidget {
//   const SideDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: <Widget>[
//           DrawerHeader(
//             child: Center(
//               child: Text(
//                 'Welcome',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.amber, fontSize: 25),
//               ),
//             ),
//             decoration: BoxDecoration(color: Colors.transparent),
//           ),
//           ListTile(
//             leading: Icon(Icons.feedback),
//             title: Text('Feedback'),
//             onTap: () => {Navigator.pushNamed(context, '/home')},
//           ),
//           ListTile(
//             leading: Icon(Icons.help),
//             title: Text('Help'),
//             onTap: () => {Navigator.pushNamed(context, '/location')},
//           ),
//         ],
//       ),
//     );
//   }
// }
