import 'package:biydaalt/login.dart';
import 'package:biydaalt/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:biydaalt/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Map<String, String>> _jobAds = []; // List to store job ads

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigate to the respective screens based on index
    if (index == 0) {
      // Navigate to home screen
    } else if (index == 1) {
      // Navigate to notification screen
      Get.to(NotificationScreens());
    } else if (index == 2) {
      // Navigate to settings screen
      Get.to(SettingsScreens());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Сайн уу'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              // Navigate to the login screen when the exit button is pressed
              Get.offAll(Login());
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Ямар ажил сонирхож байна',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20), // Add some space between the text and buttons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 20), // Add initial space
                ElevatedButton(
                  onPressed: () {
                    Get.to(JobAdsScreen(
                        title: 'Сүүлд нэмэгдсэн Developer ажилууд'));
                  },
                  child: Text('Developer'),
                ),
                SizedBox(width: 20), // Add space between buttons
                ElevatedButton(
                  onPressed: () {
                    Get.to(
                        JobAdsScreen(title: 'Сүүлд нэмэгдсэн Design ажилууд'));
                  },
                  child: Text('Design'),
                ),
                SizedBox(width: 20), // Add space between buttons
                ElevatedButton(
                  onPressed: () {
                    Get.to(JobAdsScreen(title: 'Сүүлд нэмэгдсэн PHP ажилууд'));
                  },
                  child: Text('PHP'),
                ),
                SizedBox(width: 20), // Add space between buttons
                ElevatedButton(
                  onPressed: () {
                    Get.to(JobAdsScreen(
                        title: 'Сүүлд нэмэгдсэн web хөгжүүлэх ажилууд'));
                  },
                  child: Text('Web хөгжүүлэгч'),
                ),
              ],
            ),
          ),
          SizedBox(height: 10), // Add space between buttons and images
          // Image Carousel
          ImageCarousel(),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  // Navigate to post screen when "Post an ad" button is tapped
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PostScreen()))
                      .then((value) {
                    if (value != null && value is Map<String, String>) {
                      setState(() {
                        _jobAds.add(value);
                      });
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFF7165D6),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add,
                          color: Color(0xFF7165D6),
                          size: 35,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Зар оруулах",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFFF0EEFA),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.home_filled,
                          color: Color(0xFF7165D6),
                          size: 35,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Таны ажил",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Text(
            'Таны зар',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _jobAds.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_jobAds[index]['title'] ?? ''),
                  subtitle: Text(_jobAds[index]['details'] ?? ''),
                  trailing: Text(_jobAds[index]['salary'] ?? ''),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Нүүр',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Мэдэгдэл',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Тохиргоо',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final List<String> imageList = [
    'images/were.jpg',
    'images/web.jpg',
    'images/android.jpg',
    'images/developer.png',
    'images/hiring.jpg',
    // Add more image paths as needed
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle image tap if needed
            },
            child: Image.asset(
              imageList[index],
              fit: BoxFit.cover,
            ),
          );
        },
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class JobAdsScreen extends StatelessWidget {
  final String title;

  const JobAdsScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children:
            _buildJobAds(), // Using a helper method to build job ads based on the title
      ),
    );
  }

  List<Widget> _buildJobAds() {
    switch (title) {
      case 'Сүүлд нэмэгдсэн Developer ажилууд':
        return [
          JobAd(
            title: 'Web Developer',
            description:
                'Join our team as a Web Developer and work on exciting web projects.',
            imagePath: 'images/web.jpg',
            onPressed: () {
              // Add your logic for applying to the Web Developer job here
            },
          ),
          JobAd(
            title: 'IT Engineer',
            description:
                'We are hiring an IT Engineer to manage our company\'s IT infrastructure.',
            imagePath: 'images/web.jpg',
            onPressed: () {
              // Add your logic for applying to the IT Engineer job here
            },
          ),
          // Add more job ads for the "Developer" category as needed
        ];
      case 'Сүүлд нэмэгдсэн Design ажилууд':
        return [
          JobAd(
            title: 'Graphic Designer - Make Logo',
            description:
                'We are looking for a skilled Graphic Designer to create logos for our clients.',
            imagePath: 'images/web.jpg',
            onPressed: () {
              // Add your logic for applying to the Graphic Designer job here
            },
          ),
          JobAd(
            title: 'Merchandise Designer',
            description:
                'Join our team as a Merchandise Designer and help create amazing designs for our products.',
            imagePath: 'images/web.jpg',
            onPressed: () {
              // Add your logic for applying to the Merchandise Designer job here
            },
          ),
          // Add more job ads for the "Design" category as needed
        ];
      case 'Сүүлд нэмэгдсэн PHP ажилууд':
        return [
          JobAd(
            title: 'PHP Developer',
            description:
                'We are seeking an experienced PHP Developer to join our development team.',
            imagePath: 'images/web.jpg',
            onPressed: () {
              // Add your logic for applying to the PHP Developer job here
            },
          ),
          JobAd(
            title: 'Junior PHP Developer',
            description:
                'Join our team as a Junior PHP Developer and grow your skills in PHP development.',
            imagePath: 'images/web.jpg',
            onPressed: () {
              // Add your logic for applying to the Junior PHP Developer job here
            },
          ),
          // Add more job ads for the "PHP" category as needed
        ];
      case 'Сүүлд нэмэгдсэн web хөгжүүлэх ажилууд':
        return [
          JobAd(
            title: 'Front-end Developer',
            description:
                'We are looking for a Front-end Developer to build user interfaces for our web applications.',
            imagePath: 'images/web.jpg',
            onPressed: () {
              // Add your logic for applying to the Front-end Developer job here
            },
          ),
          JobAd(
            title: 'Full-stack Developer',
            description:
                'Join our team as a Full-stack Developer and work on both front-end and back-end development.',
            imagePath: 'images/web.jpg',
            onPressed: () {
              // Add your logic for applying to the Full-stack Developer job here
            },
          ),
          // Add more job ads for the "Web Developer" category as needed
        ];
      // Add more cases for other categories if necessary
      default:
        return [];
    }
  }
}

class JobAd extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath; // Path to the image asset
  final VoidCallback onPressed; // Callback for the apply button

  const JobAd({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath, // Receive the image path as a parameter
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          ListTile(
            title: Text(title),
            subtitle: Text(description),
          ),
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity, // Make the image fill the width of the card
            height: 150, // Set a fixed height for the image
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Call the onPressed callback
                onPressed();

                // Show a snackbar indicating successful application
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Хүсэлт амжилттай илгээлээ'),
                  ),
                );
              },
              child: Text('Хүсэлт илгээх'), // Text for the apply button
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Screen'),
      ),
      body: Center(
        child: Text('Notification Screen'),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Screen'),
      ),
      body: Center(
        child: Text('Settings Screen'),
      ),
    );
  }
}

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ажлын зараа оруулна уу'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ажлын нэр',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Ажлын нэрээ оруулна уу',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'дэлгэрэнгүй мэдээлэл',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _detailsController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Дэлгэрэнгүй мэдээлэл оруулна уу',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Ажлын хөлс',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _salaryController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Ажлын хөлөө оруулна уу',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your logic to post the job here
                String title = _titleController.text;
                String details = _detailsController.text;
                String salary = _salaryController.text;

                // Pass job details back to the home screen
                Navigator.pop(context, {
                  'title': title,
                  'details': details,
                  'salary': salary,
                });
              },
              child: Text('Нийтлэх'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _titleController.dispose();
    _detailsController.dispose();
    _salaryController.dispose();
    super.dispose();
  }
}
