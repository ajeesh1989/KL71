import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DestinationDetailPage extends StatefulWidget {
  const DestinationDetailPage({
    super.key,
  });

  @override
  _DestinationDetailPageState createState() => _DestinationDetailPageState();
}

class _DestinationDetailPageState extends State<DestinationDetailPage>
    with SingleTickerProviderStateMixin {
  final List<String> tabs = ["About", "Nearby", "Stay", "Photos", "Videos"];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.network(
                "https://i.pinimg.com/736x/76/e1/06/76e10643d5a923c42b76e79b7cff0446.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 310),
              width: MediaQuery.of(context).size.width,
              height: 500,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.white.withOpacity(0),
                  Colors.white.withOpacity(0.2),
                  Colors.white.withOpacity(0.9),
                  Colors.white.withOpacity(1)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: GlassmorphicContainer(
                                linearGradient: const LinearGradient(
                                    colors: [Colors.white10, Colors.white30]),
                                blur: 10,
                                width: 45,
                                height: 45,
                                borderRadius: 12,
                                borderGradient: const LinearGradient(
                                    colors: [Colors.white10, Colors.white10]),
                                border: 1,
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    color: Colors.white,
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.31,
                      ),
                      const SizedBox(
                        height: 90,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                "BUNGALOW HILL",
                                style: GoogleFonts.manrope(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      // TabBar with TabBarView
                      SizedBox(
                        height: 40, // Increase the height of the TabBar
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: TabBar(
                            isScrollable: true, // Enable horizontal scrolling
                            indicatorSize: TabBarIndicatorSize.tab,
                            controller: _tabController,
                            indicator: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            indicatorWeight:
                                3, // Increase the width of the indicator
                            labelColor: Colors
                                .black, // Set the selected tab text color to white
                            unselectedLabelStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                            tabs: tabs.map((tab) => Tab(text: tab)).toList(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: const [
                            Center(child: Text("dasdsdad")),
                            Center(child: Text("Nearby Content")),
                            Center(child: Text("Stay Content")),
                            Center(child: Text("Photos Content")),
                            Center(child: Text("Videos Content")),
                          ],
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
  }
}
