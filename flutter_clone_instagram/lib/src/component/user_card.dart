import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'avata_widget.dart';

class PeopleCard extends StatelessWidget {
  const PeopleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1.0,color: Colors.grey),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AvataWidget(
                thumbPath:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyO54ePwijeKy1Md4reqPPtI3jUX1fXNSGqg&usqp=CAU',
                type: AvataType.HISTORY_AVATA,
                size: 90,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
