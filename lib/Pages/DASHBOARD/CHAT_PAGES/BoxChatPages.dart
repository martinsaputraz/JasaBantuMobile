import 'package:chatbox/chatbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/DashboardPages.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

class BoxChatPages extends StatelessWidget {
  final bool isOnline;
  final bool showCheckmark;
  final String name;

  const BoxChatPages(
      {required this.isOnline,
      required this.showCheckmark,
      required this.name,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Box Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BoxChatPagesHome(
        isOnline: isOnline,
        showCheckmark: showCheckmark,
        name: name,
      ),
    );
  }
}

class BoxChatPagesHome extends StatefulWidget {
  const BoxChatPagesHome({
    Key? key,
    required this.isOnline,
    required this.showCheckmark,
    required this.name,
  }) : super(key: key);
  final bool isOnline;
  final bool showCheckmark;
  final String name;

  @override
  State<BoxChatPagesHome> createState() => BoxChatPagesHomeState();
}

AssetsColor assetsColor = AssetsColor();

class BoxChatPagesHomeState extends State<BoxChatPagesHome> {
  String message = '';
  String formattedName = "";

  String formatName(String fullName) {
    List<String> names = fullName.split(' ');
    if (names.length >= 3) {
      String firstName =
          names.isNotEmpty ? names[0] : ''; // Ambil nama depan jika ada
      String middleInitial =
          names[1][0] + '.'; // Ambil inisial dari nama tengah
      String lastNameInitial =
          names[2][0] + '.'; // Ambil inisial dari nama belakang
      return '$firstName $middleInitial$lastNameInitial';
    } else {
      return fullName; // Kembalikan nama lengkap tanpa formatting
    }
  }

  @override
  void initState() {
    formattedName = formatName(widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55.0),
          child: Container(
            margin: EdgeInsets.only(right: 5),
            child: AppBar(
              backgroundColor: assetsColor.bgLightMode,
              automaticallyImplyLeading: false,
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                // Sesuaikan spasi sesuai kebutuhan Anda
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              DashboardPages(dataIndex: 3)),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),
              ),
              actions: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Padding for CircleAvatar and Name/Active Status
                      Padding(
                        padding: const EdgeInsets.only(left: 55, right: 10),
                        // Sesuaikan spasi dari ikon panah kembali di sini
                        child: Stack(
                          children: [
                            // CircleAvatar for Online Indicator
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.orange.shade800,
                            ),
                            // Column for Name and Active Status
                            Padding(
                              padding: const EdgeInsets.only(left: 50, top: 3),
                              // Sesuaikan spasi dari sisi kiri Stack
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Name
                                  Flexible(
                                    child: Row(
                                      children: [
                                        Text(
                                          formattedName + "\t",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),

                                        if (widget.showCheckmark == true)
                                          Icon(
                                            CupertinoIcons.checkmark_seal_fill,
                                            size: 15,
                                            color: Colors.green,
                                          ),

                                        // Spacer between text and active status
                                      ],
                                    ),
                                  ),

                                  // Active Status
                                  Row(
                                    children: [
                                      SizedBox(width: 2),
                                      Text(
                                        widget.isOnline
                                            ? 'Sedang Aktif'
                                            : 'Tidak Aktif',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: widget.isOnline
                                              ? Colors.green
                                              : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(left: 120),
                  child: IconButton(
                    onPressed: () {
                      // Add your action here
                    },
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.grey.shade200,
                child: ListView(
                  children: [
                    /*   ...List.generate(
                  20,
                  (index) => ChatBox(
                        message: "Message $index",
                        // Example message
                        recieved: index % 2 == 0,
                        // Example condition for received messages
                        chatBoxColor: Colors.greenAccent,
                        textColor: Colors.black,
                        time: "1:15",
                      )).toList(), // Generate 20 ChatBox widgets
              SizedBox(
                height: 30,
              )*/
                    ChatBox(
                      message: "Hi",
                      recieved: false,
                      chatBoxColor: assetsColor.primaryColor,
                      textColor: Colors.white70,
                      time: "1:15",
                    ),
                    ChatBox(
                      message:
                          "Now we can share images alsoNow we can share images alsoNow we can share images alsoNow we can share images also",
                      recieved: true,
                      chatBoxColor: Colors.white,
                      textColor: Colors.black87,
                      time: "1:15",
                    ),
                    ChatBox(
                      message: "Now we can share images also",
                      imageURL: "https://picsum.photos/250?image=9",
                      recieved: false,
                      chatBoxColor: Colors.greenAccent,
                      textColor: Colors.black,
                      time: "1:15",
                    ),
                    ChatBox(
                      message: "Yes Gifs are supported now",
                      imageURL:
                          "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif",
                      recieved: true,
                      chatBoxColor: Colors.greenAccent,
                      textColor: Colors.black,
                      time: "1:15",
                    ),
                    ChatBox(
                      message: "https://pub.dev/packages/chatbox",
                      recieved: false,
                      chatBoxColor: Colors.greenAccent,
                      textColor: Colors.black,
                      time: "1:15",
                    ),
                    ChatBox(
                      doculink:
                          "https://firebasestorage.googleapis.com/v0/b/whatsapp-4a91a.appspot.com/o/loading.gif?alt=media&token=268c0d30-f552-4fb0-800d-0cb5506e24c5",
                      recieved: true,
                      chatBoxColor: Colors.greenAccent,
                      textColor: Colors.black,
                      time: "1:15",
                      message: '',
                    ),
                    ChatBox(
                      doculink:
                          "http://www.africau.edu/images/default/sample.pdf",
                      recieved: false,
                      chatBoxColor: Colors.greenAccent,
                      textColor: Colors.black,
                      time: "1:15",
                      message: '',
                    ),
                    ChatBox(
                      doculink:
                          "http://www.africau.edu/images/default/sample.pdf",
                      recieved: false,
                      chatBoxColor: Colors.greenAccent,
                      textColor: Colors.black,
                      time: "1:15",
                      message: '',
                    ),
                    ChatBox(
                      doculink:
                          "http://www.africau.edu/images/default/sample.pdf",
                      recieved: false,
                      chatBoxColor: Colors.greenAccent,
                      textColor: Colors.black,
                      time: "1:15",
                      message: '',
                    ),
                    ChatBox(
                      doculink:
                          "http://www.africau.edu/images/default/sample.pdf",
                      recieved: false,
                      chatBoxColor: Colors.greenAccent,
                      textColor: Colors.black,
                      time: "1:15",
                      message: '',
                    ),
                    ChatBox(
                      doculink:
                          "http://www.africau.edu/images/default/sample.pdf",
                      recieved: false,
                      chatBoxColor: Colors.greenAccent,
                      textColor: Colors.black,
                      time: "1:15",
                      message: '',
                    ),
                    ChatBox(
                      doculink:
                          "http://www.africau.edu/images/default/sample.pdf",
                      recieved: false,
                      chatBoxColor: Colors.greenAccent,
                      textColor: Colors.black,
                      time: "1:15",
                      message: '',
                    ),
                    ChatBox(
                      doculink:
                          "http://www.africau.edu/images/default/sample.pdf",
                      recieved: false,
                      chatBoxColor: Colors.greenAccent,
                      textColor: Colors.black,
                      time: "1:15",
                      message: '',
                    ),
                    ChatBox(
                      doculink:
                          "http://www.africau.edu/images/default/sample.pdf",
                      recieved: false,
                      chatBoxColor: Colors.greenAccent,
                      textColor: Colors.black,
                      time: "1:15",
                      message: '',
                    ),
                    ChatBox(
                      doculink:
                          "http://www.africau.edu/images/default/sample.pdf",
                      recieved: false,
                      chatBoxColor: Colors.greenAccent,
                      textColor: Colors.black,
                      time: "1:15",
                      message: '',
                    ),
                    ChatBox(
                      doculink:
                          "http://www.africau.edu/images/default/sample.pdf",
                      recieved: false,
                      chatBoxColor: Colors.greenAccent,
                      textColor: Colors.black,
                      time: "1:15",
                      message: '',
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.add, color: Colors.grey),
                  // Set icon color to grey
                  onPressed: () {
                    // Add your action here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.photo, color: Colors.grey),
                  // Set icon color to grey
                  onPressed: () {
                    // Add your action here
                  },
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                    onChanged: (value) {
                      setState(() {
                        message = value;
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.emoji_emotions, color: Colors.grey),
                  // Set icon color to grey
                  onPressed: () {
                    // Add your action here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.grey),
                  // Set icon color to grey
                  onPressed: () {
                    // Send message action
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
