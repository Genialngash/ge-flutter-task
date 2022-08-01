
import 'package:flutter/material.dart';
import 'package:ge_flutter_task/utils/size_config.dart';

class MenuWidget extends StatelessWidget {
  MenuWidget({
    required this.icon,
    required this.istextBlack,
    required this.title,
    required this.gradientColors,
    Key? key,
  }) : super(key: key);
  Icon icon;
  String title;
  List<Color> gradientColors;
  bool istextBlack;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 8, right: 10),
      child: Material(
        elevation: 2.3,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        child: Container(
          height: SizeConfig.screenHeight * .13,
          width: SizeConfig.screenWidth * .3,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  0.1,
                  0.6,
                ],
                colors: gradientColors,
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(alignment: Alignment.centerLeft, child: icon),
              Text(
                title,
                style: TextStyle(
                    color: istextBlack ? Colors.black54 : Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: getProportionalScreenWidth(15)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BodyListTiles extends StatelessWidget {
  BodyListTiles(
      {required this.leadingWidget,
      required this.subtitle,
      required this.title,
      Key? key})
      : super(key: key);
  Widget leadingWidget;
  String title;
  String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 2,
          child: ListTile(
            leading: leadingWidget,
            title: Text(
              title,
              style: TextStyle(color: Colors.black54),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: getProportionalScreenWidth(14)),
            ),
          ),
        )
      ],
    );
  }
}
