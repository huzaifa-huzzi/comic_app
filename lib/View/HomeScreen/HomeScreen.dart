import 'package:comic_reading_app/Models/Characters_comic_Model.dart';
import 'package:comic_reading_app/Models/Movies_Model.dart';
import 'package:comic_reading_app/View_model/comic_view_Model.dart';
import 'package:comic_reading_app/resources/Color/Colors.dart';
import 'package:comic_reading_app/resources/Components/SectionHeading.dart';
import 'package:flutter/material.dart';

import '../../Models/Trending_Comic_Model.dart';

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

              /// Trendings Designs (Done)
              SizedBox(height: height * 0.03),
              const SectionHeading(title: 'Trending Movies'),
              SizedBox(height: height * 0.03),
              SizedBox(
                height: height * 0.25,
                width: width * 0.9,
                child: FutureBuilder<Movies_Model>(
                  future: ComicViewModel().fetchMoviesApi(), // Your method for fetching data
                  builder: (BuildContext context,snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:snapshot.data!.total,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Container(
                                height: height * 0.25,
                                width: width * 0.5,
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(snapshot.data!.data![index].coverUrl.toString()),  // Fetch the image using the URL
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
                                          Text(
                                      snapshot.data!.data![index].title.toString(),
                                            style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: height * 0.01),
                                          Text(
                                            snapshot.data!.data![index].directedBy.toString() ,  // Display author info
                                            style: const TextStyle(
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
                      );
                    } else {
                      return const Center(child: Text('No data available'));
                    }
                  },
                ),
              ),


              /// Recommended Comics
              SizedBox(height: height * 0.03),
              const SectionHeading(title: 'Recommended Comics'),
              SizedBox(height: height * 0.03),
              SizedBox(
                height: height * 0.25,
                width: width * 0.9,
                child: FutureBuilder<TrendingApiModel>(
                    future: ComicViewModel().fetchTrendingComicApi(),
                    builder: (BuildContext context,snapshot){
                       if(snapshot.connectionState == ConnectionState.waiting){
                         return Center(child: CircularProgressIndicator(color: AppColors.primary,),);
                       } else if(snapshot.hasError){
                         return Center(child: Text('Error: ${snapshot.error}'));
                       } else if(snapshot.hasData) {
                         return  ListView.builder(
                           scrollDirection: Axis.horizontal,
                           itemCount:snapshot.data!.data!.total,
                           itemBuilder: (context, index) {
                             return Stack(
                               children: [
                                 Container(
                                   height: height * 0.25,
                                   width: width * 0.5,
                                   margin: const EdgeInsets.symmetric(horizontal: 10),
                                   decoration: BoxDecoration(
                                     color: Colors.blue,
                                     image:  DecorationImage(
                                       image: AssetImage(snapshot.data!.data!.results![index].thumbnail.toString()),
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
                                              Text(
                                               snapshot.data!.data!.results![index].title.toString(),
                                               style: const  TextStyle(
                                                 fontSize: 22,
                                                 fontWeight: FontWeight.bold,
                                                 color: Colors.white,
                                               ),
                                             ),
                                             SizedBox(height: height * 0.01),
                                              Text(
                                               snapshot.data!.data!.results![index].description.toString(),
                                               style:const  TextStyle(
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
                         );

                       }  else {
                         return const Center(child: Text('No data available'));
                       }
                    }
                ),
              ),


              /// Top Characters
              SizedBox(height: height * 0.03),
              const SectionHeading(title: 'Top Characters'),
              SizedBox(height: height * 0.03),
              SizedBox(
                height: height * 0.25,
                width: width * 0.9,
                child: FutureBuilder<CharactersComicModel>(
                    future:ComicViewModel().fetchCharacterApi() ,
                    builder: (BuildContext context,snapshot){
                       if(snapshot.connectionState == ConnectionState.waiting){
                         return Center(child: CircularProgressIndicator(color: AppColors.primary,),);
                       } else if(snapshot.hasError){
                         return Center(child: Text('Error: ${snapshot.error}'));
                       } else if(snapshot.hasData){
                         return ListView.builder(
                           scrollDirection: Axis.horizontal,
                           itemCount:snapshot.data!.data!.total,
                           itemBuilder: (context, index) {
                             return Stack(
                               children: [
                                 Container(
                                   height: height * 0.25,
                                   width: width * 0.5,
                                   margin: const EdgeInsets.symmetric(horizontal: 10),
                                   decoration: BoxDecoration(
                                     color: Colors.blue,
                                     image:  DecorationImage(
                                       image: AssetImage(snapshot.data!.data!.results![index].comics.toString()),
                                       fit: BoxFit.cover,
                                     ),
                                     borderRadius: BorderRadius.circular(15),
                                   ),
                                   child:  Column(
                                     mainAxisAlignment: MainAxisAlignment.end,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Padding(
                                         padding: EdgeInsets.all(10.0),
                                         child: Text(
                                           snapshot.data!.data!.results![index].name.toString(),
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
                         );
                    } else {
                         return const Center(child: Text('No data available'));
                       }
                    }
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}





