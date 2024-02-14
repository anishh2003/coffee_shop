import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      body: SingleChildScrollView(
        controller: _scrollController,
        key: UniqueKey(),
        child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'lib/assets/logo.png',
                    scale: 2,
                  ),
                ),
                Text('Welcome to Our Coffee Journey',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 10),
                const Text(
                  "At Coffee House, we believe that every cup tells a story. Our journey began with a passion for bringing people together over a steaming cup of freshly brewed coffee. As coffee enthusiasts, we embarked on a mission to share our love for this aromatic elixir with the world.",
                ),
                const SizedBox(height: 20),
                Text(
                  'Our Roots',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Our story starts in the lush coffee plantations of South America, where we were captivated by the sights, sounds, and scents of coffee cultivation. Inspired by the dedication of local farmers and the richness of the coffee-growing tradition, we set out to create a brand that honors the craftsmanship and artistry behind every bean.",
                ),
                const SizedBox(height: 20),
                Text(
                  'Craftsmanship and Quality',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 10),
                const Text(
                  "At Coffee House, we are committed to sourcing the finest coffee beans from around the globe. From the sun-kissed hills of Ethiopia to the misty mountains of Colombia, each bean is carefully selected for its quality, flavor profile, and sustainability practices. We believe in supporting farmers who share our values and are dedicated to preserving the environment for future generations.",
                ),
                const SizedBox(height: 20),
                Text(
                  'A Journey of Exploration',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Our coffee journey is a never-ending quest for perfection. We continuously explore new brewing techniques, flavor combinations, and roasting methods to elevate your coffee experience. Whether you prefer a velvety espresso, a frothy cappuccino, or a bold pour-over, we have something to tantalize your taste buds and awaken your senses.",
                ),
                const SizedBox(height: 20),
                Text(
                  'Our Promise',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 10),
                const Text(
                  "As a family-owned business, we take pride in every cup we serve. Our promise to you is simple: to provide the highest quality coffee products, exceptional customer service, and a warm, welcoming atmosphere that feels like home. Thank you for being part of our coffee family—we couldn't do it without you.\n\nSo come on in, take a seat, and let's raise a cup to the joy of coffee and the moments that matter most.",
                ),
              ],
            )),
      ),
    );
  }
}
