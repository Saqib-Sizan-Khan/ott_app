import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:ottapp/views/widgets/category_horizontal_listview.dart';

class ContentInfoPage extends StatelessWidget {
  ContentInfoPage({super.key});

  final List ratingTextList = ["Action", "Adventure", "2H 45M", "⭐8.7"];
  List actorsName = ["Vin\nDiesel", "Jason\nMomoa", "Alan\nRitchson", "Michelle\nRodriguez",
    "Brie\nLarson", "Sung\nKang", "Charlize\nTheron", "Tyrese\nGibson",
    "Jordana\nBrewster", "Jhon\nCena", "Nathalie\nEmmanuel"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              leading: const Icon(
                CupertinoIcons.back,
                color: Colors.white,
              ),
              elevation: 0,
              floating: true,
              expandedHeight: MediaQuery.of(context).size.height / 2,
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 1.5,
                collapseMode: CollapseMode.parallax,
                background: Container(
                    foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent,
                        ])),
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "assets/images/movie_4.jpg",
                          ),
                        ),
                      ),
                      child: Center(
                        child:
                            Lottie.asset("assets/lottie_animation/play.json"),
                      ),
                    )),
                stretchModes: const [StretchMode.blurBackground],
                centerTitle: true,
                titlePadding: EdgeInsets.symmetric(horizontal: 16.w),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Fast X",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                    CircleAvatar(
                        radius: 16.r,
                        backgroundColor: Colors.grey.shade800,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(CupertinoIcons.heart_fill,
                                size: 17.sp, color: Colors.white)))
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                  height: 70.h,
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(4),
                          child: Chip(
                            labelPadding: const EdgeInsets.all(0),
                            label: Text(ratingTextList[index]),
                            backgroundColor: Colors.grey.shade800,
                            side: const BorderSide(color: Colors.transparent),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        );
                      })),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                          fontSize: 22.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const Text( "Over many missions and against impossible odds, Dom Toretto and "
                        "his family have outsmarted and outdriven every foe in their path. Now, "
                        "they must confront the most lethal opponent they've ever faced. Fueled by "
                        "revenge, a terrifying threat emerges from the shadows of the past to "
                        "shatter Dom's world and destroy everything",
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 16.0.w, right: 16.0.w, top: 25.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cast",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 22.sp,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 200.h,
                      child: ListView.builder(
                          itemCount: actorsName.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 50.r,
                                    backgroundImage:
                                        AssetImage("assets/images/actor_$index.jpg"),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(actorsName[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 16.0.w, right: 16.0.w, bottom: 100.h),
                child: const CategoryHorizontalListView(
                  categoryTitle: "Recommended for you",
                ),
              ),
            ),
          ],
        ));
  }
}
