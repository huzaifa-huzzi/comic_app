import 'package:comic_reading_app/resources/Color/Colors.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailMovieScreen extends StatelessWidget {
  final String imageUrl, title, description, source, date;
  const DetailMovieScreen({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.source,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          // Image Section
          SizedBox(
            height: height * 0.5,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(40),
              ),
              child: Image(image: NetworkImage(imageUrl)),
            ),
          ),

          // Content Section
          Positioned(
            top: height * 0.4,
            child: Container(
              height: height * 0.6,
              width: width,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: height * 0.02),

                  // Source and Date Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        source,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),

                  // Description
                  Expanded(
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // Bottom Row: Like Button and Play Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Like Button
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              // Handle like button action
                            },
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "14.6K",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      // Play Button
                      ElevatedButton(
                        onPressed: () {
                          // Handle Play action
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        child: Text(
                          "Play",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
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
