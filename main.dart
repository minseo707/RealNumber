import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'dart:async';
import 'dart:math';
// physics: const NeverScrollableScrollPhysics()

void main() {
  runApp(ChangeNotifierProvider( // context.read<DataStore>().Argument
    create: (c) => DataStore(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp()
    ),
  ));
}

class MyApp extends StatefulWidget { // Home, MainPage
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      )
    );
    Size screenSize = MediaQuery.of(context).size;
    context.read<DataStore>().setSize(screenSize);
    return DraggableHome(
      fullyStretchable: true,
      leading: const Icon(Icons.list, size: 30, color: Color(0xff363649),),
      actions: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: IconButton(
              onPressed: (){},
              icon: const Icon(Icons.settings, size: 30, color: Color(0xff363649),)
          ),
        )
      ],
      backgroundColor: Colors.white,
      appBarColor: const Color(0xffcddfe0),
      title: const Text("[ REAL NUMBER ]", style: TextStyle(
        color: Colors.black,
        fontFamily: "KWTT"
      ),),
      headerWidget: headerWidget(context),
      body: [
        listview(),
      ],
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 45, 10, 0),
        color: const Color(0xffcddfe0),
        alignment: Alignment.center,
        child:  Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.list, size: 30, color: Color(0xff363649)),
                Text("\" REAL NUMBER \"", style: TextStyle(
                  shadows: [
                    Shadow(
                      color: Color(0xff83a4a4),
                      blurRadius: 1,
                      offset: Offset(2.5, 2.5),
                    )
                  ],
                      color: Colors.black,
                      fontSize: 35,
                      fontFamily: "KWTT"
                    ),),
                Icon(Icons.settings, size: 30, color: Color(0xff363649),)
              ],
            ),
            Container(
              width: context.read<DataStore>().screenSizes.width,
              height: 70,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("개념_바로가기", style: TextStyle(
                      fontFamily: "KWTT",
                     fontSize: 19,
                    shadows: [
                      Shadow(
                        color: Color(0xff83a4a4),
                        blurRadius: 1,
                        offset: Offset(2.5, 2.5),
                      )
                    ],
                  ),),
                  Text("View All", style: TextStyle(
                      fontFamily: "Pretendard",
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,

                  ),)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                      onTap: () => Navigator.push(
                      context, SlideTransition2(const LecturePage(titles: "개념강의 : 정적분의 공식", address: "assets/rosua1.jpg",))),
                  child: Container(
                    alignment: Alignment.center,
                    width: context.read<DataStore>().screenSizes.width / 4,
                    height: context.read<DataStore>().screenSizes.height / 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.teal.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(5, 5), // changes position of shadow
                            ),
                          ],
                      ),
                    child: const Text("정적분의 공식", style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w600
                    ),)
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context, SlideTransition2(const LecturePage(titles: "개념강의 : 등차, 등비수열", address: "assets/rosua2.jpg",))),
                  child: Container(
                      alignment: Alignment.center,
                      width: context.read<DataStore>().screenSizes.width / 4,
                      height: context.read<DataStore>().screenSizes.height / 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.teal.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(5, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Text("등차, 등비수열", style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w600
                      ),)
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context, SlideTransition2(const LecturePage(titles: "개념강의 : 비율관계", address: "assets/rosua3.jpg",))),
                  child: Container(
                      alignment: Alignment.center,
                      width: context.read<DataStore>().screenSizes.width / 4,
                      height: context.read<DataStore>().screenSizes.height / 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.teal.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(5, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Text("비율 관계", style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w600
                      ),)
                  ),
                ),
              ],
            )
          ],
        ),
    );
  }

  Widget topRow() {
    return const Row(
      children: [],
    );
  }

  Widget listview() {
    const titleList = ["다항함수의 비율관계", "정적분의 공식", "등차수열과 등비수열", "분수계산 연습", "추후 추가 예정"];
    return Container(
      height: context.read<DataStore>().screenSizes.height,
      color: Colors.white,
      child: AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(context.read<DataStore>().screenSizes.width / 30),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (c, i){
            return AnimationConfiguration.staggeredList(
              position: i,
              delay: const Duration(milliseconds: 100),
              child: SlideAnimation(
                duration: const Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                child: FadeInAnimation(
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(milliseconds: 2500),
                  child: GestureDetector(
                    onTap: () {
                      switch (i){
                        case 0:
                          context.read<DataStore>().random1();
                        case 1:
                          context.read<DataStore>().random2();
                        case 2:
                          context.read<DataStore>().random3();
                        case 3:
                          context.read<DataStore>().random4();
                        default:
                          // NOT RUN
                      }
                      context.read<DataStore>().clearText();
                      Navigator.push(
                        context, SlideTransition1(ProblemPage(titles: titleList[i], problemNumber: context.read<DataStore>().lastProblem[i],)));
                      },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: context.read<DataStore>().screenSizes.width / 20),
                      height: context.read<DataStore>().screenSizes.width / 4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                        border: Border.all(color: Colors.black),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.teal.withOpacity(0.25),
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: const Offset(5, 5)
                          )
                        ]
                      ),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Row( // Row for Design
                          children: [
                            Text(titleList[i],
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w700
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      )
    );
  }
}

class SlideTransition1 extends PageRouteBuilder {
  final Widget page;

  SlideTransition1(this.page)
      : super(
      pageBuilder: (context, animation, anotherAnimation) => page,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 100),
      transitionsBuilder: (context, animation, anotherAnimation, child) {
        animation = CurvedAnimation(
            curve: Curves.fastLinearToSlowEaseIn,
            parent: animation,
            reverseCurve: Curves.fastOutSlowIn);
        return SlideTransition(
          position: Tween(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0))
              .animate(animation),
          child: page,
        );
      });
}

class SlideTransition2 extends PageRouteBuilder {
  final Widget page;

  SlideTransition2(this.page)
      : super(
      pageBuilder: (context, animation, anotherAnimation) => page,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 100),
      transitionsBuilder: (context, animation, anotherAnimation, child) {
        animation = CurvedAnimation(
            curve: Curves.easeOutQuart,
            parent: animation,
            reverseCurve: Curves.fastOutSlowIn);
        return SlideTransition(
          position: Tween(begin: const Offset(0.0, -0.5), end: const Offset(0.0, 0.0))
              .animate(animation),
          child: page,
        );
      });
}

class ProblemPage extends StatefulWidget {
  const ProblemPage({Key? key, this.titles, @required this.problemNumber}) : super(key: key);
  final titles;
  final problemNumber;

  @override
  State<ProblemPage> createState() => _ProblemPageState();
}

class _ProblemPageState extends State<ProblemPage> {
  @override
  Widget build(BuildContext context) {
    context.read<DataStore>().tempSave(widget.titles);
    return Scaffold(
      body: SlideFadeTransition(
        curve: Curves.fastLinearToSlowEaseIn,
        delayStart: const Duration(milliseconds: 50),
        animationDuration: const Duration(milliseconds: 700),
        offset: 1.3,
        direction: Direction.vertical,
        child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: context.read<DataStore>().screenSizes.width * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.6, color: Colors.black87),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.withOpacity(0.25),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(5, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(context.read<DataStore>().addresslist[widget.problemNumber]),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: context.read<DataStore>().screenSizes.width * 0.8,
                  height: context.read<DataStore>().screenSizes.height * 0.05,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.6, color: Colors.black87),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.withOpacity(0.25),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(5, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: context.read<DataStore>().inputtext.isEmpty? const Text("답안을 입력하세요.", style: TextStyle(
                        color: Colors.black54,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w700
                    ))
                        : Text(context.read<DataStore>().inputtext, style: const TextStyle(
                      color: Colors.black87,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w600
                    ),),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.6, color: Colors.black87),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.withOpacity(0.25),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(5, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  width: context.read<DataStore>().screenSizes.width * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                width: context.read<DataStore>().screenSizes.width * 0.2,
                                height: context.read<DataStore>().screenSizes.height * 0.07,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.6, color: Colors.black87),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.teal.withOpacity(0.25),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(5, 5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Text("1",style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xdd0a1818)
                                )),
                              ),
                              onTap: (){
                                 setState(() {
                                   context.read<DataStore>().addText('1');
                                 });
                              },
                            ),
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                width: context.read<DataStore>().screenSizes.width * 0.2,
                                height: context.read<DataStore>().screenSizes.height * 0.07,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.6, color: Colors.black87),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.teal.withOpacity(0.25),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(5, 5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Text("2",style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xdd0a1818)
                                )),
                              ),
                              onTap: (){
                                setState(() {
                                  context.read<DataStore>().addText('2');
                                });
                              },
                            ),
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                width: context.read<DataStore>().screenSizes.width * 0.2,
                                height: context.read<DataStore>().screenSizes.height * 0.07,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.6, color: Colors.black87),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.teal.withOpacity(0.25),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(5, 5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Text("3",style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xdd0a1818)
                                )),
                              ),
                              onTap: (){
                                setState(() {
                                  context.read<DataStore>().addText('3');
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                width: context.read<DataStore>().screenSizes.width * 0.2,
                                height: context.read<DataStore>().screenSizes.height * 0.07,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.6, color: Colors.black87),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.teal.withOpacity(0.25),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(5, 5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Text("4",style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xdd0a1818)
                                )),
                              ),
                              onTap: (){
                                setState(() {
                                  context.read<DataStore>().addText('4');
                                });
                              },
                            ),
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                width: context.read<DataStore>().screenSizes.width * 0.2,
                                height: context.read<DataStore>().screenSizes.height * 0.07,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.6, color: Colors.black87),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.teal.withOpacity(0.25),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(5, 5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Text("5",style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xdd0a1818)
                                )),
                              ),
                              onTap: (){
                                setState(() {
                                  context.read<DataStore>().addText('5');
                                });
                              },
                            ),
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                width: context.read<DataStore>().screenSizes.width * 0.2,
                                height: context.read<DataStore>().screenSizes.height * 0.07,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.6, color: Colors.black87),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.teal.withOpacity(0.25),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(5, 5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Text("6",style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xdd0a1818)
                                )),
                              ),
                              onTap: (){
                                setState(() {
                                  context.read<DataStore>().addText('6');
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                width: context.read<DataStore>().screenSizes.width * 0.2,
                                height: context.read<DataStore>().screenSizes.height * 0.07,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.6, color: Colors.black87),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.teal.withOpacity(0.25),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(5, 5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Text("7",style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xdd0a1818)
                                )),
                              ),
                              onTap: (){
                                setState(() {
                                  context.read<DataStore>().addText('7');
                                });
                              },
                            ),
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                width: context.read<DataStore>().screenSizes.width * 0.2,
                                height: context.read<DataStore>().screenSizes.height * 0.07,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.6, color: Colors.black87),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.teal.withOpacity(0.25),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(5, 5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Text("8",style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xdd0a1818)
                                )),
                              ),
                              onTap: (){
                                setState(() {
                                  context.read<DataStore>().addText('8');
                                });
                              },
                            ),
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                width: context.read<DataStore>().screenSizes.width * 0.2,
                                height: context.read<DataStore>().screenSizes.height * 0.07,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.6, color: Colors.black87),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.teal.withOpacity(0.25),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(5, 5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Text("9",style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xdd0a1818)
                                )),
                              ),
                              onTap: (){
                                setState(() {
                                  context.read<DataStore>().addText('9');
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                width: context.read<DataStore>().screenSizes.width * 0.2,
                                height: context.read<DataStore>().screenSizes.height * 0.07,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.6, color: Colors.black87),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.teal.withOpacity(0.25),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(5, 5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Text("BACK",style: TextStyle(
                                  fontFamily: "Pretendard",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xdd0a1818)
                                ),),
                              ),
                              onTap: (){
                                setState(() {
                                  context.read<DataStore>().removeText();
                                });
                              },
                              onLongPress: (){
                                setState(() {
                                  context.read<DataStore>().clearText();
                                });
                              },
                            ),
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                width: context.read<DataStore>().screenSizes.width * 0.2,
                                height: context.read<DataStore>().screenSizes.height * 0.07,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.6, color: Colors.black87),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.teal.withOpacity(0.25),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(5, 5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Text("0",style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xdd0a1818)
                                )),
                              ),
                              onTap: (){
                                if (context.read<DataStore>().inputtext.isNotEmpty){
                                setState(() {
                                  context.read<DataStore>().addText('0');
                                });
                                }
                              },
                            ),
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                width: context.read<DataStore>().screenSizes.width * 0.2,
                                height: context.read<DataStore>().screenSizes.height * 0.07,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.6, color: Colors.black87),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.teal.withOpacity(0.25),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(5, 5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Text("ENTER",style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xdd0a1818)
                                )),
                              ),
                              onTap: (){
                                setState(() { // 제출버튼 알고리즘
                                  if (context.read<DataStore>().inputtext == context.read<DataStore>().answerlist[widget.problemNumber]){
                                    showDialog(
                                      barrierColor: Colors.black54,
                                      context: context,
                                      builder: (BuildContext context){
                                        return AlertDialog(
                                          title: const Text("정답입니다!", style: TextStyle(
                                              fontFamily: "Pretendard",
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800,
                                              color: Color(0xdd0a1818)
                                          ),),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: (){
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            }, child: const Text("OK", style: TextStyle(
                                                fontFamily: "Pretendard",
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xdd0a1818)
                                            ),),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white,
                                              shadowColor: Colors.teal.withOpacity(1),
                                              elevation: 3

                                            ),)
                                          ],
                                        );
                                      },
                                      barrierDismissible: false,
                                    );
                                  }
                                  context.read<DataStore>().clearText();
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ]
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: const Color(0xff83a4a4),
        elevation: 2,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
          color: Colors.black87,
        ),
        backgroundColor: const Color(0xffcddfe0),
        centerTitle: true,
        title: Text("[ ${context.read<DataStore>().tempFile} ]",
          style: const TextStyle(
              color: Colors.black87,
              fontFamily: "Pretendard",
              fontWeight: FontWeight.w600,
              fontSize: 17
          ),
        ),
      ),
    );
  }
}

class LecturePage extends StatefulWidget {
  const LecturePage({Key? key, this.titles, this.address}) : super(key: key);
  final titles;
  final address;

  @override
  State<LecturePage> createState() => _LecturePageState();
}

class _LecturePageState extends State<LecturePage> {
  @override
  Widget build(BuildContext context) {
    context.read<DataStore>().tempSave(widget.titles);
    return Scaffold(
      body: SlideFadeTransition(
        curve: Curves.fastLinearToSlowEaseIn,
        delayStart: const Duration(milliseconds: 150),
        animationDuration: const Duration(milliseconds: 1000),
        offset: -0.8,
        direction: Direction.vertical,
        child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: context.read<DataStore>().screenSizes.width * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.6, color: Colors.black87),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.withOpacity(0.25),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(5, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(widget.address),
                  ),
                ),]
          ),
        ),
      ),

      backgroundColor: const Color(0xfff0f7f8),
      appBar: AppBar(
        shadowColor: const Color(0xff83a4a4),
        elevation: 2,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
          color: Colors.black87,
        ),
        backgroundColor: const Color(0xffcddfe0),
        centerTitle: true,
        title: Text("[ ${context.read<DataStore>().tempFile} ]",
          style: const TextStyle(
              color: Colors.black87,
              fontFamily: "Pretendard",
              fontWeight: FontWeight.w600,
              fontSize: 17
          ),
        ),
      ),
    );
  }
}


enum Direction { vertical, horizontal }

class SlideFadeTransition extends StatefulWidget {
  final Widget child;

  final double offset;

  final Curve curve;

  final Direction direction;

  final Duration delayStart;

  final Duration animationDuration;

  SlideFadeTransition({
    required this.child,
    this.offset = 1.0,
    this.curve = Curves.easeIn,
    this.direction = Direction.vertical,
    this.delayStart = const Duration(seconds: 0),
    this.animationDuration = const Duration(milliseconds: 800),
  });

  @override
  _SlideFadeTransitionState createState() => _SlideFadeTransitionState();
}

class _SlideFadeTransitionState extends State<SlideFadeTransition>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _animationSlide;

  late AnimationController _animationController;

  late Animation<double> _animationFade;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    if (widget.direction == Direction.vertical) {
      _animationSlide =
          Tween<Offset>(begin: Offset(0, widget.offset), end: const Offset(0, 0))
              .animate(CurvedAnimation(
            curve: widget.curve,
            parent: _animationController,
          ));
    } else {
      _animationSlide =
          Tween<Offset>(begin: Offset(widget.offset, 0), end: const Offset(0, 0))
              .animate(CurvedAnimation(
            curve: widget.curve,
            parent: _animationController,
          ));
    }

    _animationFade =
        Tween<double>(begin: -1.0, end: 1.0).animate(CurvedAnimation(
          curve: widget.curve,
          parent: _animationController,
        ));

    Timer(widget.delayStart, () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationFade,
      child: SlideTransition(
        position: _animationSlide,
        child: widget.child,
      ),
    );
  }
}




class DataStore extends ChangeNotifier {
  Size screenSizes = const Size(0, 0);

  List<int> lastProblem = [0, 0, 0, 0];

  List<int> lastProblemTemp = [0, 0, 0, 0];

  String inputtext = "";

  List<String> answerlist = [
    "16",
    "8",
    "54",
    "54",
    "96",
    "40",
    "10",
    "243",
    "32",
    "5",
    "5",
    "37"
  ];

  List<String> addresslist = [
    "assets/answp1.png",
    "assets/answp2.png",
    "assets/answp3.png",
    "assets/answp4.png",
    "assets/answp5.png",
    "assets/answp6.png",
    "assets/answp7.png",
    "assets/answp8.png",
    "assets/answp9.png",
    "assets/answp10.png",
    "assets/answp11.png",
    "assets/answp12.png"
  ];

  random1 (){
    while (lastProblemTemp[0] == lastProblem[0] || lastProblem[0] == 0){
      lastProblemTemp[0] = Random().nextInt(3);
      print(lastProblemTemp[0]);
      if (lastProblemTemp[0] != lastProblem[0]){
        lastProblem[0] = lastProblemTemp[0];
        break;
      }
    }
    notifyListeners();
  }

  random2 (){
    while (lastProblemTemp[1] == lastProblem[1] || lastProblem[1] == 0){
      lastProblemTemp[1] = Random().nextInt(3) + 3;
      if (lastProblemTemp[1] != lastProblem[1]){
        lastProblem[1] = lastProblemTemp[1];
        break;
      }
    }
    notifyListeners();
  }

  random3 (){
    while (lastProblemTemp[2] == lastProblem[2] || lastProblem[2] == 0){
      lastProblemTemp[2] = Random().nextInt(3) + 6;
      if (lastProblemTemp[2] != lastProblem[2]){
        lastProblem[2] = lastProblemTemp[2];
        break;
      }
    }
    notifyListeners();
  }

  random4 (){
    while (lastProblemTemp[3] == lastProblem[3] || lastProblem[3] == 0){
      lastProblemTemp[3] = Random().nextInt(3) + 9;
      if (lastProblemTemp[3] != lastProblem[3]){
        lastProblem[3] = lastProblemTemp[3];
        break;
      }
    }
    notifyListeners();
  }

  inText (value){
    inputtext = value;
  }

  addText(value){
    inputtext += value;
    notifyListeners();
  }

  removeText(){
    if (inputtext != "") {
      inputtext = inputtext.substring(0, inputtext.length - 1);
    }
    notifyListeners();
  }

  clearText(){
    inputtext = "";
  }

  setSize (size){
    screenSizes = size;
  }

  var tempFile = "";

  tempSave(data){
    tempFile = data;
  }

}

