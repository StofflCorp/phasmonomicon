import 'package:Phasmonomicon/PhasmoColors.dart';
import 'package:Phasmonomicon/data/Item.dart';
import 'package:Phasmonomicon/data/Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import 'evidenceListPage.dart';

class ItemListPage extends StatelessWidget {
  ItemListPage({Key key}) : super(key: key);

  static const routeName = "/items";
  static const pageTitle = "Items";
  static const assetName = "img_categoryItem.jpg";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, PhasmoColors.dark1])),
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
                Item currentItem = Model.itemsBase[index];
                return OpenContainer(
                  transitionType: ContainerTransitionType.fade,
                  closedElevation: 0,
                  openElevation: 0,
                  closedColor: Colors.transparent,
                  openBuilder: (context, action) =>
                      ItemDetailPage(item: currentItem),
                  closedBuilder: (context, action) => Container(
                      height: 60,
                      margin: EdgeInsets.fromLTRB(16, 5, 16, 5),
                      padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                      decoration: BoxDecoration(
                          color: PhasmoColors.bright1,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            currentItem.name,
                            style: Theme.of(sliverCtx)
                                .textTheme
                                .subtitle1
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          if (currentItem.resultingEvidence != null)
                            Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                              borderOnForeground: true,
                              clipBehavior: Clip.antiAlias,
                              child: IconButton(
                                icon: ImageIcon(
                                  AssetImage(
                                      "lib/img/${currentItem.resultingEvidence.assetName}"),
                                  color: PhasmoColors.dark1,
                                  size: 30,
                                ),
                                splashColor:
                                    PhasmoColors.dark1.withOpacity(0.2),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => EvidenceDetailPage(evidence: currentItem.resultingEvidence)));
                                },
                              ),
                            )
                        ],
                      )),
                );
              }, childCount: Model.itemsBase.length),
            ),
          )
        ],
      ),
    );
  }
}

class ItemDetailPage extends StatelessWidget {
  ItemDetailPage({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    bool hasResultingEvidence = item.resultingEvidence != null;
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
                    "Item",
                    style: Theme.of(context).textTheme.subtitle2.copyWith(color: PhasmoColors.bright1)
                ),
              )
            ],
            backgroundColor: PhasmoColors.dark1,
            expandedHeight: hasResultingEvidence ? 245 : 170,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(right: 24, top: 20),
              title: Container(
                height: hasResultingEvidence ? 180 : 105,
                alignment: Alignment.centerRight,
                child: Text(
                  item.name,
                  textAlign: TextAlign.right,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: PhasmoColors.bright1),
                ),
              ),
              background: Column(
                children: [
                  Container(
                    color: hasResultingEvidence ? PhasmoColors.dark2 : PhasmoColors.dark1,
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: const Radius.circular(80)),
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Colors.blueGrey, PhasmoColors.dark1]),
                      ),
                    ),
                  ), //Navbar,
                  hasResultingEvidence
                      ? Container(
                    height: 75,
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
                      child: IconButton(
                        icon: ImageIcon(
                          AssetImage(
                              "lib/img/${item.resultingEvidence.assetName}"),
                          color: PhasmoColors.bright1,
                          size: 100,
                        ),
                        padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
                        iconSize: 40,
                        splashColor: PhasmoColors.dark1.withOpacity(0.2),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => EvidenceDetailPage(evidence: item.resultingEvidence)));
                        },
                      ),
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
                      item.descriptions[index],
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: PhasmoColors.dark1),
                    ));
              },
              childCount: item.descriptions.length,
            ),
          ),
        ],
      ),
    );
  }
}
