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
  // ignore: library_private_types_in_public_api
  _DestinationDetailPageState createState() => _DestinationDetailPageState();
}

class _DestinationDetailPageState extends State<DestinationDetailPage>
    with SingleTickerProviderStateMixin {
  final List<String> tabs = [
    "About",
    "Things to do",
    "Nearby",
    "Stay",
    "Photos",
    "Videos"
  ];
  late TabController _tabController;

  final List<String> thingsToDo = [
    "https://images.pexels.com/photos/1365425/pexels-photo-1365425.jpeg?cs=srgb&dl=pexels-eric-sanman-1365425.jpg&fm=jpg",
    "https://www.deccanherald.com/sites/dh/files/article_images/2016/07/14/557810.jpg",
    "https://static.toiimg.com/thumb/msid-91658217,width-748,height-499,resizemode=4,imgsize-108962/.jpg",
    "https://loveincorporated.blob.core.windows.net/contentimages/gallery/338179ba-31c3-4e19-b34b-57d145f2ed2c-sunrise_spots_hawaii.jpg",
    "https://assets.cntraveller.in/photos/630dc21d3c602c95d2bace10/master/w_1600%2Cc_limit/nagaland-offroad-9.jpg"
  ];
  // things to do dummy pics

  final List<String> thingsToDoHeadings = [
    "Trekking",
    "Boating",
    "Camping",
    "View point",
    "Off road",
  ];

  final List<String> nearby = [
    "https://i.ytimg.com/vi/nHSqbTt5_cw/maxresdefault.jpg",
    "https://i.ytimg.com/vi/bQZAM_WlWX8/maxresdefault.jpg",
    "https://i.ytimg.com/vi/KKU3gg0XDKg/maxresdefault.jpg",
    "https://i.ytimg.com/vi/FFeWzLSslDQ/maxresdefault.jpg",
    "https://i.ytimg.com/vi/4shCHxDWT7U/maxresdefault.jpg",
  ];
// lsit view for nearby.. dummy data
  final List<String> nearbyHeading = [
    "Teak museum",
    "Canoly plot",
    "Kakkadampoyil hills",
    "Adyanpara waterfalls",
    "Orka Swimming pool & resort"
  ];
// nearby headings demo

  final List<String> staypics = [
    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/1f/a1/d9/hotel-park-residency.jpg?w=300&h=200&s=1",
    "https://ak-d.tripcdn.com/images/0223y120008jn6o6v392E_R_300_225_R5.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3QANz6jdM7jyW8l-HZDNkewc9PWaWmMEnxg&usqp=CAU",
    "https://lh3.googleusercontent.com/p/AF1QipNLXQI8fh9oTObUxGfPuH2TdAnMcpvC44vM_FRn=w1080-h608-p-no-v0",
    "https://www.keralatourism.org/images/destination/large/teak_museum_nilambur20131031120337_344_1.jpg"
  ];
  // stay room pics dummy

  final List<String> stayheading = [
    "Park residency",
    "Red palace",
    "Hill top hotel 5 star",
    "Government bungalow",
    "Hut stay nilambur"
    // stay heading dummy data
  ];

  final List<String> photos = [
    "https://i.ytimg.com/vi/nHSqbTt5_cw/maxresdefault.jpg",
    "https://i.ytimg.com/vi/bQZAM_WlWX8/maxresdefault.jpg",
    "https://i.ytimg.com/vi/KKU3gg0XDKg/maxresdefault.jpg",
    "https://i.ytimg.com/vi/FFeWzLSslDQ/maxresdefault.jpg",
    "https://i.ytimg.com/vi/4shCHxDWT7U/maxresdefault.jpg",
    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/1f/a1/d9/hotel-park-residency.jpg?w=300&h=200&s=1",
    "https://ak-d.tripcdn.com/images/0223y120008jn6o6v392E_R_300_225_R5.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3QANz6jdM7jyW8l-HZDNkewc9PWaWmMEnxg&usqp=CAU",
    "https://lh3.googleusercontent.com/p/AF1QipNLXQI8fh9oTObUxGfPuH2TdAnMcpvC44vM_FRn=w1080-h608-p-no-v0",
    "https://www.keralatourism.org/images/destination/large/teak_museum_nilambur20131031120337_344_1.jpg"
  ];
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
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              "https://i.pinimg.com/736x/76/e1/06/76e10643d5a923c42b76e79b7cff0446.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 18, right: 18),
            child: SizedBox(
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
                          onPressed: () {},
                          color: Colors.white,
                          icon: const Icon(
                            Icons.share,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 310),
            width: MediaQuery.of(context).size.width,
            height: 500,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.white.withOpacity(0),
                Colors.white.withOpacity(0.4),
                Colors.white.withOpacity(1),
                Colors.white.withOpacity(1)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.31,
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Bunglow Hill",
                        style: GoogleFonts.manrope(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 40,
                    child: TabBar(
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: _tabController,
                      indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      indicatorWeight: 3,
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.black,
                      unselectedLabelStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                      tabs: tabs.map((tab) => Tab(text: tab)).toList(),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Center(
                          child: ListView(
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              const Text(
                                "dasdsdadfbfsiBFIAFISAHFSASSAfhhfuasfashfhsajfhasiufasufhsaifsafnnsfashaehaheakjesesabibadiasdbnasibdisadsiaudhpaoieodasbiduasidhasihdaisuhdiusahdiaushdiuahewhewdibdiuasidhasidhasfbfuhwqihewioewqeiwbdiaiudaiphdahdiuahdadbadaishdaisuhdaihdiuhewhqeiwqdiasdihadashdidiusahiohwqehwiubdakdhsaihdisauhdiausheiwqniwhdoh",
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 40,
                                      ),
                                      Text('LOCATION')
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.directions,
                                        size: 40,
                                      ),
                                      Text('NAVIGATION')
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'How to reach',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        MaterialButton(
                                          onPressed: () {},
                                          color: Colors.grey,
                                          textColor: Colors.white,
                                          padding: const EdgeInsets.all(16),
                                          shape: const CircleBorder(),
                                          child: const Icon(
                                            Icons.bus_alert,
                                            size: 24,
                                          ),
                                        ),
                                        const Expanded(
                                          // Wrap the Text widget with Expanded
                                          child: Text(
                                            'Bunglow hill is only a few minutes drive from chandakkunnu bus stand',
                                            maxLines:
                                                10, // Limit the number of lines to prevent overflow
                                            overflow: TextOverflow
                                                .visible, // Display ellipsis if text overflows
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // About page listview
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Center(
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Image.network(
                                      fit: BoxFit.fill, thingsToDo[index]),
                                  title: Text(thingsToDoHeadings[index]),
                                );
                              },
                              itemCount: 5,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider(
                                  height: 40,
                                );
                              },
                            ),
                          ),
                        ),
                        // Things to do
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Center(
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Image.network(
                                    fit: BoxFit.fill,
                                    nearby[index],
                                  ),
                                  title: Text(nearbyHeading[index]),
                                );
                              },
                              itemCount: 5,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider(
                                  height: 40,
                                );
                              },
                            ),
                          ),
                        ),
                        // Nearby listview seperator
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Center(
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Image.network(
                                    staypics[index],
                                    fit: BoxFit.fill,
                                  ),
                                  title: Text(stayheading[index]),
                                );
                              },
                              itemCount: 5,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider(
                                  height: 40,
                                );
                              },
                            ),
                          ),
                        ),
                        // stay tabbar
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Center(
                              child: GridView.count(
                            crossAxisCount: 2,
                            children: List.generate(photos.length, (index) {
                              return Card(
                                child: Image.network(photos[index],
                                    fit: BoxFit.cover),
                              );
                            }),
                          )),
                        ),
                        // photos tab
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: GridView.count(
                            crossAxisCount: 1,
                            children: List.generate(photos.length, (index) {
                              return Card(
                                child: Image.network(photos[index],
                                    fit: BoxFit.fill),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
