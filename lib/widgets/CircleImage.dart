import 'package:flutter/material.dart';

import '../constant/constants.dart';

class CircleImage extends StatelessWidget {
  String imageUrl;
  String ingredients;
  String title;
  String price;
  CircleImage(
      {super.key,
      required this.imageUrl,
      required this.ingredients,
      required this.title,
      required this.price});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: buttonColor,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: screenSize.width > 480 ? 180 : 140,
              width: screenSize.width > 480 ? 180 : 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),

                //            CachedNetworkImage(
                //   imageUrl: imageUrl,
                //   imageBuilder: (context, imageProvider) {
                //     return Container(
                //       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadiusDirectional.circular(18),
                //         image: DecorationImage(
                //           fit: BoxFit.cover,
                //           image: imageProvider,
                //         ),
                //       ),
                //     );
                //    },
                //   placeholder: (context, url) {
                //     return Center(
                //       child: CircularProgressIndicator(),
                //     );
                //   },
                //   errorWidget: (context, url, error) {
                //     return Icon(Icons.error);
                //   },
                // ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ingredients,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '\$ ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: buttonColor,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: buttonColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
