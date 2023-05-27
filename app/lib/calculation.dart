import datetime;

class SolarCalculation {

  double calculate_yield(Date date) {
    return calculate_eInclined(date) * calculate_aPlant() * 0.15; //0.15 % als Wirkungsgrad der PV Module (erstmal fixwert angenommen)
  }


  double calculate_eInclined(Date date) {
    // Datum+Stunde, nach dem gesucht wird
    final input = File('//path').openRead();
    final eInclined = await input.transform(utf8.decoder).transform(
        CsvToListConverter()).toList();
    for (var row in eInclined) {
      if (row[0] == date) {
        return row[1]; //aus zeitreihe die entsprechende Stunde
        break; // Falls nur der erste passende Wert ausgegeben werden soll
      }
    }
  }


  double calculate_aPlant(Person &p){
    return p.getAModule() * p.getNModule();
  }


  double calculate_daily_forecast(Person &p, Date date){ //Startzeitpunkt
    List<double> eResult = [];
    for (int i = 0; i < 24; i++) {
      eResult.add(calculate_eInclined(date));
      date = dateTime.add(Duration(hours: 1)); // Zeit um 1 Stunde erhöhen
    }
    double multiplier = calculate_aPlant(p) * 0.15
    List<double> pResult = eResult.map((eResult) => eResult * multiplier).toList();
    return pResult;
  }

}
