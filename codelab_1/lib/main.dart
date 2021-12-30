import 'package:flutter/material.dart';

final Color mainColor = Color(0xFFFF5656);

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MountsApp(),
  ));
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // simulates a delay
    Future.delayed(const Duration(seconds: 2), () {
      // navigates to the home page
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MountsApp()));
    });
    return Container(
      color: mainColor,
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Icon(Icons.terrain, color: Colors.white, size: 90),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 80),
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MountsApp extends StatelessWidget {
  const MountsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        // title: Icon(
        //   Icons.terrain,
        //   size: 40,
        // ),
        // centerTitle: true,
        title: Center(
          child: Icon(
            Icons.terrain,
            color: mainColor,
            size: 40,
          ),
        ),
        actions: [SizedBox(width: 40, height: 40)],
        iconTheme: IconThemeData(color: mainColor),
      ),
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.all(30),
          color: mainColor,
          alignment: Alignment.bottomLeft,
          child: const Icon(Icons.terrain, color: Colors.white, size: 80),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppHeader(),
          AppSearch(),
          Expanded(
            child: AppMountListView(),
          ),
          AppCategoryList(),
          AppBottomBar(),
        ],
      ),
    );
  }
}

//-----WIDGETS-----

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              'https://avatars.githubusercontent.com/u/5081804?v=4',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello, User',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Good morning',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class AppSearch extends StatelessWidget {
  const AppSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Discover',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Text('search', style: TextStyle(color: Colors.grey))
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                width: 50,
                height: 50,
                decoration: BoxDecoration(color: mainColor, borderRadius: BorderRadius.circular(10)),
                child: const Icon(Icons.tune, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}

class AppMountListView extends StatelessWidget {
  const AppMountListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mountItems.length,
        itemBuilder: (context, index) {
          MountModel currentMount = mountItems[index];

          return Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(currentMount.path),
                  fit: BoxFit.cover,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(currentMount.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                Text(currentMount.location,
                    style: const TextStyle(
                      color: Colors.white,
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}

class AppCategoryList extends StatelessWidget {
  const AppCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Category',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  'See More',
                  style: TextStyle(color: mainColor, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            margin: const EdgeInsets.only(left: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                CategoryModel currentCategory = categories[index];

                return Container(
                  width: 100,
                  margin: const EdgeInsets.only(top: 10, right: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.2), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(currentCategory.icon, color: mainColor),
                      Text(
                        currentCategory.category,
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({Key? key}) : super(key: key);

  @override
  _AppBottomBarState createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  List<AppBottomBarItem> barItems = [
    AppBottomBarItem(icon: Icons.home, label: 'Home', isSelected: true),
    AppBottomBarItem(icon: Icons.explore, label: 'Explore', isSelected: false),
    AppBottomBarItem(icon: Icons.turned_in_not, label: 'Tag', isSelected: false),
    AppBottomBarItem(icon: Icons.person_outline, label: 'Profile', isSelected: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: Offset.zero)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          barItems.length,
          (index) {
            AppBottomBarItem currentBarItem = barItems[index];
            Widget barItemWidget;
            if (currentBarItem.isSelected) {
              barItemWidget = Container(
                padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: mainColor,
                ),
                child: Row(
                  children: [
                    Icon(currentBarItem.icon, color: Colors.white),
                    SizedBox(width: 5),
                    Text(currentBarItem.label, style: TextStyle(color: Colors.white))
                  ],
                ),
              );
            } else {
              barItemWidget = IconButton(
                icon: Icon(currentBarItem.icon, color: Colors.grey),
                onPressed: () {
                  setState(() {
                    barItems.forEach((AppBottomBarItem item) {
                      item.isSelected = item == currentBarItem;
                    });
                  });
                },
              );
            }

            return barItemWidget;
          },
        ),
      ),
    );
  }
}

//-----MODELS-----

class MountModel {
  String path;
  String name;
  String location;
  String description;

  MountModel({
    this.path = '',
    this.name = '',
    this.location = '',
    this.description = '',
  });
}

final List<MountModel> mountItems = [
  MountModel(
      path:
          'https://sa.kapamilya.com/absnews/abscbnnews/media/2021/afp/01/17/20210116-mt-semeru-indonesia-ash-afp-s.jpg',
      name: 'Mount Semeru',
      description:
          'Semeru, or Mount Semeru, is an active volcano in East Java, Indonesia. It is located in the subduction zone, where the Indo-Australia plate subducts under the Eurasia plate. It is the highest mountain on the island of Java.',
      location: 'East Java'),
  MountModel(
      path: 'https://media-cdn.tripadvisor.com/media/photo-s/04/a5/6f/ce/dsc-5622jpg.jpg',
      name: 'Mount Merbaru',
      description:
          'Mount Merbabu is a dormant stratovolcano in Central Java province on the Indonesian island of Java. The name Merbabu could be loosely translated as Mountain of Ash from the Javanese combined words; Meru means mountain and awu or abu means ash.',
      location: 'Central Java'),
  MountModel(
      path: 'https://cdn.images.express.co.uk/img/dynamic/78/590x/mount-vesuvius-1100807.jpg',
      name: 'Mount Vesuvius',
      description:
          'Mount Vesuvius is a somma-stratovolcano located on the Gulf of Naples in Campania, Italy, about 9 km east of Naples and a short distance from the shore. It is one of several volcanoes which form the Campanian volcanic arc.',
      location: 'Italy'),
  MountModel(
      path: 'https://upload.wikimedia.org/wikipedia/commons/0/04/PopoAmeca2zoom.jpg',
      name: 'Mount Popocatépetl',
      description:
          'Popocatépetl is an active stratovolcano located in the states of Puebla, Morelos, and Mexico in central Mexico. It lies in the eastern half of the Trans-Mexican volcanic belt. At 5,426 m it is the second highest peak in Mexico, after Citlaltépetl at 5,636 m.',
      location: 'Mexico')
];

class CategoryModel {
  String category;
  IconData? icon;

  CategoryModel({this.category = '', this.icon});
}

final List<CategoryModel> categories = [
  CategoryModel(category: 'Mountain', icon: Icons.terrain),
  CategoryModel(category: 'Forest', icon: Icons.park),
  CategoryModel(category: 'Beach', icon: Icons.beach_access),
  CategoryModel(category: 'Hiking', icon: Icons.directions_walk)
];

class AppBottomBarItem {
  IconData? icon;
  bool isSelected;
  String label;

  AppBottomBarItem({
    this.icon,
    this.label = '',
    this.isSelected = false,
  });
}
