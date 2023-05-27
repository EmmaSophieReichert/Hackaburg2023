import 'package:flutter/material.dart';
import 'consumer.dart';
import 'pv_input_view.dart';

class GridItem {

  String title = "";
  Color backgroundColorHex = const Color(0xFFFCFDDB);
  bool isSelected = false;
  String imgPath  = "";

  GridItem(this.title, this.isSelected, this.imgPath);
}

List<GridItem> gridItems = [
  GridItem('washing machine', false, "assets/images/consumer/washing machine.png"),
  GridItem('oven', false, "assets/images/consumer/oven.png"),
  GridItem('dryer', false, "assets/images/consumer/dryer.png"),
  GridItem('cooker', false, "assets/images/consumer/cooker.png"),
  GridItem('dishwasher', false, "assets/images/consumer/dishwasher.png"),
];

class MyGridView extends StatefulWidget {
  @override
  _MyGridViewState createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints)
    {
      final screenWidth = constraints.maxWidth;
      final cardWidth = screenWidth * 0.25; // 25% der Bildschirmbreite
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Anzahl der Spalten in der GridView
          childAspectRatio: cardWidth / cardWidth, // Seitenverhältnis für die Karten
        ),
        itemCount: gridItems.length,
        itemBuilder: (BuildContext context, int index) {
          GridItem item = gridItems[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                item.isSelected = !item.isSelected;
              });
            },
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20.0), // abgerundete Ecken
                ),
                color: item.isSelected ? Colors.brown : item.backgroundColorHex,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Color(0xFFA6B38F), // Farbe, die dem Icon gegeben werden soll
                            BlendMode.srcIn,
                          ),
                          child: Image.asset(
                            item.imgPath,
                            fit: BoxFit.contain, // Anpassen, um das ganze Bild anzuzeigen
                            width: cardWidth, // Breite des Bildes entsprechend der Kartenbreite
                            height: cardWidth,
                          ),
                      ),
                      SizedBox(height: 8),
                      // Abstand zwischen Bild und Beschreibung
                      Text(
                        item.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black, // Textfarbe des Titels
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
    );
  }
}

class SelectConsumerView extends StatelessWidget {
  const SelectConsumerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA6B38F),
        title: const Text('First Route'),
      ),
      body: Container(
        color: Color(0xFFC7A486), // Hintergrundfarbe des Containers
        child: Column(
          children: [
            Expanded(
              child: MyGridView(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFA6B38F), // Hintergrundfarbe des Buttons
              ),
              onPressed: () {
                var selectedNames = [];
                for (GridItem item in gridItems) {
                  if(item.isSelected){
                    selectedNames.add(item.title);
                  }
                  // Code, der in jedem Schleifendurchlauf mit dem aktuellen Listenelement ausgeführt wird
                }
                print(selectedNames);
                Navigator.pushNamed(context, '/energyJourney');
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

  //Center(
//         child: ElevatedButton(
//           child: const Text('Open route'),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const SecondRoute()),
//             );
//             // Navigate to second route when tapped.
//           },
//         ),
//       )

}
