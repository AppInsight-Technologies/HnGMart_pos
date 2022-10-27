import 'package:flutter/material.dart';

class ExportButton extends StatelessWidget {
  const ExportButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    // decoration: BoxDecoration(
    //   shape: BoxShape.circle,
    // ),
    // //width: 40,
    // padding: EdgeInsets.symmetric(vertical:0.0,horizontal: 2.0),
    // child: Row(
    //   children: [
    //     MaterialButton(onPressed: (){},color: Colors.green,
    //     ImageIcon(
    //       AssetImage("images/icon5.png"),
    //       color: Colors.white,
    //       size: 12,
    //     ),
    // Text("Export",style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),)
    //     ),],
    // ),
    // );

    return MaterialButton(onPressed: (){},
        color: Colors.green,
        padding: EdgeInsets.symmetric(vertical:0.0,horizontal: 2.0),
        child: Row(
          children: const [
          ImageIcon(
                 AssetImage("images/icon5.png"),
                color: Colors.white,
                 size: 11,
               ),
            // Icon(Icons.add,color: Colors.white),
            Text(" Export",style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),)
          ],
        )
    );

  }
}
