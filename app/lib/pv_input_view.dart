import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(MaterialApp(
    home: EnergyJourneyScreen(),
  ));
}

class EnergyJourneyScreen extends StatefulWidget {
  @override
  _EnergyJourneyScreenState createState() => _EnergyJourneyScreenState();
}

class _EnergyJourneyScreenState extends State<EnergyJourneyScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedDirection = 'North';

  TextEditingController _moduleCountController = TextEditingController();
  TextEditingController _moduleSizeController = TextEditingController();
  TextEditingController _roofPitchController = TextEditingController();
  TextEditingController _powerConsumptionController = TextEditingController();

  @override
  void dispose() {
    _moduleCountController.dispose();
    _moduleSizeController.dispose();
    _roofPitchController.dispose();
    _powerConsumptionController.dispose();
    super.dispose();
  }

  void _saveData() {
    if (_formKey.currentState!.validate()) {
      String moduleCount = _moduleCountController.text;
      String moduleSize = _moduleSizeController.text;
      String roofPitch = _roofPitchController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data saved')),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => YourJourneyScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA6B38F),
        title: Text('Start your Energy Journey!'),
      ),
      body: Container(
        color: Color(0xFFC7A486), // Hintergrundfarbe des Containers
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Please enter data about your power consumption in kwh',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: _powerConsumptionController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the number of modules';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Please enter data about your PV system',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text('Number of Modules'),
                      TextFormField(
                        controller: _moduleCountController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the number of modules';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Text('Size of one Module in qm'),
                      TextFormField(
                        controller: _moduleSizeController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the size per module';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Text('Roof Pitch'),
                      TextFormField(
                        controller: _roofPitchController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the roof pitch';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Text('Roof Direction'),
                      DropdownButton<String>(
                        value: _selectedDirection,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedDirection = newValue!;
                          });
                        },
                        items: [
                          DropdownMenuItem(
                            value: 'North',
                            child: Text('North'),
                          ),
                          DropdownMenuItem(
                            value: 'North-East',
                            child: Text('North-East'),
                          ),
                          DropdownMenuItem(
                            value: 'East',
                            child: Text('East'),
                          ),
                          DropdownMenuItem(
                            value: 'South-East',
                            child: Text('South-East'),
                          ),
                          DropdownMenuItem(
                            value: 'South',
                            child: Text('South'),
                          ),
                          DropdownMenuItem(
                            value: 'South-West',
                            child: Text('South-West'),
                          ),
                          DropdownMenuItem(
                            value: 'West',
                            child: Text('West'),
                          ),
                          DropdownMenuItem(
                            value: 'North-West',
                            child: Text('North-West'),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Center(
                        child: ElevatedButton(
                          onPressed: _saveData,
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFA6B38F), // Hintergrundfarbe des Buttons
                          ),
                          child: Text('Save'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
