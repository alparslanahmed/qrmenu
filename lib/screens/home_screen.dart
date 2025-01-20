// lib/screens/home_screen.dart
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import '../models/category.dart';
import '../providers/main.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Uint8List _image = Uint8List(0);

  @override
  void initState() {
    super.initState();
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    mainProvider.fetchCategories();
    mainProvider.getBusiness().then((business) {
      mainProvider.getImage(business?.logoUrl ?? '').then((image) {
        setState(() {
          _image = image;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: mainProvider.categories.isEmpty
            ? Text("Loading...")
            : SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHeader(context),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: mainProvider.categories.length,
                      itemBuilder: (context, index) {
                        final category = mainProvider.categories[index];
                        return InkWell(
                          onTap: () {},
                          child: _buildCategoryCard(
                            context,
                            dotenv.env['API_URL']! + category.imageUrl,
                            category.name,
                            category,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.memory(_image, height: 60),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String imagePath,
    String title,
    Category category,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(category: category),
          ),
        );
      },
      child: Card(
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Image.network(
              imagePath,
              height: 200,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
