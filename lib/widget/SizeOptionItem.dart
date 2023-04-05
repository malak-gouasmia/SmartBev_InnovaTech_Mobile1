import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile1/constant/constants.dart';


class SizeOptionItem extends StatelessWidget {
  final int index;
  final String sizeOption;
  final bool selected;
  const SizeOptionItem({
    Key? key,
    required this.index,
    required this.sizeOption,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 66,
          width: 120,
          // decoration: BoxDecoration(
          //     color: selected ? buttonColor : buttonColor.withOpacity(0.3),
          //     shape: BoxShape.circle),
          child: Center(
            child: SvgPicture.asset(
              'images/coffee-cup.svg',
              color: selected ? black : buttonColor,
              width: 26 + (index * 10),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(sizeOption,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5)),
      ],
    );
  }
}
