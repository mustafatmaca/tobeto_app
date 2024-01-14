import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tobeto_app/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = PageController(viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final pages = [
      Container(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: Image.asset("assets/sayfa1.png").image)),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
              ),
              Image.asset("assets/tobeto-logo.png",
                  width: MediaQuery.of(context).size.width * 0.5),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "TOBETO",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                  children: <TextSpan>[
                    TextSpan(
                      text: "'ya hoş geldin!",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset("assets/sayfa2.png").image)),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                ),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    text: "Yeni nesil öğrenme deneyimi ile ",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyLarge!.color),
                    children: <TextSpan>[
                      TextSpan(
                        text: "TOBETO ",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                      ),
                      TextSpan(
                        text: "kariyer yolculuğunda senin yanında!",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 150),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: const Text("Hadi Başlayalım"),
                    ))
              ],
            ),
          ),
        ),
      )
    ];

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            // itemCount: pages.length,
            itemBuilder: (_, index) {
              return pages[index % pages.length];
            },
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            top: 0,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: MediaQuery.of(context).size.height * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                      controller: controller,
                      count: pages.length,
                      effect: WormEffect(
                        activeDotColor: Theme.of(context).colorScheme.primary,
                        dotHeight: 8,
                        dotWidth: 8,
                      )
                      // ExpandingDotsEffect(
                      //   activeDotColor: Theme.of(context).colorScheme.primary,
                      //   dotHeight: 8,
                      //   dotWidth: 8,
                      // ),
                      ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text("Atla",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background)))
                ],
              ),
            ),
          ),
        ],
      ),
      // Container(
      //   color: Theme.of(context).primaryColor.withOpacity(1),
      //   child: SafeArea(
      //     child: SingleChildScrollView(
      //       child: Stack(
      //         children: [
      //           Container(
      //             height: MediaQuery.of(context).size.height,
      //             width: MediaQuery.of(context).size.width,
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Column(
      //               children: <Widget>[
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     SmoothPageIndicator(
      //                       controller: controller,
      //                       count: pages.length,
      //                       effect: ExpandingDotsEffect(
      //                         activeDotColor:
      //                             Theme.of(context).colorScheme.secondary,
      //                         dotHeight: 8,
      //                         dotWidth: 8,
      //                       ),
      //                     ),
      //                     TextButton(
      //                         onPressed: () {
      //                           Navigator.pushReplacement(
      //                             context,
      //                             MaterialPageRoute(
      //                               builder: (context) => LoginScreen(),
      //                             ),
      //                           );
      //                         },
      //                         child: Text(
      //                           "Atla",
      //                           style: Theme.of(context)
      //                               .textTheme
      //                               .bodyMedium!
      //                               .copyWith(
      //                                 color: Theme.of(context)
      //                                     .colorScheme
      //                                     .secondary,
      //                               ),
      //                         ))
      //                   ],
      //                 ),
      //                 SizedBox(
      //                   height: MediaQuery.of(context).size.height,
      //                   width: MediaQuery.of(context).size.width,
      //                   child: PageView.builder(
      //                     clipBehavior: Clip.none,
      //                     controller: controller,
      //                     // itemCount: pages.length,
      //                     itemBuilder: (_, index) {
      //                       return pages[index % pages.length];
      //                     },
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.only(top: 24, bottom: 12),
      //                   child: Text(
      //                     'Worm',
      //                     style: TextStyle(color: Colors.black54),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
