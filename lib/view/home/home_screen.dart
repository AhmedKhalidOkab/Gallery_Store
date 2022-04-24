import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:gallery_app/view/category_screen/catergory_items.dart';
import 'package:gallery_app/view/category_screen/custom_bottom_category.dart';
import 'package:gallery_app/view/drawer/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ListView6State createState() => _ListView6State();
}

class _ListView6State extends State<HomeScreen> {
  @override
  Widget build(BuildContext c) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.teal,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Center(
            child: OpenContainer(
              closedBuilder: (_, openContainer) {
                return SizedBox(
                  height: 80,
                  width: 250,
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(.5)),
                    child: const Center(
                      child: Text(
                        'Welcome Back, \n Click TO Enter',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                );
              },
              openColor: Colors.transparent,
              closedElevation: 1,
              closedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              transitionDuration: const Duration(milliseconds: 700),
              openBuilder: (_, closeContainer) {
                return SlideAnimation1();
              },
            ),
          ),
        ));
  }
}

class SlideAnimation1 extends StatelessWidget {
  const SlideAnimation1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(
                  'assets/images/WhatsApp Image 2022-04-24 at 5.50.42 AM.jpeg'),
              fit: BoxFit.cover)),
      child: Scaffold(
          drawer: const ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(40)),
            child: Drawer(
              child: CustomDarwer(),
            ),
          ),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: AnimationLimiter(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: categoryItem.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  delay: const Duration(milliseconds: 100),
                  child: CustomBottomCategory(
                    index: index,
                  ),
                );
              },
            ),
          )),
    );
  }
}
