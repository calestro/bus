import 'package:bus/Compents/theme.dart';
import 'package:flutter/material.dart';


class InfoActivy extends StatelessWidget {
  const InfoActivy({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    MyStyle myStyle = MyStyle();

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height:20),
            Text("Informações", style:myStyle.titleBus ,),
            SizedBox(height: 20),
            Text("Versão Alpha 0.2", style:myStyle.version,),
            SizedBox(height: 10),
            Text("Aplicativo regido na licença M.I.T "),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                myStyle.myIcon(22,"git.png"),
                Text("   https://github.com/calestro/bus"),
              ],
            ),
            SizedBox(height: 80),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                myStyle.myIcon(80, "gitBig.png"),
                myStyle.myIcon(40, "link.png"),
                myStyle.myIcon(65, "face.png"),
              ],
            ),
            Text("Desenvolvedor: Leonir Jùnior Ribeiro Calestro" ,style:TextStyle(fontWeight: FontWeight.bold)),



          ],
        ),
      ),
    );
  }
}
