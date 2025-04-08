import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ImageGridScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ImageGridScreen extends StatelessWidget {
  const ImageGridScreen({super.key});

  final List<String> imageUrls = const [
    "https://posterjack.ca/cdn/shop/articles/Tips_for_Taking_Photos_at_the_Beach_55dd7d25-11df-4acf-844f-a5b4ebeff4df.jpg?v=1738158629&width=900",
    "https://picsum.photos/200/300",
    "https://imgv3.fotor.com/images/blog-cover-image/a-shadow-of-a-boy-carrying-the-camera-with-red-sky-behind.jpg",
    "https://picsum.photos/id/237/200/300",
    "https://images.pexels.com/photos/1264210/pexels-photo-1264210.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://picsum.photos/id/1/200/300",
    "https://images.unsplash.com/photo-1566275529824-cca6d008f3da?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGhvdG98ZW58MHx8MHx8fDA%3D",
    "https://picsum.photos/id/1001/200/300",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView Image Gallery"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: imageUrls.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1, // makes images more square
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300],
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                imageUrls[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
