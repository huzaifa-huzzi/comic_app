import 'package:comic_reading_app/View_model/Controllers/DetailMovieScreenController.dart';
import 'package:comic_reading_app/resources/Color/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailComicScreen extends StatelessWidget {
  final String imageUrl, title, author, description, url;
  final DetailMovieController controller = Get.put(DetailMovieController());

  DetailComicScreen({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.description,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Image Header
          Stack(
            children: [
              Container(
                height: height * 0.55,
                width: width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Positioned(
                top: 40,
                right: 20,
                child: IconButton(
                  icon: const Icon(Icons.more_vert, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ],
          ),

          // Details Section
          Expanded(
            child: Container(
              width: double.infinity,
              decoration:  BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => controller.openUrl(url),
                          child: Text(
                            url.length > 30 ? "${url.substring(0, 30)}..." : url,
                            style: const TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.copy, color: Colors.white),
                          onPressed: () => controller.copyToClipboard(url),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.01),

                    // Title and Author
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      author,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: height * 0.02 ),

                    // Description
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          description,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle favorite button press
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 15,
                          ),
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.grey, // Set to any color you prefer, e.g., grey
                          size: 30, // Set the size of the heart icon
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
