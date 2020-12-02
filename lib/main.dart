import 'package:Phasmonomicon/PhasmoColors.dart';
import 'package:Phasmonomicon/data/Model.dart';
import 'package:Phasmonomicon/views/evidenceListPage.dart';
import 'package:Phasmonomicon/views/ghostListPage.dart';
import 'package:Phasmonomicon/views/itemListPage.dart';
import 'package:animations/animations.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'data/Evidence.dart';
import 'data/Ghost.dart';

//TODO: Localization
//https://pub.dev/packages/easy_localization

//TODO: Mention Flaticon
//<div>Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Model(),
    child: Phasmonomicon()
  ));
}

class Phasmonomicon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if(!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null && !currentFocus.focusedChild.hasPrimaryFocus && currentFocus.focusedChild.hasFocus) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: MaterialApp(
        title: 'Phasmonomicon',
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({Key key}) : super(key: key);

  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    List<Category> categories = [
      Category(
          GhostListPage.pageTitle,
          "Lerne über die Schwächen und Stärken unterschiedlicher Geister und sei auf alle Überraschungen vorbereitet!",
          GhostListPage.assetName,
          GhostListPage()),
      Category(
          ItemListPage.pageTitle,
          "Studiere die Funktionen deiner Ausrüstungsgegenstände und maximiere die Effektivität deiner Jagd!",
          ItemListPage.assetName,
          ItemListPage()),
      Category(
          EvidenceListPage.pageTitle,
          "Lies Details über die einzelnen Beweismittel der Geister und finde dein Ziel noch schneller!",
          EvidenceListPage.assetName,
          EvidenceListPage()),
    ];

    return Container(
      color: PhasmoColors.dark1,
      child: Stack(
        alignment: Alignment.topCenter,
        overflow: Overflow.clip,
        children: [
          SizedBox.expand(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 60, 20, 10),
                  child: Text(
                    "Phasmonomicon",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: PhasmoColors.bright1),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(24, 16, 24, 32),
                  child: Material(
                    color: Colors.transparent,
                    child: TextField(
                      enabled: false,
                      style: TextStyle(color: PhasmoColors.bright1),
                      cursorColor: PhasmoColors.accentOrange,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: PhasmoColors.accentOrange,
                                width: 1.0,
                                style: BorderStyle.solid),
                            borderRadius:
                            BorderRadius.all(Radius.circular(50))),
                        errorBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: PhasmoColors.accentOrange,
                                width: 1.0,
                                style: BorderStyle.solid),
                            borderRadius:
                            BorderRadius.all(Radius.circular(50))),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: PhasmoColors.accentOrange,
                                width: 1.0,
                                style: BorderStyle.solid),
                            borderRadius:
                            BorderRadius.all(Radius.circular(50))),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: PhasmoColors.bright2,
                                width: 1.0,
                                style: BorderStyle.solid),
                            borderRadius:
                            BorderRadius.all(Radius.circular(50))),
                        disabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: PhasmoColors.dark2,
                                width: 1.0,
                                style: BorderStyle.solid),
                            borderRadius:
                            BorderRadius.all(Radius.circular(50))),
                        hintText: "Suche...",
                        hintStyle: TextStyle(color: PhasmoColors.bright2),
                        contentPadding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                        icon: Icon(
                          Icons.search,
                          color: PhasmoColors.bright2,
                        ),
                      ),
                    ),
                  ),
                ),
                SlidingCardsView(
                  categories: categories,
                ),
              ],
            ),
          ),
          DraggableScrollableEvidenceSheet(),
        ],
      ),
    );
  }

}

//Sliding Category Cards
//#region Category Cards
class SlidingCardsView extends StatefulWidget {
  const SlidingCardsView({Key key, this.categories}) : super(key: key);

  final List<Category> categories;

  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState(categories);
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  _SlidingCardsViewState(this.categories);

  PageController pageController;
  final List<Category> categories;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cards = new List<Widget>(categories.length);
    for (int i = 0; i < cards.length; i++) {
      cards[i] = OpenContainer(
        closedColor: Colors.transparent,
        closedElevation: 0,
        closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
        ),
        transitionType: ContainerTransitionType.fadeThrough,
        transitionDuration: Duration(milliseconds: 500),
        closedBuilder: (BuildContext c, VoidCallback action) => TappableCategoryCard(
          title: categories[i].title,
          description: categories[i].description,
          assetName: categories[i].assetPath,
          offset: i,
          controller: pageController,
        ),
        openBuilder: (BuildContext c, VoidCallback action) => categories[i].referencedPage,
        tappable: true,
      );
    }

    return SizedBox(
        height: MediaQuery.of(context).size.height *
            0.50, //<-- set height of the card
        child: PageView(
          controller: pageController,
          children: cards,
        ));
  }
}

class TappableCategoryCard extends StatelessWidget {
  TappableCategoryCard(
      {Key key,
      @required this.title,
      @required this.description,
      @required this.assetName,
      @required this.offset,
      @required this.controller})
      : assert(title != null &&
            description != null &&
            assetName != null &&
            controller != null),
        super(key: key);

  final String title;
  final String description;
  final String assetName;
  final int offset;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    BuildContext ctx = context;
    return Card(
      borderOnForeground: true,
      margin: EdgeInsets.only(left: 8, right: 8, bottom: 15),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
        side: BorderSide(
          color: PhasmoColors.dark2,
          width: 1
        )
      ),
      color: PhasmoColors.bright1,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
        highlightColor: Colors.transparent,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Image.asset(
                    'lib/img/$assetName',
                    width: MediaQuery.of(ctx).size.width,
                    height: MediaQuery.of(ctx).size.height * 0.32,
                    scale: 1.3,
                    alignment: Alignment(
                        -((controller.position.haveDimensions &&
                            controller.hasClients
                            ? controller.page
                            : controller.initialPage.toDouble()) -
                            offset)
                            .abs(),
                        0),
                    fit: BoxFit.none,
                    isAntiAlias: true,
                  );
                },
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: _TappableCategoryCardContent(
                title: title,
                description: description,
              ), //<-- will be replaced soon :)
            ),
          ],
        ),
      ),
    );
  }
}

class _TappableCategoryCardContent extends StatelessWidget {
  const _TappableCategoryCardContent({Key key, this.title, this.description})
      : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 5, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 20)),
          SizedBox(height: 8),
          Text(description, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class Category {
  final String title;
  final String description;
  final String assetPath;
  final StatelessWidget referencedPage;

  Category(this.title, this.description, this.assetPath, this.referencedPage);
}
//#endregion

//Main Part: Found Evidence
//#region Found Evidence
class DraggableScrollableEvidenceSheet extends StatefulWidget {
  DraggableScrollableEvidenceSheet({Key key}) : super(key: key);

  @override
  State createState() => new _DraggableScrollableEvidenceSheetState();
}

class _DraggableScrollableEvidenceSheetState extends State<DraggableScrollableEvidenceSheet> {
  @override
  Widget build(BuildContext context) {
    BuildContext scrollableCtx = context;
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.2,
      maxChildSize: 0.73,
      builder: (context, scrollController) {
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: PhasmoColors.bright1,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: PhasmoColors.dark2,
                  blurRadius: 20,
                  spreadRadius: -5.0,
                )
              ]),
          child: CustomScrollView(
            controller: scrollController,
            physics: BouncingScrollPhysics(),
            slivers: [
              MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: SliverAppBar(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Divider(
                          color: PhasmoColors.bright2,
                          thickness: 2,
                          height: 20,
                          indent: MediaQuery.of(context).size.width/2-30,
                          endIndent: MediaQuery.of(context).size.width/2-30,
                        ),
                        Text(
                          "Gefundene Beweise",
                          style: Theme.of(scrollableCtx)
                              .textTheme
                              .headline5
                              .copyWith(color: PhasmoColors.dark1),
                        ),
                      ],
                    ),
                    centerTitle: true,
                    pinned: true,
                    toolbarHeight: 110,
                    backgroundColor: PhasmoColors.bright1,
                    elevation: 0,
                    bottom: PreferredSize(
                        preferredSize: Size.fromHeight(30),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Consumer<Model>(
                                builder: (context, model, child) => ToggleButtons(
                                  splashColor: PhasmoColors.dark1.withOpacity(0.2),
                                  fillColor: PhasmoColors.bright2,
                                  disabledColor: PhasmoColors.dark2,
                                  children: [
                                    for(Evidence e in Model.evidencesBase)
                                      ImageIcon(
                                        AssetImage("lib/img/${e.assetName}"),
                                        color: PhasmoColors.accentOrange,
                                        size: 35,
                                      )
                                  ],
                                  isSelected: [...Model.evidencesBase.map((e) => model.foundEvidenceIds.contains(e.id)).toList()],
                                  onPressed: (index) {
                                    if(model.foundEvidenceIds.contains(Model.evidencesBase[index].id)) {
                                      model.removeEvidence(Model.evidencesBase[index].id);
                                    }
                                    else if(model.foundEvidenceIds.length < 3) {
                                      model.addEvidence(Model.evidencesBase[index].id);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                    ),
                  ),
              ),
              Consumer<Model>(
                builder: (context, model, child) => LiveSliverList(
                  itemCount: model.possibleGhosts.length,
                  controller: scrollController,
                  reAnimateOnVisibility: true,
                  showItemInterval: Duration(milliseconds: 100),
                  showItemDuration: Duration(milliseconds: 100),
                  delay: Duration.zero,
                  visibleFraction: 0.01,
                  itemBuilder: (context, index, animation) {
                    List<Ghost> ghosts = model.possibleGhosts;
                    Iterable<Evidence> remainingEvidence = ghosts[index].evidences.where((ghostEvidence) => model.remainingEvidenceIds.contains(ghostEvidence.id));
                    return OpenContainer(
                      transitionType: ContainerTransitionType.fade,
                      closedElevation: 0,
                      openElevation: 0,
                      closedColor: Colors.transparent,
                      openBuilder: (context, action) => GhostDetailPage(ghost: ghosts[index]),
                      closedBuilder: (context, action) => Container(
                          height: 50,
                          margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                ghosts[index].name,
                                style: Theme.of(scrollableCtx).textTheme.subtitle1,
                              ),
                              Material(
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    for(Evidence e in remainingEvidence)
                                      IconButton(
                                        icon: ImageIcon(
                                          AssetImage("lib/img/${e.assetName}"),
                                          color: PhasmoColors.dark1,
                                          size: 30,
                                        ),
                                        splashColor: PhasmoColors.dark1.withOpacity(0.2),
                                        onPressed: () {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => EvidenceDetailPage(evidence: e)));
                                        },
                                      ),
                                  ],
                                ),
                              )
                            ],
                          )
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
//#endregion
