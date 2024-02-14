import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shonish_assignment/app/modules/detail_screen/views/offer_detail_screen.dart';
import 'package:shonish_assignment/app/modules/home_screen/models/tasks_model.dart';

class Block extends StatefulWidget {
  const Block({
    Key? key,
    required this.task,
  }) : super(key: key);

  final TasksModel task;
  @override
  State<Block> createState() => _BlockState();
}

class _BlockState extends State<Block> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
            color: Color(int.parse(
                    widget.task.customData!.dominantColor!.substring(1),
                    radix: 16) +
                0xFF000000)),
      ),
      margin: EdgeInsets.symmetric(vertical: 10.r),
      child: Row(
        children: [
          Container(
            width: Get.width / 5,
            height: Get.width / 5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.task.brand!.logo.toString(),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.task.title.toString(),
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(OfferDetail(rating: 4, task: widget.task),transition: Transition.rightToLeft);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          'Get ₹${widget.task.payoutAmt.toString()}',
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.bolt,
                          color: Colors.orange,
                          size: 16,
                        ),
                        Text('${widget.task.totalLead}',style: TextStyle(color: Colors.orange,fontSize: 12),)
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
