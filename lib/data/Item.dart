import 'package:Phasmonomicon/data/Model.dart';

import 'Evidence.dart';

class Item {

  final int id;
  final String name;
  final int resultingEvidenceId;
  final List<String> descriptions;

  Item(this.id, this.name, this.resultingEvidenceId, this.descriptions);

  factory Item.candle() {
    return Item(1, "Kerze", -1, [
      "Geben auch ohne Strom Licht",
      "Brennen für eine zufällige Zeit zwischen 2.5 und 5 Minuten (Zeit wird bei Entzünden der Kerze festgelegt)",
      "Können von Geistern ausgeblasen werden"
    ]);
  }
  factory Item.videoCamera() {
    return Item(2, "Video-Kamera", 6, [
      "Überträgt Live-Bilder an den Computer im Van",
      "Lohnt sich mitzunehmen, wenn der Lieblingsraum des Geistes bereits bekannt ist",
      "In der Lage, Geisterkugeln sichtbar zu machen",
      "Wenn der Stromkasten ausgeschaltet ist, kein Licht brennt, und der Geist ins Blickfeld einer Kamera gerät, kann der Geist die Kamera abschalten"
    ]);
  }
  factory Item.emfReader() {
    return Item(3, "EMF-Reader", 3, [
      "Misst Änderungen umliegender elektromagnetischer Felder und somit Interaktionen und Anwesenheit von Geistern",
      "Level 1: Standard",
      "Level 2: Der Geist hat mit etwas in der Nähe interagiert",
      "Level 3: Der Geist hat etwas in der Nähe geworfen",
      "Level 4: Der Geist ist vor kurzem hier erschienen (Tritt zu Beginn der Hunting-Phase und bei zufälligen Erscheinungs-Events auf)",
      "Level 5: Ausschließlich als Beweis eingesetzt (tritt zu 25% auf, wenn der Geist eine EMF-Stufe 5 als Beweisattribut hat und ein Stufe-2-Signal hervorrufen würde)",
      "Sämtliche EMF-Signale verschwinden nach 20 Sekunden, auch wenn der Geist nach der Zeit noch im Raum ist",
      "Misst anhand seiner Weltposition, nicht der Blickrichtung",
      "EMF-Lesungen können sich bei Rotation ändern, wenn sich das Gerät in zwei überlappenden EMF-Zonen befindet (zeigt höchste Stufe der kollidierenden Zonen)",
      "Der EMF-Graph im Van zeigt die Summe aller EMF-Signale im Haus an, mit einem Maximalwert von 10 begrenzt"
    ]);
  }
  factory Item.thermometer() {
    return Item(4, "Thermometer", 5, [
      "Schießt einen 6m-Ray aus dem Griff (nicht der Vorderseite) und zeigt die Temperatur des ersten Orts, den der Ray trifft",
      "Wenn der Raycast fehlschlägt, wird die Temperaturanzeige nicht aktualisiert"
    ]);
  }
  factory Item.ghostBox() {
    return Item(5, "Geister-Box", 4, [
      "Ermöglicht, mit dem Geist zu kommunizieren und auch Antworten zu erhalten",
      "Geister können nur alle 10 Sekunden antworten",
      "'Nothing detected' bedeutet, dass das Spiel die Phrase verstanden, aber einen Fail Check ausgelöst hat. Fail Checks und Antworten schließen sich gegenseitig NICHT aus",
      "Geister, die die Geisterbox nicht als Beweis haben, werden nie antworten",
      "Funktioniert nur, wenn Push-To-Talk aktiviert bzw. ein VR-Headset aufgesetzt wird. Ist Voice-Aktivierung aktiv, hört dich der Geist immer",
      "Geister antworten nicht, wenn sie auf einer anderen Etage oder weiter als 3m von dir weg sind",
      "Geister antworten nicht, wenn der Stromkasten an und im aktuellen Raum ein Lichtschalter aktiviert ist",
      "Geister antworten eher, wenn du sie vor kurzem mit einer grundlegenden Phrase oder mit ihrem Namen gereizt hast",
      "Ausgehend davon, ob der Geist mindestens 4m entfernt ist, werden unterschiedliche Location-Sounds gespielt"
    ]);
  }
  factory Item.ghostBook() {
    return Item(6, "Geisterbuch", 2, [
      "Kann bei einer 5-in-12-Chance vom Geist beschrieben werden (Teil der zufälligen Interaktionen mit Gegenständen eines Geistes)",
      "Kann auch beschrieben werden, während es von einem Spieler gehalten wird",
      "Muss scheinbar nicht im Geisterraum liegen, um beschrieben zu werden (noch nicht bestätigt)"
    ]);
  }
  factory Item.uvLamp() {
    return Item(7, "UV-Lampe", 1, [
      "Wird verwendet, um Fingerabdrücke von Geistern zu finden",
      "Erst nach einiger Zeit interessant, da zu Beginn kaum Abdrücke zu finden sind",
      "Fingerabdrücke sind oft auf Lichschaltern, Türen oder Fenstern zu finden"
    ]);
  }
  factory Item.glowstick() {
    return Item(8, "Knicklicht", 1, [
      "Funktioniert nach dem gleichen Prinzip wie die UV-Lampe und enthüllt Fingerabdrücke",
      "Strahlt Licht in alle Richtungen, mit einem Durchmesser von einem halben Türstock",
      "Leuchtet so lange, bis es flach am Boden liegt - kann also in eine Ecke gelehnt werden, um dem zu entgehen",
      "Enthüllt Fußabdrücke, wenn es neben Salz platziert wird",
      "An zufälligen Zeiten und Orten hört das Knicklicht zu leuchten auf, wenn es am Boden platziert wird (unbekannt warum und was dagegen getan werden kann)"
    ]);
  }
  factory Item.photoCamera() {
    return Item(9, "Foto-Kamera", -1, [
      "Man muss beim Fotografieren innerhalb eines 5m-Radius des fotografierten Objekts stehen, damit es im Journal zählt",
      "Photos werden mithilfe eines Raycasts von der Weltposition der Kamera aus nach Beweisobjekten gescannt, der durch jemanden zwischen dir und dem fotografierten Objekt gestört werden kann",
      "Raycasts werden zum 'raycastPoint' des Geists gesendet, welcher nicht unbedingt am Kopf des Geistes sitzen muss. Stelle also sicher, dass du den ganzen Geist im Bild hast",
      "Folgende Fotos zählen: EMF-Signale, Ouija Board, Fingerabdrücke, Fußabdrücke, Knochen, Geister, tote Körper, dreckiges Wasser",
      "Phantome verschwinden, nachdem du ein Foto von ihnen machst. Dies entfernt auch deren Sanity-Drain-Effekt"
    ]);
  }
  factory Item.salt() {
    return Item(10, "Salz", -1, [
      "Enthüllt Fußabdrücke von Geistern (bis auf Wraiths)",
      "Geister treten nur einmal auf Salz",
      "Geister während der Hunting-Phase werden von Salz nicht betroffen"
    ]);
  }
  factory Item.smudgeStick() {
    return Item(11, "Räucherstäbchen", -1, [
      "Benötigt ein Feuerzeug im Inventar zum Entzünden",
      "Wird ein Räucherstäbchen angezündet, überprüft das Spiel, ob sich der Geist in einem 6m Radius der Räucherstäbchen befindet. Ist dies der Fall, wird:",
      "Eine Zufallszahl zwischen 20 und 30 zum Aktivitätsmultiplikator des Geists addiert",
      "Der Geist für 90s (oder 180s für Spirits) vor dem Eintreten in die Hunting-Phase gehindert",
      "Ein Geist in der Hunting-Phase für 5s aufgehalten",
      "Ein Yurei für 90s vom Herumwandern gestoppt"
    ]);
  }
  factory Item.soundSensor() {
    return Item(12, "Geräuschsensor", -1, [
      "Bietet Daten über die lauteste Geräuschquelle, die es aufnimmt",
      "Basiert auf Kollisionen seiner Weltposition mit unterschiedlich großen Box-Collidern von Geräusch-Triggern",
      "Werte werden alle 5 Sekunden im Van aktualisiert",
      "Geräuschquellen: Auto, Türen, EMF-Reader, Geisterbox, Schritte, Stromkasten, geworfene Objekte, Kameraverschlüsse, Feuerzeug, Bewegungssensor, Ouija Boards, Pillen, Fallende Gemälde, Spieler-Sprachaktivierung, Salz, Waschbecken, Thermometer, Fackeln"
    ]);
  }
  factory Item.parabolicSensor() {
    return Item(13, "Parabolischer Sensor", -1, [
      "Bietet Daten über die Summe aller aufgenommenen Geräuschquellen",
      "Basiert, ebenso wie der Geräuschsensor, auf Kollisionen seiner Weltpositionen mit Geräusch-Trigger-Kollisionsboxen",
      "Werte werden alle 1-2 Sekunden im Van aktualisiert",
      "Geräuschquellen: Siehe Geräuschsensor"
    ]);
  }
  factory Item.ouijaBoard() {
    return Item(14, "Ouija Board", -1, [
      "33%-Chance, im Haus zu erscheinen",
      "Oft in Lagerplätzen wie Schränke oder Badezimmer gefunden",
      "Mehrere Spieler können anwesend sein, um es zu benutzen",
      "Wird eine Phrase erkannt, besteht eine 33%-Chance, dass folgendes passiert: Flackern aller Lichter im Raum, Sanity um 40% Senken und Beenden der Setup-Phase des Geistes",
      "Alle Geister außer Dämonen verringern die Sanity zu 5-10%, wenn auf eine Phrase geantwortet wird"
    ]);
  }
  factory Item.crucifix() {
    return Item(15, "Kruzifix", -1, [
      "3m effektive Reichweite (5m gegen Banshees)",
      "Kruzifixe werden eingesetzt, um Geister daran zu hindern, in die Hunting-Phase zu wechseln",
      "Ist der Geist in der Hunting-Phase, kannst du dich nur noch verstecken",
      "Kruzifixe sollten im Geisterraum platziert werden, um die meisten Hunting-Phasen abzuwehren",
      "Sie haben 2 Charges, für optimale Ergebnisse können 2 Kruzifixe im Geisterraum platziert werden"
    ]);
  }
  factory Item.sanityPills() {
    return Item(16, "Sanity Pillen", -1, [
      "Erhöhen die Sanity um 40%",
      "Must-Have für große Orte"
    ]);
  }
  factory Item.infraredSensor() {
    return Item(17, "Infrarotlicht-Sensor", -1, [
      "Werden an Wänden platziert und erleuchten den Bereich, wenn ein Spieler oder Geist in der Nähe ist",
      "Billigere Variante des Bewegungssensors, sendet keine Signale an den Van und kann nicht für die 'Erkenne Geist mit Bewegungssensor'-Mission verwendet werden",
      "Kleine Orte: Kann im Geisterraum auf allen 4 Wänden montiert werden, um selbst bei Lichtausfällen einen hell erleuchteten Raum zu gewährleisten",
      "Große Orte: Kann als Wegpunkt bei Kreuzungen und Kurven eingesetzt werden"
    ]);
  }
  factory Item.motionSensor() {
    return Item(18, "Bewegungssensor", -1, [
      "Teuerstes Item im Spiel mit 100\$",
      "Wird sowohl von Spielern als auch Geistern aktiviert, für eine effektive Verfolgung müssen also Spielerbewegungen koordiniert werden",
      "Gibt bei Aktivierung sowohl visuelle als auch akustische Hinweise",
      "Teil der 'Erkenne den Geist mit einem Bewegungssensor'-Mission",
      "Wird auf der Map im Van als pinker Streifen angezeigt, die Bewegungen des Geistes können also auch von dort verfolgt werden"
    ]);
  }
  factory Item.headMountedCamera() {
    return Item(19, "Kopfkamera", 6, [
      "Kann aufgesetzt werden, um Videoaufnahmen von der Sicht des Spielers zum Van zu übertragen",
      "Erkennt ebenfalls Geisterorbs",
      "Verbraucht keinen Inventarplatz, kann also als 4. Item mitgenommen werden",
      "Nur hilfreich, wenn ein Spieler im Van bleibt und den Kameraträger lotst",
      "Nachtsichtfunktion wird ebenfalls unterstützt, somit kann ein Spieler im Van auch bei Lichtausfall seine Kollegen führen",
      "Können wieder abgesetzt werden, indem der Spieler die Interaktions-Taste drückt, während er auf die Hängehaken im Van schaut"
    ]);
  }
  factory Item.bone() {
    return Item(20, "Knochen", -1, [
      "Ein Knochen kann pro Level gefunden werden",
      "Findet man diesen, sollte er fotografiert und aufgehoben werden, da sowohl das Foto als auch das Aufheben ('bone evidence') Geld bringt"
    ]);
  }

  Evidence get resultingEvidence {
    return resultingEvidenceId != -1 ? Model.evidencesBase.singleWhere((evidence) => evidence.id == resultingEvidenceId) : null;
  }

}