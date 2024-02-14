import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shonish_assignment/app/modules/detail_screen/components/Blue_Button.dart';
import 'package:shonish_assignment/app/modules/detail_screen/components/Text_Container.dart';
import 'package:shonish_assignment/app/modules/detail_screen/controllers/detail_controller.dart';
import 'package:shonish_assignment/app/modules/home_screen/models/tasks_model.dart';
import 'package:tabler_icons/tabler_icons.dart';

class OfferDetail extends StatefulWidget {
  const OfferDetail({Key? key, required this.rating, required this.task})
      : super(key: key);
  final TasksModel task;
  final double? rating;

  @override
  State<OfferDetail> createState() => _OfferDetailState();
}

class _OfferDetailState extends State<OfferDetail> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
        init: DetailController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 78, 167, 240),
              title: const Text(
                'Offer Detail',
                style: TextStyle(color: Colors.white),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 78, 167, 240),
            body: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Image.network(
                                  widget.task.brand!.logo.toString(),
                                  width: Get.width / 3,
                                ),
                                const SizedBox(width: 20),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.task.brand!.title.toString(),
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      const Text(
                                        'Focus On your project ',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: List.generate(5, (index) {
                                          if (index >= widget.rating!.toInt()) {
                                            return const Icon(
                                              Icons.star_border,
                                              size: 20,
                                              color: Colors.grey,
                                            );
                                          } else if (index >
                                                  widget.rating!.toInt() - 1 &&
                                              index < widget.rating!.toInt()) {
                                            return const Icon(
                                              Icons.star_half,
                                              size: 20,
                                              color: Colors.yellow,
                                            );
                                          } else {
                                            return const Icon(
                                              Icons.star,
                                              size: 20,
                                              color: Colors.yellow,
                                            );
                                          }
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              'Steps (1/4)',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomContainer(
                                  isFirstTextStriked: true,
                                  thirdText: '',
                                  secondTextColor: Colors.white,
                                  containerColor: Colors.white,
                                  borderColor: Colors.green,
                                  iconData: TablerIcons.circle_check_filled,
                                  firstText: 'Install the application',
                                  secondText: '₹20',
                                ),
                                SizedBox(height: 10),
                                CustomContainer(
                                  thirdText:
                                      'lorium ipsum kasvefuoovchebwfuofb hbsafeb  iwibbfa bhabob',
                                  secondTextColor: Colors.white,
                                  containerColor: Colors.white,
                                  borderColor: Colors.orange,
                                  iconData: Icons.settings,
                                  firstText: 'Complete 3 Offers',
                                  secondText: '₹20',
                                ),
                                SizedBox(height: 10),
                                CustomContainer(
                                  thirdText: '',
                                  secondTextColor: Colors.blue,
                                  containerColor:
                                      Color.fromARGB(255, 236, 235, 235),
                                  borderColor:
                                      Color.fromARGB(255, 255, 255, 254),
                                  iconData: Icons.heart_broken,
                                  firstText: 'Refer Work station to friend',
                                  secondText: '₹20',
                                ),
                                SizedBox(height: 10),
                                CustomContainer(
                                  thirdText: '',
                                  secondTextColor: Colors.blue,
                                  containerColor:
                                      Color.fromARGB(255, 236, 235, 235),
                                  borderColor:
                                      Color.fromARGB(255, 255, 255, 254),
                                  iconData: Icons.heart_broken,
                                  firstText: 'Withdraw first Amount',
                                  secondText: '₹20',
                                ),
                                
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.orange,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '23.567 users have already participated',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.orange),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: BlueButton(text: 'Get #364'),
                        ),
                        SizedBox(height: 20)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
