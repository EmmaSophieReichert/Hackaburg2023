import 'package:flutter/material.dart';

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
  TextEditingController _modulePowerController = TextEditingController();
  TextEditingController _roofPitchController = TextEditingController();

  @override
  void dispose() {
    _moduleCountController.dispose();
    _modulePowerController.dispose();
    _roofPitchController.dispose();
    super.dispose();
  }

  void _saveData() {
    if (_formKey.currentState!.validate()) {
      String moduleCount = _moduleCountController.text;
      String modulePower = _modulePowerController.text;
      String roofPitch = _roofPitchController.text;

      // Hier können Sie die gesammelten Daten in einer Klasse abspeichern oder weiterverarbeiten

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data saved')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start your Energy Journey!'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Please enter data about your PV system',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    Text('Power per Module'),
                    TextFormField(
                      controller: _modulePowerController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the power per module';
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
    );
  }
}
