import 'package:Phasmonomicon/data/Model.dart';

import 'Item.dart';

class Evidence {

  final int id;
  final String name;
  final List<String> tips;
  final List<int> seeAlsoItemIds;
  final String assetName;

  Evidence({this.id, this.name, this.tips, this.seeAlsoItemIds, this.assetName});

  //Identifying Evidence
  factory Evidence.fingerprints() {
    return Evidence(id: 1,
      name: "Fingerabdrücke",
      seeAlsoItemIds: [7,8],
      tips: [
        "Taucht auf, sobald ein Geist an ein Fenster klopft oder eine Tür berührt",
        "Verursacht keine EMF-Aktivität"
      ],
      assetName: "icon_fingerprint.png");
  }
  factory Evidence.ghostBook() {
    return Evidence(id: 2,
      name: "Geisterschrift",
      seeAlsoItemIds: [6],
      tips: [
        "Teil einer 5-in-12-Chance von Geistern, eine zufällige Interaktion durchzuführen",
        "Muss scheinbar nicht im Geisterraum liegen, um beschrieben zu werden (noch nicht bestätigt)"
      ],
      assetName: "icon_spellbook.png"
    );
  }
  factory Evidence.emfFive() {
    return Evidence(id: 3,
      name: "EMF Level 5",
      seeAlsoItemIds: [3],
      tips: [
        "Ausschließlich als Beweismittel für Geister eingesetzt",
        "Tritt zu 25% auf, wenn der Geist (wenn er EMF Level 5 als Beweis hat) mit etwas interagiert und sonst ein EMF-Level-2 Signal verursachen würde"
      ],
      assetName: "icon_emfReader.png"
    );
  }
  factory Evidence.ghostBox() {
    return Evidence(id: 4,
      name: "Geisterbox",
      seeAlsoItemIds: [5],
      tips: [
        "Funktioniert nur mit Push-To-Talk oder Voice-Aktivierung",
        "Geister antworten nur, wenn sie sich auf der gleichen Etage in einem 3m-Radius von dir befinden",
        "Geister verstehen auch Beleidigungen, wodurch die Chance auf eine Antwort bzw. Jagd steigt"
      ],
      assetName: "icon_spiritBox.png"
    );
  }
  factory Evidence.freezingTemperatures() {
    return Evidence(id: 5,
      name: "Gefriertemperaturen",
      seeAlsoItemIds: [4],
      tips: [
        "Geister mit 'Gefriertemperaturen'-Eigenschaft senken die Temperatur auf -10°C, andere auf 5°C",
        "Der Thermometer hat eine Zufallsabweichung von +-2°C, wird also eine Temperatur unter 3°C gemessen, kann dieser Hinweis abgehakt werden"
      ],
      assetName: "icon_freezingTemperature.png"
    );
  }
  factory Evidence.ghostOrbs() {
    return Evidence(id: 6,
      name: "Geisterkugeln",
      seeAlsoItemIds: [2, 19],
      tips: [
        "Erscheinen nur im Lieblingsraum des Geistes",
        "Können auch aus dem Gang vor dem Raum bzw. von außerhalb des Hauses im Türstock gesehen werden"
      ],
      assetName: "icon_ghostOrbs.png"
    );
  }

  List<Item> get seeAlsoItems {
    if(seeAlsoItemIds == null || seeAlsoItemIds.length == 0) {
      return null;
    }
    return Model.itemsBase.where((item) => (seeAlsoItemIds.contains(item.id))).toList();
  }

}