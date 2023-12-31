import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kl71/const/const.dart';
import 'package:kl71/screens/bottom%20pages/emergency%20page/view/emergency_page.dart';
import 'package:kl71/screens/bottom%20pages/nearme%20page/view/nearme_page.dart';
import 'package:kl71/screens/bottom%20pages/review%20page/view/review_page.dart';
import 'package:kl71/screens/bottom%20pages/where%20to%20stay%20page/view/wheretostay_page.dart';
import 'package:kl71/screens/destination/view/destination_page.dart';
import 'package:kl71/screens/home/view/widgets/drawer_head.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentCarousel1Index = 0;
  int _currentCarousel2Index = 0;
  final CarouselController _carousel1Controller = CarouselController();
  final CarouselController _carousel2Controller = CarouselController();

  // List of image URLs for the carousel sliders
  final List<String> carousal1 = [
    "https://www.keralatourism.org/images/eco-tourism/destinations/Nilambur%20Nedumkayam_10082018135621.jpg",
    "https://miro.medium.com/v2/resize:fit:1400/0*0GdxjwlNanmuHiKD.jpg",
    "https://peopleplaces.in/wp-content/uploads/2023/05/Kakkadampoyil-An-Ideal-Weekend-Getaway-In-Kozhikode.jpg",
    "https://i.ytimg.com/vi/0LS0F7flGGc/maxresdefault.jpg",
    "https://i.ytimg.com/vi/KKU3gg0XDKg/maxresdefault.jpg",
  ];
  final List<String> carousal2 = [
    "https://i.ytimg.com/vi/nHSqbTt5_cw/maxresdefault.jpg",
    "https://i.ytimg.com/vi/bQZAM_WlWX8/maxresdefault.jpg",
    "https://indusscrolls.com/wp-content/uploads/2023/05/nanjangud-nilambur-rail.jpg",
    "https://i.ytimg.com/vi/FFeWzLSslDQ/maxresdefault.jpg",
    "https://i.ytimg.com/vi/4shCHxDWT7U/maxresdefault.jpg",
  ];
  final List<Widget> _pages = <Widget>[
    NearMePage(),
    WhereToStayPage(),
    ReviewPage(),
    const EmergencyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        title: const Text('KL71'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          const Icon(Icons.notification_add),
          const SizedBox(width: 10),
        ],
      ),
      drawer: const drawerHead(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: carousal1.map((url) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(url),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 220.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentCarousel1Index = index;
                  });
                },
              ),
              carouselController: _carousel1Controller,
            ),

            // Dot indicator for the first carousel
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                carousal1.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: index == _currentCarousel1Index ? 12.0 : 8.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == _currentCarousel1Index
                        ? kGreenColor
                        : Colors.grey.shade400,
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Top destinations',
                style: TextStyle(fontSize: 20),
              ),
            ),

            CarouselSlider(
              items: carousal2.map((url) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(url),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 220.0,
                enlargeCenterPage: true,
                autoPlay:
                    false, // Set this to false to stop autoplay for the second carousel
                aspectRatio: 16 / 9,
                enableInfiniteScroll: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentCarousel2Index = index;
                  });
                },
              ),
              carouselController: _carousel2Controller,
            ),

            // Dot indicator for the second carousel
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    carousal2.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      width: index == _currentCarousel2Index ? 12.0 : 8.0,
                      height: 10.0,
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == _currentCarousel2Index
                            ? kGreenColor
                            : Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DestinationDetailPage()),
                            );
                          },
                          child: const Text(
                            'View all',
                            style: TextStyle(color: kGreenColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Experiences',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            CarouselSlider(
              items: carousal2.map((url) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(url),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 220.0,
                enlargeCenterPage: true,
                autoPlay:
                    false, // Set this to false to stop autoplay for the second carousel
                aspectRatio: 16 / 9,
                enableInfiniteScroll: true,
                viewportFraction: .75,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentCarousel2Index = index;
                  });
                },
              ),
              carouselController: _carousel2Controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'View all',
                    style: TextStyle(color: kGreenColor),
                  ),
                ),
              ],
            ),

            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Things to do',
                style: TextStyle(fontSize: 20),
              ),
            ),
            CarouselSlider(
              items: carousal2.map((url) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(url),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 220.0,
                enlargeCenterPage: true,
                autoPlay:
                    false, // Set this to false to stop autoplay for the second carousel
                aspectRatio: 16 / 9,
                enableInfiniteScroll: true,
                viewportFraction: .70,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentCarousel2Index = index;
                  });
                },
              ),
              carouselController: _carousel2Controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'View all',
                    style: TextStyle(color: kGreenColor),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Events',
                style: TextStyle(fontSize: 20),
              ),
            ),
            CarouselSlider(
              items: carousal2.map((url) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(url),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 220.0,
                enlargeCenterPage: true,
                autoPlay:
                    false, // Set this to false to stop autoplay for the second carousel
                aspectRatio: 16 / 9,
                enableInfiniteScroll: true,
                viewportFraction: .70,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentCarousel2Index = index;
                  });
                },
              ),
              carouselController: _carousel2Controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'View all',
                    style: TextStyle(color: kGreenColor),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Photo gallery',
                style: TextStyle(fontSize: 20),
              ),
            ),
            CarouselSlider(
              items: carousal2.map((url) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(url),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 220.0,
                enlargeCenterPage: true,
                autoPlay:
                    false, // Set this to false to stop autoplay for the second carousel
                aspectRatio: 16 / 9,
                enableInfiniteScroll: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentCarousel2Index = index;
                  });
                },
              ),
              carouselController: _carousel2Controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'View all',
                    style: TextStyle(color: kGreenColor),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Videos',
                style: TextStyle(fontSize: 20),
              ),
            ),
            CarouselSlider(
              items: carousal2.map((url) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(url),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 220.0,
                enlargeCenterPage: true,
                autoPlay:
                    false, // Set this to false to stop autoplay for the second carousel
                aspectRatio: 16 / 9,
                enableInfiniteScroll: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentCarousel2Index = index;
                  });
                },
              ),
              carouselController: _carousel2Controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'View all',
                    style: TextStyle(color: kGreenColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: bottomBarColor,
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NearMePage()),
                );
              },
              child: const Text(
                'Near me',
                style: TextStyle(color: kBlackColor),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WhereToStayPage()),
                );
              },
              child: const Text(
                'Where to stay',
                style: TextStyle(color: kBlackColor),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReviewPage()),
                );
              },
              child: const Text(
                'Review',
                style: TextStyle(color: kBlackColor),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EmergencyPage()),
                );
              },
              child: const Text(
                'Emergency',
                style: TextStyle(color: kBlackColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {});

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => _pages[index]));
  }
}
