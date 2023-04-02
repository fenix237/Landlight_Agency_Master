import 'package:flutter/material.dart';

//Widget pour la barre d'entete de l'App Admin

Widget AppbarAgenceW(BuildContext context) {
  return SizedBox(
    height: 70,
    width: 1200,
    child: Row(
      children: [
        const Expanded(
            child: TextField(
          scrollPadding: EdgeInsets.only(right: 2000),
          decoration: InputDecoration(

              //suffixIcon: Icon(Icons.search, color: Colors.white),

              // filled: true,
              // fillColor: Colors.red,
              hintStyle: TextStyle(color: Colors.white),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red))),
          style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              decoration: TextDecoration.none),
          cursorColor: Colors.white,
          cursorWidth: 1.0,
          textAlignVertical: TextAlignVertical.center,
        )),
        // const DecoratedBox(
        //     decoration: BoxDecoration(
        //         border: Border(
        //             bottom:
        //                 BorderSide(color: Colors.white, width: 10)))),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          color: Colors.white,
        ),

        const Padding(padding: EdgeInsets.only(left: 600)),
        const Icon(
          Icons.workspace_premium,
          color: Colors.yellow,
          size: 30,
        ),
        const Padding(padding: EdgeInsets.only(left: 5)),
        const Expanded(
          child: Text(
            "Aller A Premium",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
        const Padding(padding: EdgeInsets.only(left: 200)),
        const Icon(
          Icons.account_circle,
          color: Colors.white,
          size: 50,
        ),
        IconButton(
          onPressed: () {
            showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel:
                    MaterialLocalizations.of(context).modalBarrierDismissLabel,
                //barrierColor: Colors.black45,
                transitionDuration: const Duration(milliseconds: 200),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 900,
                      height: MediaQuery.of(context).size.height - 350,
                      padding: const EdgeInsets.all(20),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 250),
                            ),
                            const Text('MON COMPTE',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black,
                                )),
                            // ElevatedButton(
                            //     onPressed: () {
                            //       Navigator.of(context).pop();
                            //     },
                            //     style: const ButtonStyle(
                            //         backgroundColor:
                            //             MaterialStatePropertyAll(Colors.yellow)),
                            //     child: const Text(
                            //       "Sauvegarder",
                            //       style: TextStyle(color: Colors.blue),
                            //     )),
                            const Padding(
                              padding: EdgeInsets.only(left: 179),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(left: 1),
                                child: Text(
                                  'X',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            // IconButton(
                            //   icon: const Icon(Icons.access_alarm),
                            //   onPressed: () {
                            //     Navigator.of(context).pop();
                            //   },
                            //   color: Colors.white,
                            //   iconSize: 20,
                            // )
                          ]),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 190),
                              ),
                              Text('nom',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(left: 50),
                              ),
                              Expanded(
                                  child: Text('Phoenix',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        fontSize: 17,
                                        color: Colors.black,
                                      ))),
                              Padding(
                                padding: EdgeInsets.only(left: 50),
                              ),
                              Icon(Icons.edit)
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 182),
                              ),
                              Text('Email',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(left: 50),
                              ),
                              Expanded(
                                  child: Text('fenix237@gmail.com',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        fontSize: 17,
                                        color: Colors.black,
                                      ))),
                              Padding(
                                padding: EdgeInsets.only(left: 50),
                              ),
                              Icon(Icons.edit)
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 155),
                              ),
                              Text('Password',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(left: 50),
                              ),
                              Expanded(
                                  child: Text('**********************',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        fontSize: 17,
                                        color: Colors.black,
                                      ))),
                              Padding(
                                padding: EdgeInsets.only(left: 50),
                              ),
                              Icon(Icons.edit)
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const SizedBox(
                            height: 85,
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 50),
                              ),
                              // ElevatedButton(
                              //   onPressed: () {},
                              //   style: ButtonStyle(
                              //       shape: MaterialStatePropertyAll(
                              //         RoundedRectangleBorder(
                              //           borderRadius:
                              //               BorderRadius.circular(200),
                              //         ),
                              //       ),
                              //       backgroundColor:
                              //           const MaterialStatePropertyAll(
                              //               Color.fromARGB(255, 118, 110, 109)),
                              //       fixedSize: const MaterialStatePropertyAll(
                              //           Size(10, 20))),
                              //   //icon: const Icon(Icons.info),
                              //   child: const Text(
                              //     'i',
                              //     style: TextStyle(
                              //         fontStyle: FontStyle.italic,
                              //         fontSize: 19),
                              //   ),
                              // ),
                              const Icon(Icons.info),
                              TextButton(
                                onPressed: () {},
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'Contactez les developpeurs ou signaler un bug',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          icon: const Icon(
            Icons.arrow_drop_down,
          ),
          color: Colors.white,
          iconSize: 20,
        ),
      ],
    ),
  );
}
