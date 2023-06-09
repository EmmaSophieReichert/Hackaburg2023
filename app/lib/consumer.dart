class Consumer {
  String name;
  double power;
  String unit;
  String iconID;

  Consumer(this.name, this.power, this.unit, this.iconID);
}

List<Consumer> consumerList = [
  //TODO: iconIDs anpassen
  Consumer("washing machine", 0.58, "kWh", "0"),
  Consumer("oven", 0.74, "kWh", "0"),
  Consumer("dryer", 5.04, "kWh", "0"),
  Consumer("cooker", 1.5, "kWh", "0"),
  Consumer("dishwasher", 1.05, "kWh", "0"),
];

Consumer findConsumerByName(String name) {
  return consumerList.firstWhere((item) => item.name == name);
}

class Person {
  double nModule; //Anzahl der Module
  double aModule; //Größe eines Moduls in qm
  String alignment; //Ausrichtung der Anlage --> Dropdown (Nord, Süd, West, Ost) später mehr
  List<Consumer> consumerList = <Consumer>[];

  Person(this.nModule, this.aModule, this.alignment, this.consumerList);

  double getNModule(){
    return nModule;
  }

  double getAModule(){
    return aModule;
  }
}