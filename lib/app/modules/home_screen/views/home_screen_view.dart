import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:shonish_assignment/app/modules/home_screen/components/image_text.dart';
import 'package:shonish_assignment/app/modules/home_screen/components/offer_widget.dart';
import 'package:shonish_assignment/app/modules/home_screen/components/side_heading_widget.dart';
import 'package:shonish_assignment/app/modules/home_screen/controllers/home_controller.dart';
import 'package:tabler_icons/tabler_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 105, 180, 242),
              leading: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              title: Text(
                "Hey Shubam",
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                Padding(
                  padding:  EdgeInsets.all(8),
                  child: SizedBox(
                    // width: Get.width / 6,
                    height: Get.height / 11,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: const  Row(
                        children: [
                          Icon(
                            Icons.wallet,
                            size: 20,
                            color: Colors.blue,
                          ),
                          Text(
                            " ₹452",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(100),
                child: Container(
                  decoration:  const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                     color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: const TabBar(
                    indicatorColor: Color.fromARGB(255, 23, 20, 20),
                    unselectedLabelColor: Color.fromARGB(255, 8, 7, 7),
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerHeight: 0,
                    tabs: [
                      Tab(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(TablerIcons.flame),
                            Text(
                              'All Offers',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(TablerIcons.gift),
                            Text(
                              'Gifts',
                              style: TextStyle(fontSize: 11),
                            )
                          ],
                        ),
                      ),
                      Tab(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(TablerIcons.clock),
                            Text(
                              'Upcoming',
                              style: TextStyle(fontSize: 11),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      Tab(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(TablerIcons.circle_check),
                            Text(
                              'My Offers',
                              style: TextStyle(fontSize: 11),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              width: Get.width,
                              height: 20,
                              child: Container(
                                color: const Color.fromARGB(255, 218, 217, 217),
                                child: Marquee(
                                  text: 'This is a scrolling text example. ',
                                  style: const TextStyle(fontSize: 12),
                                  scrollAxis: Axis.horizontal,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  blankSpace: 20.0,
                                  velocity: 50.0,
                                  pauseAfterRound: const Duration(seconds: 1),
                                  startPadding: 10.0,
                                  accelerationDuration:
                                      const Duration(seconds: 1),
                                  accelerationCurve: Curves.linear,
                                  decelerationDuration:
                                      const Duration(milliseconds: 500),
                                  decelerationCurve: Curves.easeOut,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  const SideHeadingWidget(
                                      icon: TablerIcons.flame,
                                      sideHeading: 'Trending Offers'),
                                  SizedBox(
                                    height: Get.height / 4,
                                    child: ListView.builder(
                                      itemCount: controller.offerlist
                                          .where((offer) =>
                                              offer.isTrending == true)
                                          .length,
                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final trendingOffers = controller
                                            .offerlist
                                            .where((offer) =>
                                                offer.isTrending == true)
                                            .toList();
                                        final offer = trendingOffers[index];
                                        return OfferWidget(
                                          imagePath: offer.brand?.logo ?? "",
                                          offerName: offer.title ?? "",
                                          offerMoney:
                                              offer.payoutAmt.toString(),
                                          users: offer.totalLead.toString(),
                                        );
                                      },
                                    ),
                                  ),
                                  const SideHeadingWidget(
                                      icon: TablerIcons.menu,
                                      sideHeading: 'More Offers'),
                                  Container(
                                    child: ListView.builder(
                                        itemCount: controller.taskslist.length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: ((context, index) {
                                          return Block(
                                              task:
                                                  controller.taskslist[index]);
                                        })),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          child: const Center(child: Text('Gifts Content'))),
                      Container(
                          child: const Center(child: Text('Upcoming Content'))),
                      Container(
                          child:
                              const Center(child: Text('My Offers Content'))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
