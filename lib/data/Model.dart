import 'package:Phasmonomicon/data/Evidence.dart';
import 'package:Phasmonomicon/data/Item.dart';
import 'package:flutter/cupertino.dart';

import 'Ghost.dart';

class Model extends ChangeNotifier {

  static List<Ghost> ghostsBase = List<Ghost>.unmodifiable([Ghost.spirit(), Ghost.wraith(), Ghost.phantom(), Ghost.poltergeist(), Ghost.banshee(), Ghost.jinn(), Ghost.mare(), Ghost.revenant(), Ghost.shade(), Ghost.demon(), Ghost.yurei(), Ghost.oni()]);
  static List<Evidence> evidencesBase = List<Evidence>.unmodifiable([Evidence.fingerprints(), Evidence.ghostBook(), Evidence.emfFive(), Evidence.ghostBox(), Evidence.freezingTemperatures(), Evidence.ghostOrbs()]);
  static List<Item> itemsBase = List<Item>.unmodifiable([Item.candle(), Item.videoCamera(), Item.emfReader(), Item.thermometer(), Item.ghostBox(), Item.ghostBook(), Item.uvLamp(), Item.glowstick(), Item.photoCamera(), Item.salt(), Item.smudgeStick(), Item.soundSensor(), Item.parabolicSensor(), Item.ouijaBoard(), Item.crucifix(), Item.sanityPills(), Item.infraredSensor(), Item.motionSensor(), Item.headMountedCamera(), Item.bone()]);

  List<int> foundEvidenceIds;

  Model() {
    foundEvidenceIds = List<int>();
  }

  //Ghost Phrases
  Map<String, List<String>> get ghostBoxQuestions {
    return {"Schwierigkeit" : [
      "Was willst du?",
      "Warum bist du hier?",
      "Willst du uns wehtun?",
      "Bist du wütend?",
      "Willst du uns hier haben?",
      "Sollen wir gehen?",
      "Willst du, dass wir gehen?",
      "Was sollen wir tun?",
      "Können wir helfen?",
      "Bist du freundlich?",
      "Was bist du?"
      ], "Ort" : [
      "Wo bist du?",
      "Bist du in der Nähe?",
      "Kannst du dich zeigen?",
      "Gib uns ein Zeichen!",
      "Lass uns wissen, dass du da bist!",
      "Zeig dich!",
      "Kannst du sprechen?",
      "Sprich zu uns!",
      "Bist du hier?",
      "Bist du bei uns?",
      "Jemand bei uns?",
      "Ist jemand hier?",
      "Jemand in diesem Raum?",
      "Jemand da?",
      "Ist ein Geist hier?",
      "Was ist dein Ort?"
    ], "Geschlecht" : [
      "Bist du ein Mädchen?",
      "Bist du ein Junge?",
      "Bist du männlich?",
      "Bist du weiblich?",
      "Wer bist du?",
      "Was bist du?",
      "Wer ist da?",
      "Mit wem sprechen wir?",
      "Mit wem spreche ich?",
      "Hallo",
      "Was ist dein Name?",
      "Kannst du mir deinen Namen sagen?",
      "Was ist dein Geschlecht?",
      "Welches Geschlecht?",
      "Bist du männlich oder weiblich?",
      "Bist du ein Mann?",
      "Bist du eine Frau?"
    ], "Alter" : [
      "Wie alt bist du?",
      "Wie jung bist du?",
      "Was ist dein Alter?",
      "Wann wurdest du geboren?",
      "Bist du ein Kind?",
      "Bist du alt?",
      "Bist du jung?"
    ]};
  }
  List<String> get ouijaBoardQuestions {
    return [
      "Wen hast du getötet?",
      "Wer ist dein Opfer?",
      "Was ist der Name der Person, die du getötet/ermordet hast?",
      "Hast du gemordet?",
      "Wen hast du ermordet?",
      "Wer starb?",
      "Wie alt bist du?",
      "Was ist dein Alter?",
      "Bist du alt?",
      "Bist du jung?",
      "Wie lange bist du tot?",
      "Vor wie vielen Jahren bist du gestorben?",
      "Wie lange bist du schon hier?",
      "Seit wann bist du tot?",
      "Wann bist du gestorben?",
      "Wie viele sind in diesem Raum?",
      "Wie viele Menschen sind in diesem Raum?",
      "Wie viele Menschen sind hier?",
      "Wie viele Geister sind in diesem Raum?",
      "Wie viele Geister sind hier?",
      "Bist du allein?",
      "Sind wir alleine?",
      "Wer ist hier?",
      "Wer ist in diesem Raum?",
      "Wo bist du?",
      "Was ist Ihr Lieblingszimmer?",
      "Wo ist dein Zimmer?",
      "Bist du hier?",
      "Bist du in der Nähe?",
      "Sind hier irgendwelche Geister?",
      "Bist du in der Nähe?",
    ];
  }
  List<String> get triggeringPhrases {
    return [
      "Ich habe Angst.",
      "Das macht mir Angst.",
      "Unheimlich",
      "Horror",
      "Erschrecken",
      "Panik",
      "Schreck",
      "Verstecken",
      "Lauf!",
      "Zeig dich!",
      "Zeig dich uns!"
    ];
  }

  //List of possible Ghosts and found Evidences
  List<Ghost> get possibleGhosts {
    if(foundEvidenceIds.isEmpty) {
      return ghostsBase;
    }
    List<Ghost> filteredGhosts = ghostsBase.where((ghost) => foundEvidenceIds.every((foundEvidenceId) => ghost.evidenceIds.contains(foundEvidenceId))).toList();
    return filteredGhosts;
  }
  List<Evidence> get foundEvidence {
    if(foundEvidenceIds.isEmpty) {
      return evidencesBase;
    }
    return evidencesBase.where((evidence) => foundEvidenceIds.contains(evidence.id)).toList();
  }
  List<int> get remainingEvidenceIds {
    return evidencesBase.where((evidence) => !foundEvidenceIds.contains(evidence.id)).map((ev) => ev.id).toList();
  }

  void addEvidence(int id) {
    if(!this.foundEvidenceIds.contains(id)) {
      foundEvidenceIds.add(id);
      notifyListeners();
    }
  }
  void removeEvidence(int id) {
    if(this.foundEvidenceIds.contains(id)) {
      this.foundEvidenceIds.remove(id);
      notifyListeners();
    }
  }

}