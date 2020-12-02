import 'package:Phasmonomicon/data/Evidence.dart';
import 'package:Phasmonomicon/data/Model.dart';

class Ghost {

  final int id;
  final String name;
  final String weakness;
  final String strength;
  final List<int> evidenceIds;
  final List<String> specialPowerDescription;

  Ghost(this.id, this.name, this.weakness, this.strength, this.evidenceIds, this.specialPowerDescription);

  List<Evidence> get evidences {
    return Model.evidencesBase.where((evidence) => this.evidenceIds.contains(evidence.id)).toList();
  }

  factory Ghost.spirit() {
    return Ghost(1, "Spirit", "Räucherstäbchen halten Spirits für 180s anstatt 90s auf", null, [1,2,4], null);
  }
  factory Ghost.wraith() {
    return Ghost(2, "Wraith", "Giftige Reaktion auf Salz", "Berührt nie den Boden, hinterlässt keine Fußspuren", [1,4,5], [
      "Ein zufälliger Spieler wird ausgewählt",
      "Ist der gewählte Spieler außerhalb des Hauses oder tot, kehrt der Geist in die Idle-Phase zurück",
      "Ist der Spieler im Haus und nicht tot, teleportiert sich der Geist an einen Ort innerhalb eines 3m-Radius vom gewählten Spieler und kehrt in die Idle-Phase zurück"
    ]);
  }
  factory Ghost.phantom() {
    return Ghost(3, "Phantom", "Verschwindet kurz, wenn man es fotografiert", "Sanity fällt extrem schnell, wenn man es ansieht", [3,5,6], [
      "Das Phantom navigiert zur Position eines zufällig gewählten Spielers",
      "Es erstellt ein EMF-2-Signal an seinem 'raycastPoint'",
      "Sobald es die Position des Spielers erreicht hat, kehrt es in die Idle-Phase zurück"
    ]);
  }
  factory Ghost.poltergeist() {
    return Ghost(4, "Poltergeist", "Ineffektiv in leeren Räumen", "Kann mehrere Objekte auf einmal werfen", [1,4,6], [
      "Hat der Poltergeist keine Objekte zum Interagieren, kehrt er in die Idle-Phase zurück",
      "Sind interagierbare Objekte vorhanden, wirft der Geist ALLE mit einer zufälligen Kraft von [(-4,4), (-2,2), (-4,4)] und erstellt ein EMF-3-Signal an den Positionen der geworfenen Objekte",
      "War der Spieler nicht in Sichtlinie des EMF-Signals, wird die Sanity des Spielers um 2x die Zahl der geworfenen Gegenstände verringert"
    ]);
  }
  factory Ghost.banshee() {
    return Ghost(5, "Banshee", "Hunting-Phase wird bei einem Kruzifix in 5m Nähe statt 3m verhindert", "Verfolgt genau eine Person während der Hunting-Phase", [1,3,5], [
      "Ist das aktuelle Ziel des Banshees außerhalb des Hauses, benutzt es seine Fähigkeit nicht",
      "Der Geist bewegt sich zur Position des Ziel-Spielers",
      "Der Geist wartet 20s, und ist der Spieler dann nicht sichtbar, wechselt er in die Hunting-Phase (Ist das aktuelle Spiel ein Tutorial, kehrt er in die Idle-Phase zurück)"
    ]);
  }
  factory Ghost.jinn() {
    return Ghost(6, "Dschinn", "Abschalten der Stromquelle hindert den Geist, seine Fähigkeit einzusetzen", "Je weiter weg vom Spieler, desto schneller bewegt er sich", [3,4,6], [
      "Ist der Stromkasten abgeschaltet, benutzt der Geist seine Fähigkeit nicht und kehrt in die Idle-Phase zurück",
      "Wechselt der Geist in den Ability-State, wartet er 5s, bevor er seine Fähigkeit einsetzt",
      "Ist ein Spieler innerhalb eines 3m-Radius vom Geist, wenn er seine Fähigkeit einsetzt, verringert sich die Sanity des Spielers um 25%",
      "Ein EMF-2-Signal wird an der 'raycastPoint'-Position des Geistes erstellt",
      "Hat ein Jinn seine Fähigkeit benutzt, kann er das für die nächsten 100s nicht erneut"
    ]);
  }
  factory Ghost.mare() {
    return Ghost(7, "Mare", "Anschalten der Lichter verringert die Chance auf Angriffe", "Höhere Chance auf Angriffe im Dunkeln", [4,5,6], null);
  }
  factory Ghost.revenant() {
    return Ghost(8, "Revenant", "Versteckt man sich, bewegt sich der Geist sehr langsam", "Während der Hunting-Phase bewegt er sich schneller", [1,2,3], null);
  }
  factory Ghost.shade() {
    return Ghost(9, "Shade", "Wechselt nicht in die Hunting-Phase, wenn mehrere Spieler beieinander sind", "Durch seine Schüchternheit ist er schwer zu finden", [2,3,6], null);
  }
  factory Ghost.demon() {
    return Ghost(10, "Dämon", "Befragungen mit dem Ouija Board verringern nicht die Sanity", "Viel aggressiver als andere Geister", [2,4,5], null);
  }
  factory Ghost.yurei() {
    return Ghost(11, "Yurei", "Verwendung von Räucherstäbchen verhindert das Herumwandern des Geistes für 90s", "Starker Effekt auf Sanity", [2,5,6], null);
  }
  factory Ghost.oni() {
    return Ghost(12, "Oni", "Durch seine hohe Aktivität ist er leicht zu finden und zu identifizieren", "Aktiver, wenn mehrere Spieler beieinander sind", [2,3,4], null);
  }

}