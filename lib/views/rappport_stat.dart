import 'package:flutter/material.dart';
import 'package:landflight_agency_dashboard/Widget/DashbardAgenceW.dart';
import 'package:landflight_agency_dashboard/Widget/appbarAgence.dart';

class Rapports extends StatefulWidget {
  const Rapports({super.key});

  @override
  State<Rapports> createState() => _RapportsState();
}

class _RapportsState extends State<Rapports> {
  @override
  Widget build(BuildContext context) {
    var headingText = "Dans la page Rapports et Statistiques";
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
            // Container(
            //   width: 4,
            //   height: 4,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: const [
            //       Padding(
            //         padding: EdgeInsets.only(top: 2, left: 15),
            //         child: TextField(
            //           textAlign: TextAlign.start,
            //         ),
            //       )
            //     ],
            //   ),
            // ),
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
                    const Divider(
                      indent: 12.0,
                      endIndent: 10,
                    ),
                  ]),
            )
          ],
        )
      ]),
    );
  }
}
