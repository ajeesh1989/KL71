import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'icon1.dart';
import 'icon2.dart';
import 'icon3.dart';
import 'icon4.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentCarousel1Index = 0;
  int _currentCarousel2Index = 0;
  final CarouselController _carousel1Controller = CarouselController();
  final CarouselController _carousel2Controller = CarouselController();
  int _selectedindex = 0;

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
    const HomePage(),
    Icon1Page(),
    Icon2Page(),
    Icon3Page(),
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
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green.shade600,
              ),
              child: const Center(
                  child: Text(
                'KL71',
                style: TextStyle(fontSize: 40),
              )),
            ),
            ListTile(
              title: const Text('Nilambur at a glance'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Destinations'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Travel desk'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Stay'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Photos'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Videos'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Social channels'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
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
                        ? Colors.green
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
                            ? Colors.green
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
                          onPressed: () {},
                          child: const Text(
                            'View all',
                            style: TextStyle(color: Colors.green),
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
                    style: TextStyle(color: Colors.green),
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
                    style: TextStyle(color: Colors.green),
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
                    style: TextStyle(color: Colors.green),
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
                    style: TextStyle(color: Colors.green),
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
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.green.shade700,
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Icon1Page()),
                );
              },
              child: const Text(
                'Near me',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Icon2Page()),
                );
              },
              child: const Text(
                'Where to stay',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Icon3Page()),
                );
              },
              child: const Text(
                'Review',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Icon4Page()),
                );
              },
              child: const Text(
                'Emergency',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });

    // Use Navigator to push the respective page when an icon is tapped
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => _pages[index]));
  }
}
