//import 'dart:js';
import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
//import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:landflight_agency_dashboard/Widget/DashbardAgenceW.dart';
import 'package:landflight_agency_dashboard/Widget/appbarAgence.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  //final ImagePicker _image = ImagePicker();
  File? _image;
  Uint8List webImage = Uint8List(8);

  Future<void> _getImage() async {
    final ImagePicker picker = ImagePicker();

    XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 60);

    if (pickedFile != null) {
      var f = await pickedFile.readAsBytes();
      setState(() {
        webImage = f;
        _image = File('a');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var headingText = "Agence";
    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Text(
        // "data",
        //style: Theme.of(context).textTheme.bodyText1,
        //),

        DashboardAgenceW(context),
        //space btw menu and container for agency services
        const SizedBox(
          width: 0,
        ),
        Stack(),
        Column(
          children: [
            AppbarAgenceW(context),
            Container(
              width: MediaQuery.of(context).size.height * 1.61,
              height: MediaQuery.of(context).size.height * 0.90,
              decoration: BoxDecoration(
                //couleur du container
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 15),
                        child: RichText(
                          text: TextSpan(
                            text: 'BIENVENUE ',
                            style: Theme.of(context).textTheme.displayLarge,
                            children: [
                              TextSpan(
                                text: headingText,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 500),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                backgroundColor: const MaterialStatePropertyAll(
                                    Color.fromARGB(255, 118, 110, 109)),
                                fixedSize: const MaterialStatePropertyAll(
                                    Size(160, 45))),
                            onPressed: () {}, //_submitForm,
                            child: const Text(
                              'Annuler',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 171, 36, 26),
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 30),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                backgroundColor:
                                    const MaterialStatePropertyAll(Colors.blue),
                                fixedSize: const MaterialStatePropertyAll(
                                    Size(160, 45))),
                            onPressed: () {}, //_submitForm,
                            child: const Text('Envoyer')),
                      ),
                    ]),
                    const Divider(
                      indent: 12.0,
                      endIndent: 10,
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 5),
                        height: 500,
                        width: 1200,
                        child: Form(
                          //key: _formKey,

                          child: Column(children: [
                            Row(children: [
                              const SizedBox(height: 40),
                              const Text(
                                '                                                       Titre:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                              ),
                              Expanded(
                                  child: TextFormField(
                                //controller: _titreController,
                                cursorWidth: 1.5,
                                cursorHeight: 20,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Veillez remplir le champs";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    hintStyle: TextStyle(fontSize: 100),
                                    border: UnderlineInputBorder()),
                              )),
                            ]),
                            const SizedBox(height: 30),
                            Row(children: [
                              const Text(
                                '                                           Description:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              Expanded(
                                  child: TextFormField(
                                //controller: _titreController,
                                cursorWidth: 1.5,
                                cursorHeight: 20,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Veillez remplir le champs";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    hintStyle: TextStyle(fontSize: 40),
                                    hintMaxLines: 10,
                                    border: UnderlineInputBorder()),
                              )),
                            ]),
                            const SizedBox(height: 30),
                            Row(children: [
                              const Text(
                                '                                                    Image:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const Padding(padding: EdgeInsets.only(left: 30)),
                              Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 156, 153, 153),

                                  // image: _image == null
                                  //     ? DecorationImage(
                                  //         image: Icon()

                                  //         fit: BoxFit.cover)
                                  //     : null,
                                ),
                                child: _image != null
                                    ? Image.memory(
                                        webImage,
                                        fit: BoxFit.fill,
                                      )
                                    : const Icon(Icons.photo,
                                        color: Colors.black, size: 90),
                              ),
                            ]),
                            const SizedBox(height: 20),
                            Row(children: [
                              const Padding(
                                  padding: EdgeInsets.only(left: 350)),
                              ElevatedButton.icon(
                                onPressed: () {
                                  _getImage();
                                },
                                label: const Text(
                                  "Choisir une image",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.add_a_photo,
                                  color: Colors.black,
                                ),
                              ),
                            ]),
                          ]),

                          // ])
                        ))
                  ]),
            )
          ],
        )
      ]),
    );
  }
}
