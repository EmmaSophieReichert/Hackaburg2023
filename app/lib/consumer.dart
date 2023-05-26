class Consumer {
  String name;
  double power;
  String unit;
  String iconID;

  Consumer(this.name, this.power, this.unit, this.iconID);

}

class ConsumerList {
  //TODO: iconIDs anpassen
  Consumer waschmaschine = new Consumer{"Waschmaschine", 0.58, "kWh", 0};
  Consumer backofen = new Consumer{"Backofen", 0.74, "kWh", 0};
  Consumer trockner = new Consumer{"Trockner", 5.04, "kWh", 0};
  Consumer herd = new Consumer{"Herd", 1.5, "kWh", 0};
  Consumer geschirrspueler = new Consumer{"Geschirrspülmaschine", 1.05, "kWh", 0};
}

class Person {
  final consumerList = <Consumer>[];
}