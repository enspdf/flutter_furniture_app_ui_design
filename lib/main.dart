import 'package:flutter/material.dart';
import 'package:flutter_furniture_app_ui_design/custom_icons.dart';
import 'package:flutter_furniture_app_ui_design/data.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  Widget _buildGradientContainer(double width, double height) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: width * .8,
        height: height / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFBFCFD),
              Color(0xFFF2F3F8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Positioned(
      top: 40,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              CustomIcons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              CustomIcons.menu,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(double height) {
    return Positioned(
      top: height * .2,
      left: 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Wooden Armchair',
            style: TextStyle(fontSize: 28, fontFamily: 'Montserrat-Bold'),
          ),
          Text(
            'Lorem Ipsem',
            style: TextStyle(fontSize: 16, fontFamily: 'Montserrat-Medium'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F3F8),
      body: LayoutBuilder(
        builder: (context, constraints) {
          var width = constraints.maxWidth;
          var height = constraints.maxHeight;

          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _buildGradientContainer(width, height),
              _buildAppBar(),
              _buildTitle(height),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: height * 0.6,
                  child: ListView.builder(
                    itemCount: images.length,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 35, bottom: 60),
                        child: SizedBox(
                          width: 200,
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 45),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: (index % 2 == 0)
                                        ? Colors.white
                                        : Color(0xFF2A2D3F),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0, 10),
                                        blurRadius: 10,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    images[index],
                                    width: 172.5,
                                    height: 199,
                                  ),
                                  SizedBox(height: 12),
                                  Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          title[index],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Montserrat-Bold',
                                            color: (index % 2 == 0)
                                                ? Color(0xFF2A2D3F)
                                                : Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'NEW SELL',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Montserrat-Medium',
                                            color: (index % 2 == 0)
                                                ? Color(0xFF2A2D3F)
                                                : Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 50),
                                        Text(
                                          '${price[index]} \$',
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontFamily: 'Montserrat-Bold',
                                            color: (index % 2 == 0)
                                                ? Color(0xFF2A2D3F)
                                                : Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.panorama_horizontal),
              title: Container(
                height: 0,
              )),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            title: Container(
              height: 0,
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          color: Color(0xFFFA7B58),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0xFFF78A6C).withOpacity(.6),
              offset: Offset(0, 10),
              blurRadius: 10,
            ),
          ],
        ),
        child: RawMaterialButton(
          shape: CircleBorder(),
          child: Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
