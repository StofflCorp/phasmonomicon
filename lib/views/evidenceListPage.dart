import 'package:Phasmonomicon/PhasmoColors.dart';
import 'package:Phasmonomicon/data/Evidence.dart';
import 'package:Phasmonomicon/data/Item.dart';
import 'package:Phasmonomicon/data/Model.dart';
import 'package:Phasmonomicon/views/itemListPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import '../PhasmoColors.dart';
import 'itemListPage.dart';

class EvidenceListPage extends StatelessWidget {
  EvidenceListPage({Key key}) : super(key: key);

  static const routeName = "/evidences";
  static const pageTitle = "Beweise";
  static const assetName = "img_categoryEvidence.jpg";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.indigo[900],
                Colors.cyan[300]
              ]
          )
      ),
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
                Evidence currentEvidence = Model.evidencesBase[index];
                return OpenContainer(
                  transitionType: ContainerTransitionType.fade,
                  closedElevation: 0,
                  openElevation: 0,
                  closedColor: Colors.transparent,
                  openBuilder: (context, action) => EvidenceDetailPage(evidence: currentEvidence),
                  closedBuilder: (context, action) => Container(
                    height: 60,
                      margin: EdgeInsets.fromLTRB(16, 5, 16, 5),
                      padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                      decoration: BoxDecoration(
                          color: PhasmoColors.bright1,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ImageIcon(
                            AssetImage(
                                "lib/img/${currentEvidence.assetName}"),
                            color: PhasmoColors.dark1,
                            size: 40,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              currentEvidence.name,
                              style: Theme.of(sliverCtx).textTheme.subtitle1.copyWith(fontWeight: FontWeight.w500),
                            )
                          ),
                        ],
                      )
                  ),
                );
              }, childCount: Model.evidencesBase.length),
            ),
          )
        ],
      ),
    );
  }
}

class EvidenceDetailPage extends StatelessWidget {
  EvidenceDetailPage({Key key, @required this.evidence})
      : assert(evidence != null),
        super(key: key);

  final Evidence evidence;

  @override
  Widget build(BuildContext context) {
    bool hasItems = evidence.seeAlsoItems != null;
    return Container(
      color: PhasmoColors.dark1,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
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
                    "Beweis",
                    style: Theme.of(context).textTheme.subtitle2.copyWith(color: PhasmoColors.bright1)
                ),
              )
            ],
            backgroundColor: PhasmoColors.dark1,
            expandedHeight: hasItems ? 245 : 170,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(right: 24, top: 20, left: 48),
              title: Container(
                height: hasItems ? 180 : 105,
                alignment: Alignment.centerRight,
                child: FittedBox(
                  alignment: Alignment.centerRight,
                  fit: BoxFit.contain,
                  child: Text(
                    evidence.name,
                    textAlign: TextAlign.right,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: PhasmoColors.bright1),
                  ),
                )
              ),
              background: Column(
                children: [
                  Container(
                    color: hasItems ? PhasmoColors.dark2 : PhasmoColors.dark1,
                    child: Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: const Radius.circular(80)),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.indigo[900],
                            Colors.cyan[300]
                          ]
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.fromLTRB(48, 32, 32, 32),
                        child: ColorFiltered(
                          child: Image.asset(
                            'lib/img/${evidence.assetName}',
                            fit: BoxFit.fitHeight,
                            isAntiAlias: true,
                          ),
                          colorFilter: ColorFilter.mode(PhasmoColors.dark2, BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ), //Navbar,
                  hasItems
                      ? Container(
                    height: 75,
                    decoration: BoxDecoration(
                      color: PhasmoColors.dark2,
                      borderRadius: BorderRadius.only(
                          bottomLeft: const Radius.circular(80)),
                    ),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 5),
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Siehe auch: ",
                            style: Theme.of(context).textTheme.subtitle1.copyWith(color: PhasmoColors.bright1)
                          ),
                          for(Item i in evidence.seeAlsoItems)
                            Padding(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: ActionChip(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemDetailPage(item: i)));
                                },
                                label: Text(
                                    i.name,
                                    style: Theme.of(context).textTheme.subtitle2.copyWith(color: PhasmoColors.bright1)
                                ),
                                backgroundColor: Colors.blueGrey,
                              )
                            )
                        ]
                    ),
                  )
                      : Container(),
                ],
              ),
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
                      color: PhasmoColors.bright1,
                      borderRadius: BorderRadius.only(
                          topRight: const Radius.circular(50),
                          bottomRight: const Radius.circular(50)),
                    ),
                    child: Text(
                      evidence.tips[index],
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: PhasmoColors.dark1),
                    ));
              },
              childCount: evidence.tips.length,
            ),
          ),
        ],
      ),
    );
  }
}