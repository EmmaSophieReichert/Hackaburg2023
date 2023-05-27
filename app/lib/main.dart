import 'package:flutter/material.dart';
import 'select_consumer_view.dart';
import 'pv_input_view.dart';

void main() {
  runApp(MaterialApp(
    home: YourJourneyScreen(),
    routes: {
      '/energyJourney': (context) => EnergyJourneyScreen(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: {
        //'/': (context) => const MyHomePage(),
        '/energyJourney': (context) => EnergyJourneyScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this MANY times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
           child: const Text('Open route'),
           onPressed: () {
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => const SelectConsumerView()),
             );
             // Navigate to second route when tapped.
           },
         ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class YourJourneyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA6B38F), // Hintergrundfarbe des Titels
        title: Text('Your Journey'),
      ),
      body: Container(
        color: Color(0xFFA6B38F),
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomBox(
                description: 'Next Recommendations',
                time: 'Today, at 3:00 PM',
                recommendation: 'Do the laundry',
                reason: 'Why? High sun exposure',
                buttonLabel: 'Done',
                icon: Icons.alarm, // Beispiel-Icon
                onPressed: () {
                  // Hier können Sie die Funktion für den Button implementieren
                },
              ),
              SizedBox(height: 16.0),
              CustomBox(
                description: 'Current Score',
                currentValue: 0,
                levelThreshold: 500,
                icon: Icons.score, // Beispiel-Icon
              ),
              SizedBox(height: 16.0),
              CustomBox(
                description: 'Total Cost Savings',
                value: '\$0', // Beispielwert
                icon: Icons.attach_money, // Beispiel-Icon
              ),
              SizedBox(height: 16.0),
              CustomBox(
                description: 'Total CO2 Emissions Avoided',
                value: '0g', // Beispielwert
                icon: Icons.cloud, // Beispiel-Icon
              ),
              SizedBox(height: 16.0),
              CustomBox(
                description: 'Current Autonomy Level',
                progress: 0.75, // Beispielwert (75%)
                icon: Icons.battery_full, // Beispiel-Icon
              ),
              ElevatedButton(
                child: const Text('Collect Data'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFC7A486), // Hintergrundfarbe des Buttons
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SelectConsumerView()),
                  );
                  // Navigate to second route when tapped.
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBox extends StatelessWidget {
  final String description;
  final String? time;
  final String? recommendation;
  final String? reason;
  final String? buttonLabel;
  final int? currentValue;
  final int? levelThreshold;
  final String? value;
  final double? progress;
  final IconData? icon;
  final VoidCallback? onPressed;

  const CustomBox({
    required this.description,
    this.time,
    this.recommendation,
    this.reason,
    this.buttonLabel,
    this.currentValue,
    this.levelThreshold,
    this.value,
    this.progress,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Color(0xFFFCFDDB), // Hintergrundfarbe der Boxen
        borderRadius: BorderRadius.circular(10.0), // abgerundete Ecken
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: 32.0, // Größe der Icons
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                if (time != null) ...[
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 16.0,
                        color: Colors.black,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        time!,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
                if (recommendation != null) ...[
                  SizedBox(height: 8.0),
                  Text(
                    recommendation!,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
                if (reason != null) ...[
                  SizedBox(height: 8.0),
                  Text(
                    reason!,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                ],
                if (buttonLabel != null && onPressed != null) ...[
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: onPressed!,
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFA6B38F), // Hintergrundfarbe des Buttons
                    ),
                    child: Text(buttonLabel!),
                  ),
                ],
                if (currentValue != null && levelThreshold != null) ...[
                  SizedBox(height: 8.0),
                  Text(
                    'Level ${currentValue! ~/ levelThreshold!}',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  LinearProgressIndicator(
                    value: (currentValue! % levelThreshold!) / levelThreshold!,
                    backgroundColor: Color(0xFFC7A486), // Farbe der Progressbar
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                ],
                if (value != null) ...[
                  SizedBox(height: 8.0),
                  Text(
                    value!,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
                if (progress != null) ...[
                  SizedBox(height: 8.0),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Color(0xFFC7A486), // Farbe der Progressbar
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}