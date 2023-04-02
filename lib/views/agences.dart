import 'package:flutter/material.dart';
import 'package:landflight_agency_dashboard/Widget/DashbardAgenceW.dart';
import 'package:landflight_agency_dashboard/Widget/appbarAgence.dart';
import 'package:landflight_agency_dashboard/Widget/scroll_widget.dart';
import 'package:landflight_agency_dashboard/data/listAgences.dart';
import 'dart:core';

import 'package:landflight_agency_dashboard/modele/Agences_model.dart';

class AgenceP extends StatefulWidget {
  const AgenceP({super.key});

  @override
  State<AgenceP> createState() => _AgencePState();
}

class _AgencePState extends State<AgenceP> {
  late List<Agences> agences;
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

    this.agences = List.of(allAgences);
  }

  Widget buildDataTable2() {
    final columns = [
      'Nom',
      'Description',
      "Nombre d'abonnes",
      "Nombre d'abonnes favoris"
    ];

    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      columnSpacing: 15,
      rows: getRows(agences),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<Agences> agences) => agences.map((Agences agence) {
        final cells = [
          agence.Nom,
          agence.Description,
          agence.NombreAbonnes,
          agence.NombreAbonnesFavoris
        ];
        final index = agences.indexOf(agence);

        return DataRow(
            color: MaterialStatePropertyAll(index.isEven ? Colors.white : null),
            cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      agences.sort((agence1, agence2) =>
          compareString(ascending, agence1.Nom, agence2.Nom));
    } else if (columnIndex == 1) {
      agences.sort((agence1, agence2) =>
          compareString(ascending, agence1.Description, agence2.Description));
    } else if (columnIndex == 2) {
      agences.sort((agence1, agence2) => compareString(
          ascending, '${agence1.NombreAbonnes}', '${agence2.NombreAbonnes}'));
    } else if (columnIndex == 3) {
      agences.sort((agence1, agence2) => compareString(
          ascending,
          '${agence1.NombreAbonnesFavoris}',
          '${agence2.NombreAbonnesFavoris}'));
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

                    // Appel du tableau
                    Container(
                        padding: const EdgeInsets.only(top: 2),
                        width: 1000,
                        height: 570,
                        constraints: const BoxConstraints(
                            minWidth: 1250,
                            maxWidth: 1250,
                            minHeight: 0,
                            maxHeight: 5000),
                        child: ScrollableWidget(child: buildDataTable2())),
                  ]),
            )
          ],
        )
      ]),
    );
  }
}
