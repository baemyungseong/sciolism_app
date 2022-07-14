//import constants
import 'package:sciolism_app/constants/colors.dart';

//import route
import 'package:sciolism_app/screens/route/route.dart';

//import views
import 'package:sciolism_app/screens/onboarding/onboardingScreen1.dart';
import 'package:sciolism_app/screens/onboarding/onboardingScreen2.dart';
import 'package:sciolism_app/screens/onboarding/onboardingScreen3.dart';

//import others
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

// --------

class onboardingWrapper extends StatefulWidget {
  @override
  _onboardingWrapperState createState() => _onboardingWrapperState();
}

class _onboardingWrapperState extends State<onboardingWrapper> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    onboardingScreen1(),
    onboardingScreen2(),
    onboardingScreen3()
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Container(
            padding: EdgeInsets.only(bottom: 24, left: 24, right: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //dots
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:
                            List<Widget>.generate(_pages.length, (int index) {
                          return AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              height: 6,
                              width: (index == _currentPage) ? 24 : 6,
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              decoration: (index == _currentPage)
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: black1,
                                    )
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: grey1.withOpacity(0.8),
                                    ));
                        })),
                    Spacer(),
                    //button navigation
                    (_currentPage == (_pages.length - 1))
                        ? Container(
                            child: GestureDetector(
                            //action navigate to authentication screen
                            onTap: () {
                              Navigator.of(context).push(createRoute("authentication"));
                            },
                            child: AnimatedContainer(
                                alignment: Alignment.center,
                                duration: Duration(milliseconds: 300),
                                height: 40,
                                width: 168,
                                decoration: BoxDecoration(
                                  color: black1,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  "Thử ngay miễn phí",
                                  style: TextStyle(
                                      color: white2,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                )),
                          ))
                        : Container(
                            child: GestureDetector(
                            //action navigate to next onboarding screen
                            onTap: () {
                              _controller.nextPage(
                                  duration: Duration(milliseconds: 800),
                                  curve: Curves.easeInOutQuint);
                            },
                            child: AnimatedContainer(
                                alignment: Alignment.center,
                                duration: Duration(milliseconds: 300),
                                height: 40,
                                width: 117,
                                decoration: BoxDecoration(
                                  color: black1,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  "Tiếp theo",
                                  style: TextStyle(
                                      color: white2,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                )),
                          )),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
