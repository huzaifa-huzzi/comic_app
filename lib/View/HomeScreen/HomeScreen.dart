import 'package:comic_reading_app/resources/Components/SectionHeading.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/Images/your_image.png'),
            ),
            SizedBox(width: width * 0.03),
            const Text('Hey, Huzaifa!'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.03),

              /// Trendings Designs
              SizedBox(height: height * 0.03),
              const SectionHeading(title: 'Trending'),
              SizedBox(height: height * 0.03),
              SizedBox(
                height: height * 0.25,
                width: width * 0.9,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          height: height * 0.25,
                          width: width * 0.5,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            image: const DecorationImage(
                              image: AssetImage('assets/images/your_image.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'The Watchman',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: height * 0.01),
                                    const Text(
                                      'Alan Moore',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: IconButton(
                            icon: const Icon(Icons.favorite_border, color: Colors.white),
                            onPressed: () {
                              // Handle favorite button tap here
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              /// Recommended Designs
              SizedBox(height: height * 0.03),
              const SectionHeading(title: 'Recommended'),
              SizedBox(height: height * 0.03),
              SizedBox(
                height: height * 0.25,
                width: width * 0.9,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          height: height * 0.25,
                          width: width * 0.5,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            image: const DecorationImage(
                              image: AssetImage('assets/images/your_image.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'The Watchman',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: height * 0.01),
                                    const Text(
                                      'Alan Moore',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: IconButton(
                            icon: const Icon(Icons.favorite_border, color: Colors.white),
                            onPressed: () {
                              // Handle favorite button tap here
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              /// Top Authors
              SizedBox(height: height * 0.03),
              const SectionHeading(title: 'Top Authors'),
              SizedBox(height: height * 0.03),
              SizedBox(
                height: height * 0.25,
                width: width * 0.9,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          height: height * 0.25,
                          width: width * 0.5,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            image: const DecorationImage(
                              image: AssetImage('assets/images/your_image.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Alan Moore',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: IconButton(
                            icon: const Icon(Icons.favorite_border, color: Colors.white),
                            onPressed: () {
                              // Handle favorite button tap here
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
