import 'package:Phasmonomicon/PhasmoColors.dart';
import 'package:Phasmonomicon/data/Evidence.dart';
import 'package:Phasmonomicon/data/Ghost.dart';
import 'package:Phasmonomicon/data/Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import 'evidenceListPage.dart';

class GhostListPage extends StatelessWidget {
  GhostListPage({Key key}) : super(key: key);

  static const String routeName = "/ghosts";
  static const String pageTitle = "Geister";
  static const String assetName = "img_categoryGhost.jpg";

  static Color weaknessColor = Colors.green;
  static Color strengthColor = Colors.red[800];
  static Color powerColor = Colors.blueAccent;

  List<Widget> _getTagsOfGhost(Ghost g) {
    List<Widget> tags = List();
    if (g.weakness != null) tags.add(createTag(weaknessColor.withOpacity(0.7)));
    if (g.strength != null) tags.add(createTag(strengthColor.withOpacity(0.7)));
    if (g.specialPowerDescription != null)
      tags.add(createTag(powerColor.withOpacity(0.7)));
    return tags;
  }

  Container createTag(Color color) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      height: 8,
      width: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(const Radius.circular(20)),
          color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.deepPurple, PhasmoColors.accentOrange])),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            elevation: 0,
            pinned: true,
            backgroundColor: PhasmoColors.dark1,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: EdgeInsets.only(left: 48, bottom: 14),
              title: Text(
                pageTitle,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: PhasmoColors.bright1),
              ),
              background: ColorFiltered(
                child: Image.asset(
                  'lib/img/$assetName',
                  fit: BoxFit.fitWidth,
                  isAntiAlias: true,
                ),
                colorFilter: ColorFilter.mode(
                    PhasmoColors.dark1.withOpacity(0.6), BlendMode.hardLight),
              ),
              stretchModes: [
                StretchMode.zoomBackground,
                StretchMode.blurBackground
              ],
            ),
            stretch: true,
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 16, bottom: 16),
            sliver: SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                BuildContext sliverCtx = context;
                Ghost currentGhost = Model.ghostsBase[index];
                return OpenContainer(
                  transitionType: ContainerTransitionType.fade,
                  closedElevation: 0,
                  openElevation: 0,
                  closedColor: Colors.transparent,
                  openBuilder: (context, action) => GhostDetailPage(ghost: currentGhost),
                  closedBuilder: (context, action) => Container(
                      height: 60,
                      margin: EdgeInsets.fromLTRB(16, 5, 16, 5),
                      padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                      decoration: BoxDecoration(
                          color: PhasmoColors.bright1,
                          borderRadius:
                              BorderRadius.all(const Radius.circular(15))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                currentGhost.name,
                                style: Theme.of(sliverCtx)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Row(
                                  children: _getTagsOfGhost(currentGhost),
                                ),
                              ),
                            ],
                          ),
                          Material(
                            color: Colors.transparent,
                            borderRadius:
                                BorderRadius.all(const Radius.circular(15)),
                            borderOnForeground: true,
                            clipBehavior: Clip.antiAlias,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                for (Evidence e in currentGhost.evidences)
                                  IconButton(
                                    icon: ImageIcon(
                                      AssetImage("lib/img/${e.assetName}"),
                                      color: PhasmoColors.dark1,
                                      size: 30,
                                    ),
                                    splashColor:
                                        PhasmoColors.dark1.withOpacity(0.2),
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => EvidenceDetailPage(evidence: e)));
                                    },
                                  ),
                              ],
                            ),
                          )
                        ],
                      )),
                );
              }, childCount: Model.ghostsBase.length),
            ),
          )
        ],
      ),
    );
  }
}

class GhostDetailPage extends StatelessWidget {
  GhostDetailPage({Key key, @required this.ghost})
      : assert(ghost != null),
        super(key: key);

  final Ghost ghost;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: PhasmoColors.dark1,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: PhasmoColors.dark2,
                  child: Stack(
                    children: [
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: const Radius.circular(80)),
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.deepPurple,
                                PhasmoColors.accentOrange
                              ]),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.bottomRight,
                          padding: EdgeInsets.only(bottom: 32, right: 24),
                          child: Text(
                            ghost.name,
                            textAlign: TextAlign.right,
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                .copyWith(color: PhasmoColors.bright1),
                          ),
                        ),
                      ),
                      CustomScrollView(
                        shrinkWrap: true,
                        slivers: [
                          SliverAppBar(
                            actions: [
                              Container(
                                margin: EdgeInsets.fromLTRB(16, 16, MediaQuery.of(context).size.width/2-40, 16),
                                width: 80,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: PhasmoColors.dark2,
                                  borderRadius: BorderRadius.all(const Radius.circular(20)),
                                ),
                                child: Text(
                                    "Geist",
                                    style: Theme.of(context).textTheme.subtitle2.copyWith(color: PhasmoColors.bright1)
                                ),
                              )
                            ],
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          )
                        ],
                      ),
                    ],
                  ),
                ), //Navbar
                Container(
                  decoration: BoxDecoration(
                    color: PhasmoColors.dark2,
                    borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(80)),
                  ),
                  alignment: Alignment.topCenter,
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(const Radius.circular(15)),
                    borderOnForeground: true,
                    clipBehavior: Clip.antiAlias,
                    type: MaterialType.button,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (Evidence e in ghost.evidences)
                          IconButton(
                            icon: ImageIcon(
                              AssetImage("lib/img/${e.assetName}"),
                              color: PhasmoColors.bright1,
                              size: 100,
                            ),
                            padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
                            iconSize: 40,
                            splashColor: PhasmoColors.dark1.withOpacity(0.2),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => EvidenceDetailPage(evidence: e)));
                            },
                          ),
                      ],
                    ),
                  ),
                ), //Evidence Container
                if(ghost.weakness != null) Container(
                    margin: EdgeInsets.only(right: 50, top: 12),
                    padding: EdgeInsets.fromLTRB(32, 20, 16, 26),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: GhostListPage.weaknessColor,
                      borderRadius: BorderRadius.only(
                          topRight: const Radius.circular(20),
                          bottomRight: const Radius.circular(20)),
                    ),
                    child: Text(
                      ghost.weakness,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: PhasmoColors.bright1),
                    )),
                if(ghost.strength != null) Container(
                  margin: EdgeInsets.only(left: 50, top: 12),
                  padding: EdgeInsets.fromLTRB(16, 20, 32, 26),
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    color: GhostListPage.strengthColor,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20),
                      bottomLeft: const Radius.circular(20)
                    ),
                  ),
                  child: Text(
                    ghost.strength,
                    textAlign: TextAlign.right,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: PhasmoColors.bright1),
                  )
                ),
              ],
            ),
            if(ghost.specialPowerDescription != null) DraggableScrollableSheet(
              initialChildSize: 0.12,
              maxChildSize: 0.73,
              minChildSize: 0.12,
              expand: true,
              builder: (context, scrollController) {
                return Container(
                  padding: EdgeInsets.zero,
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(50),
                          topRight: const Radius.circular(50)),
                      color: PhasmoColors.bright1),
                  child: CustomScrollView(
                    controller: scrollController,
                    physics: ClampingScrollPhysics(),
                    slivers: [
                      MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: SliverAppBar(
                          leading: null,
                          leadingWidth: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topLeft: const Radius.circular(30), topRight: const Radius.circular(30)),
                              side: BorderSide(
                                  color: Colors.transparent,
                              )
                          ),
                          titleSpacing: 0,
                          title: Container(
                            margin: EdgeInsets.zero,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: const Radius.circular(50),
                                    topRight: const Radius.circular(50)),
                                color: PhasmoColors.bright1),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Divider(
                                  color: PhasmoColors.bright2,
                                  thickness: 2,
                                  height: 20,
                                  indent: MediaQuery.of(context).size.width/2-30,
                                  endIndent: MediaQuery.of(context).size.width/2-30,
                                ),
                                Text(
                                  "Spezialfähigkeit",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(color: PhasmoColors.dark1),
                                ),
                              ],
                            ),
                          ),
                          toolbarHeight: 80,
                          centerTitle: true,
                          pinned: true,
                          backgroundColor: PhasmoColors.bright1,
                          elevation: 0,
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return Container(
                                  margin: EdgeInsets.only(right: 20, top: 12),
                                  padding: EdgeInsets.fromLTRB(24, 16, 16, 20),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    color: GhostListPage.powerColor,
                                    borderRadius: BorderRadius.only(
                                        topRight: const Radius.circular(50),
                                        bottomRight: const Radius.circular(50)),
                                  ),
                                  child: Text(
                                    ghost.specialPowerDescription[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(color: PhasmoColors.bright1),
                                  ));
                            },
                          childCount: ghost.specialPowerDescription.length
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ));
  }
}
