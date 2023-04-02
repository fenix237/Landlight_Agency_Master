import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
  Padding dashboardCard(
    String cardText,
    Color color,
    bool hasPremium,
    IconData icons,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        left: 150,
      ),
      child: Container(
        height: 200,
        width: 200,
        decoration: const BoxDecoration(
          //couleur du container
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        //if the card contains premium image; then load appropriate card
        child: hasPremium
            ? Column(
                children: [
                  Stack(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 160),
                        child: Icon(
                          Icons.workspace_premium,
                          color: Colors.yellow,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    icons,
                    color: color,
                    size: 38,
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  Text(
                    "12",
                    style: TextStyle(
                      color: color,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    width: 200,
                    height: 40,
                    child: Center(
                      child: Text(
                        cardText,
                        style: TextStyle(
                          backgroundColor: color,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Icon(
                    icons,
                    color: color,
                    size: 48,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "12",
                    style: TextStyle(
                      color: color,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 53,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    width: 200,
                    height: 40,
                    child: Center(
                      child: Text(
                        cardText,
                        style: TextStyle(
                          backgroundColor: color,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
