import 'package:flutter/material.dart';
import 'package:landflight_agency_dashboard/Widget/DashbardAgenceW.dart';
import 'package:landflight_agency_dashboard/Widget/appbarAgence.dart';
import 'package:landflight_agency_dashboard/Widget/scroll_widget.dart';
import 'package:landflight_agency_dashboard/data/listAbonnes.dart';
import 'dart:core';

import 'package:landflight_agency_dashboard/modele/Abonnes_model.dart';

class AbonnesP extends StatefulWidget {
  const AbonnesP({super.key});

  @override
  State<AbonnesP> createState() => _AbonnesPState();
}

class _AbonnesPState extends State<AbonnesP> {
  /////////////////////////////////////////

  late List<Abonnes> abonnes;
  int? sortColumnIndex;
  bool isAscending = false;
  final couleurs = [
    const Color.fromARGB(100, 217, 217, 217),
    Colors.white,
  ];
  bool isColored = false;

  @override
  void initState() {
    super.initState();

    this.abonnes = List.of(allAbonnes);
  }

  Widget buildDataTable() {
    final columns = [
      'Nom',
      'Agence Favoris',
      'Billets Commandes',
      'Type Utilisateur'
    ];

    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      columnSpacing: 15,
      rows: getRows(abonnes),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<Abonnes> abonnes) => abonnes.map((Abonnes abonne) {
        final cells = [
          abonne.Nom,
          abonne.AgenceFavoris,
          abonne.BilletsCommandes,
          abonne.TypeUtilisateur
        ];
        final index = abonnes.indexOf(abonne);

        return DataRow(
            color: MaterialStatePropertyAll(index.isEven ? Colors.white : null),
            cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      abonnes.sort((abonne1, abonne2) =>
          compareString(ascending, abonne1.Nom, abonne2.Nom));
    } else if (columnIndex == 1) {
      abonnes.sort((abonne1, abonne2) => compareString(
          ascending, abonne1.AgenceFavoris, abonne2.AgenceFavoris));
    } else if (columnIndex == 2) {
      abonnes.sort((abonne1, abonne2) => compareString(ascending,
          '${abonne1.BilletsCommandes}', '${abonne2.BilletsCommandes}'));
    } else if (columnIndex == 3) {
      abonnes.sort((abonne1, abonne2) => compareString(
          ascending, abonne1.TypeUtilisateur, abonne2.TypeUtilisateur));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

  @override
  Widget build(BuildContext context) {
    var headingText = "Agence";
    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  // verticalDirection: VerticalDirection.down,
                  // mainAxisSize: MainAxisSize.max,
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
                    //         Container(
                    //           padding: const EdgeInsets.only(top: 5),
                    //           decoration: const BoxDecoration(),
                    //           child: Table(
                    //             border: TableBorder.symmetric(
                    //               inside: const BorderSide(
                    //                 color: Color.fromARGB(100, 217, 217, 217),
                    //                 width: 1,
                    //               ),
                    //             ),
                    //             children: [
                    //               TableRow(
                    //                 decoration: const BoxDecoration(),
                    //                 children: [
                    //                   Container(
                    //                       padding: const EdgeInsets.symmetric(
                    //                           vertical: 8.0, horizontal: 16.0),
                    //                       alignment: Alignment.centerLeft,
                    //                       child: Row(children: [
                    //                         const Text(
                    //                           'Nom',
                    //                           style: TextStyle(
                    //                             fontWeight: FontWeight.bold,
                    //                             fontSize: 16.0,
                    //                           ),
                    //                         ),
                    //                         IconButton(
                    //                           icon: Icon(ascendingOrder
                    //                               ? Icons.arrow_drop_up
                    //                               : Icons.arrow_drop_down),
                    //                           color: Colors.black,
                    //                           onPressed: toogleOrder,
                    //                         )
                    //                       ])),
                    //                   Container(
                    //                       padding: const EdgeInsets.symmetric(
                    //                           vertical: 8.0, horizontal: 16.0),
                    //                       alignment: Alignment.centerLeft,
                    //                       child: Row(children: [
                    //                         const Text(
                    //                           'Agences Favoris',
                    //                           style: TextStyle(
                    //                             fontWeight: FontWeight.bold,
                    //                             fontSize: 16.0,
                    //                           ),
                    //                         ),
                    //                         IconButton(
                    //                           icon: const Icon(Icons.arrow_drop_down),
                    //                           color: Colors.black,
                    //                           onPressed: () {},
                    //                         )
                    //                       ])),
                    //                   Container(
                    //                       padding: const EdgeInsets.symmetric(
                    //                           vertical: 8.0, horizontal: 16.0),
                    //                       alignment: Alignment.centerLeft,
                    //                       child: Row(children: [
                    //                         const Text(
                    //                           'Billets Commandes',
                    //                           style: TextStyle(
                    //                             fontWeight: FontWeight.bold,
                    //                             fontSize: 16.0,
                    //                           ),
                    //                         ),
                    //                         IconButton(
                    //                           icon: const Icon(Icons.arrow_drop_down),
                    //                           color: Colors.black,
                    //                           onPressed: () {},
                    //                         )
                    //                       ])),
                    //                   Container(
                    //                       padding: const EdgeInsets.symmetric(
                    //                           vertical: 8.0, horizontal: 16.0),
                    //                       alignment: Alignment.centerLeft,
                    //                       child: Row(children: [
                    //                         const Text(
                    //                           'Type Utilisateur',
                    //                           style: TextStyle(
                    //                             fontWeight: FontWeight.bold,
                    //                             fontSize: 16.0,
                    //                           ),
                    //                         ),
                    //                         IconButton(
                    //                           icon: const Icon(Icons.arrow_drop_down),
                    //                           color: Colors.black,
                    //                           onPressed: () {},
                    //                         )
                    //                       ])),
                    //                 ],
                    //               ),
                    //               for (var row in donnees)
                    //                 TableRow(
                    //                   decoration: BoxDecoration(
                    //                     color: couleurs[20 %
                    //                         couleurs
                    //                             .length], // Couleur de fond de la ligne
                    //                   ),
                    //                   children: [
                    //                     Container(
                    //                       padding: const EdgeInsets.symmetric(
                    //                           vertical: 8.0, horizontal: 16.0),
                    //                       alignment: Alignment.centerLeft,
                    //                       child: Text(row['Nom']),
                    //                     ),
                    //                     Container(
                    //                       padding: const EdgeInsets.symmetric(
                    //                           vertical: 8.0, horizontal: 16.0),
                    //                       alignment: Alignment.centerLeft,
                    //                       child: Text(row['Agence Favoris']),
                    //                     ),
                    //                     Container(
                    //                       padding: const EdgeInsets.symmetric(
                    //                           vertical: 8.0, horizontal: 16.0),
                    //                       alignment: Alignment.centerLeft,
                    //                       child:
                    //                           Text(row['Billets Commande'].toString()),
                    //                     ),
                    //                     Container(
                    //                       padding: const EdgeInsets.symmetric(
                    //                           vertical: 8.0, horizontal: 16.0),
                    //                       alignment: Alignment.centerLeft,
                    //                       child: Text(row['Type Utilisateur']),
                    //                     ),
                    //                     // _buildTableCell('Agence Favoris'),
                    //                     // _buildTableCell('Billets Commande'),
                    //                     // _buildTableCell('Type Utilisateur'),
                    //                   ],
                    //                 ),
                    //             ],
                    //           ),
                    //         ),
                    Container(
                        padding: const EdgeInsets.only(top: 2),
                        width: 1000,
                        height: 570,
                        constraints: const BoxConstraints(
                            minWidth: 1250,
                            maxWidth: 1250,
                            minHeight: 0,
                            maxHeight: 5000),
                        child: ScrollableWidget(child: buildDataTable())),
                  ]),
            )
          ],
        )
      ]),
    );
  }
}
