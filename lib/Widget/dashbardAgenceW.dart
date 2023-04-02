import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:landflight_agency_dashboard/views/abonnes.dart';
import 'package:landflight_agency_dashboard/views/agences.dart';
import 'package:landflight_agency_dashboard/views/dashboard.dart';
import 'package:landflight_agency_dashboard/views/gestion_post.dart';
import 'package:landflight_agency_dashboard/views/offres.dart';
import 'package:landflight_agency_dashboard/views/rappport_stat.dart';

//Widget pour le tableau de bord de l'agence

Widget DashboardAgenceW(BuildContext context) {
  return Column(
    children: [
      const SizedBox(
        width: 12,
      ),
      const Image(
        image: AssetImage('images/logo.png'),
        height: 160,
        width: 160,
      ),
      const SizedBox(
        height: 20,
      ),
      TextButton(
        onPressed: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const Dashboard(),
              ));
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Dashboard',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
      const Text("_________________________________________"),
      const SizedBox(
        height: 50,
      ),
      TextButton(
        onPressed: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const AbonnesP(),
              ));
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Mes Abonnes',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
      const Text("_________________________________________"),
      const SizedBox(
        height: 50,
      ),
      TextButton(
        onPressed: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const Posts(),
              ));
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Gestion des postes',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
      const Text("_________________________________________"),
      const SizedBox(
        height: 50,
      ),
      TextButton(
        onPressed: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const Offres(),
              ));
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Publier une offre',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
      const Text("_________________________________________"),
      const SizedBox(
        height: 15,
      ),
      const Icon(
        Icons.workspace_premium,
        color: Colors.yellow,
        size: 30,
      ),
      const SizedBox(
        height: 10,
      ),
      TextButton(
        onPressed: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const AgenceP(),
              ));
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Autres agences',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
      const Text("_________________________________________"),
      const SizedBox(
        height: 20,
      ),
      TextButton(
        onPressed: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const Rapports(),
              ));
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Rapport et statistiques',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      const Text("_________________________________________"),
      const SizedBox(
        height: 23,
      ),
      TextButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.logout),
        label: const Text("Se déconnecter"),
      ),
    ],
  );
}

Column dashboardMenuElement(String text) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      const Text("_________________________________________"),
    ],
  );
}
