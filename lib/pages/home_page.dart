import 'package:banking_app_with_provider/pages/add_card_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        // shrinkWrap: true,
        children: [

          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 200,
                width: width * 0.8,
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.indigo
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('TBC Bank', style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600),),

                    SizedBox(height: 25,),

                    Text('TBC', style: TextStyle(color: Color.fromRGBO(162, 168, 175, 1.0)),),

                    SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('9860 3501 2312 1235', style: TextStyle(color: Colors.white70, fontSize: 17, fontWeight: FontWeight.w800),),

                        Text('05/26', style: TextStyle(color: Colors.white70, fontSize: 17, fontWeight: FontWeight.w800),),
                      ],
                    ),

                    SizedBox(height: 25,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('123456  so\'m', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),

                        Text('Uzcard', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 100,),

          InkWell(
            onTap: () => Navigator.pushNamed(context, '/add_card'),
            child: Container(
              width: width * 0.8,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(241, 241, 241, 1),
              ),
              child: const Icon(CupertinoIcons.add, size: 40,)
            ),
          ),

          const SizedBox(height: 100,),

        ],
      ),
    );
  }
}
