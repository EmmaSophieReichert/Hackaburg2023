class Consumer {
  String name;
  double power;
  String unit;
  String iconID;

  Consumer(this.name, this.power, this.unit, this.iconID);

}

class ConsumerList {
  //TODO: iconIDs anpassen
  Consumer waschmaschine = Consumer("Waschmaschine", 0.58, "kWh", "0");
  Consumer backofen = Consumer("Backofen", 0.74, "kWh", "0");
  Consumer trockner = Consumer("Trockner", 5.04, "kWh", "0");
  Consumer herd = Consumer("Herd", 1.5, "kWh", "0");
  Consumer geschirrspueler = Consumer("Geschirrspülmaschine", 1.05, "kWh", "0");
}

class Person {
  final consumerList = <Consumer>[];
}