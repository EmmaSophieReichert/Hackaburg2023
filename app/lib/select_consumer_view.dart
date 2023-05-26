import 'package:flutter/material.dart';
import 'consumer.dart';

class GridItem {

  String title = "";
  Color backgroundColor = Colors.red;
  bool isSelected = false;
  String imgPath  = "";

  GridItem(this.title, this.backgroundColor, this.isSelected, this.imgPath);
}

List<GridItem> gridItems = [
  GridItem('washing machine', Colors.red, false, "...png"),
  GridItem('oven', Colors.blue, false, "...png"),
  GridItem('dryer', Colors.green, false, "...png"),
  GridItem('cooker', Colors.green, false, "...png"),
  GridItem('dishwasher', Colors.green, false, "...png"),
];

class MyGridView extends StatefulWidget {
  @override
  _MyGridViewState createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Anzahl der Spalten in der GridView
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
            color: item.isSelected ? Colors.yellow : item.backgroundColor,
            child: Center(
              child: Text(item.title),
            ),
          ),
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
        title: const Text('First Route'),
      ),
      body: MyGridView(),
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

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}