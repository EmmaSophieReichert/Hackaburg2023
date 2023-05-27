/*
import 'dart:math';
import datetime
import pytz

class SolarCalculation {

  //calculated Attributes
  double yield; //W
  double eInclined; // W/m2
  double aPlant;  //m2

  double E_dir_incl;
  double E_diff_incl;
  double E_refl_incl;

  double einfallswinkel;
  double zenitwinkel;
  double deklination;
  double ebenenwinkel;

  double eqt;


  //user Attributes
  double aModul;
  int nModule;
  double neigung;
  double latitude;
  double winkeldefinition;


  //API Attributes
  double radiation.dni = 500; //direkt
  double radiation.dhi = 500; //diffuse
  double radiation.ghi = 1000; //global


  void calculate_yield() {
    calculate_eInclined()
    calculate_aPlant()
    yield = eInclined * aPlant * 0.15; //0.15 % als Wirkungsgrad der PV Module (erstmal fixwert angenommen)
  }

  void calculate_eInclined(DoY) {
    calculate_radiation(DoY)
    eInclined = E_dir_incl + E_diff_incl + E_refl_incl;
  }

  void calculate_aPlant(){
    aPlant = aModul * nModule;
  }

  void calculate_radiation(DoY){
    calculate_sonnenhoehe(DoY)
    calculate_zenitwinkel()
    calculate_einfallswinkel()

    E_dir_incl = radiation.dni * cos(einfallswinkel)/cos(zenitwinkel)
    E_diff_incl = radiation.dhi  * 0.5 *(1+cos(ebenenwinkel))
    E_refl_incl = radiation.ghi  * 0.5 * (1+cos(ebenenwinkel)) * 0.2 //Albedowert
  }

  void calculate_einfallswinkel(){
    calculate_ebenenwinkel()
    calculate_sonnenazimut()
    einfallswinkel = arccos(-cos(sonnenhoehe) * sin(ebenenwinkel) * cos(sonnenazimut - get_winkeldefinition_in_grad()) + sin(sonnenhoehe) * cos(ebenenwinkel);
    }

  void calculate_zenitwinkel(){
    zenitwinkel = 90 - sonnenhoehe;
  }

  void calculate_sonnenhoehe(DoY){
    calculate_deklination(DoY)
    sonnenhoehe = arcsin(cos(latitude) * cos(deklination) *cos(stundenwinkel) + sin(latitude) * sin(deklination);
    }

  void calculate_ebenenwinkel(){
    ebenenwinkel = neigung + 90;
  }

  void calculate_sonnenazimut(){
    //hier ifelse je nach solarzeit
  }

  int get_winkeldefinition_in_grad() {
    //ausrichtung der Anlage
    switch (winkeldefinition) {
      case North:
        return 180;
        break;

      case East:
        return 270;
        break;

      case South:
        return 0;
        break;

      case West:
        return 90;
        break;
    }
  }

  void calculate_deklination(DoY){
    deklination = 23.25 * sin((360/365)*(DoY + 284);
    }

  void calculate_solarzeit(DoY,time){
    calculate_EqT(DoY)

    aktuelles_datum = DoY;
    aktuelle_zeit = time;
    zeitzone = pytz.timezone('Europe/Berlin') // Zeitzone des Standorts festlegen (hier: Berlin)
    aktuelle_zeitpunkt = datetime.datetime.combine(aktuelles_datum, aktuelle_zeit) // Kombinieren von Datum und Zeit in ein DateTime-Objekt
    lokaler_zeitpunkt = zeitzone.localize(aktuelle_zeitpunkt) //Konvertieren der Zeitzone des Standorts
    solarzeit = lokaler_zeitpunkt + datetime.timedelta(minutes=laengengrad * 4) + datetime.timedelta(minutes=eqt) //Berechnung der Solarzeit unter Verwendung des Längengrads
  }

  void calculate_EqT(DoY) {
    b = 2 * math.pi * (DoY - 81) / 365
    eqt = 9.87 * math.sin(2 * b)
  }
}
*/