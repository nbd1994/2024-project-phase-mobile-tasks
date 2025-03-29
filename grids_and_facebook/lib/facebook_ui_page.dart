import 'package:flutter/material.dart';

class FacebookUIPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            'facebook',
            style: const TextStyle(
              color: Color(0xFF1977F3), // Facebook blue color
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
        leadingWidth: 100,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home_filled, color: Colors.blue.shade900),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.groups_outlined, color: Colors.grey.shade700),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person_outline, color: Colors.grey.shade700),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.video_library_outlined, color: Colors.grey.shade700),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications_none_outlined, color: Colors.grey.shade700),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu_outlined, color: Colors.grey.shade700),
            onPressed: () {},
          ),
          const Spacer(), // Pushes icons to the right
          IconButton(
            icon: Icon(Icons.messenger_outline, color: Colors.blue.shade900),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search_outlined, color: Colors.grey.shade700),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "What's on your mind, Sanjay?",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Placeholder image
                  ),
                ),
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // Story Section
          Container(
            height: 180,
            color: Colors.grey.shade100,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6, // Example story count
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      index == 0
                          ? Stack(
                              alignment: Alignment.center, // Center the stack elements
                              children: <Widget>[
                                // Rounded rectangle container for the image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0), // Rounded corners
                                  child: Container(
                                    width: 100, // Match parent container width
                                    height: 150, // Adjust height as needed
                                    color: Colors.grey.shade300, // Placeholder background
                                    child: Image.network(
                                      'https://via.placeholder.com/100x150/000000/FFFFFF/?text=Profile', // Replace with actual profile image URL
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                // Positioned Add button
                                Positioned(
                                  bottom: 10, // Adjust position from bottom
                                  child: Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: Colors.white, // White border around the blue circle
                                      shape: BoxShape.circle,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(5), // Make the blue circle slightly larger
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(Icons.add, color: Colors.white, size: 20), // Make icon slightly larger
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Stack( // Use Stack for other stories too for consistency if needed
                              alignment: Alignment.bottomLeft, // Align profile pic to bottom left
                              children: [
                                // Story Image Container
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Container(
                                    width: 100,
                                    height: 150,
                                    child: Image.network(
                                      'https://via.placeholder.com/100x150', // Replace with actual story image URLs
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                // Profile Picture Overlay
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.blue.shade600,
                                        width: 3,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      radius: 18, // Smaller radius for overlay
                                      backgroundImage: NetworkImage('https://via.placeholder.com/50'), // Replace with actual profile pic URLs
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      // Text below the story item (adjust vertical spacing if needed)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0), // Add padding above text
                        child: Text(
                          index == 0 ? 'Create Story' : 'Username', // Placeholder username
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500), // Slightly bolder text
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Reels, Room, Group, Live Buttons
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.play_circle_outline, color: Colors.orange),
                    label: Text('Reels', style: TextStyle(color: Colors.black87)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200, // Light grey background
                      foregroundColor: Colors.grey.shade800,
                      elevation: 0, // No shadow
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.video_call_outlined, color: Colors.green),
                    label: Text('Room', style: TextStyle(color: Colors.black87)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200, // Light grey background
                      foregroundColor: Colors.grey.shade800,
                      elevation: 0, // No shadow
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.group_outlined, color: Colors.purple),
                    label: Text('Group', style: TextStyle(color: Colors.black87)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200, // Light grey background
                      foregroundColor: Colors.grey.shade800,
                      elevation: 0, // No shadow
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.live_tv_outlined, color: Colors.red),
                    label: Text('Live', style: TextStyle(color: Colors.black87)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200, // Light grey background
                      foregroundColor: Colors.grey.shade800,
                      elevation: 0, // No shadow
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(height: 1, color: Colors.grey.shade300),
          // Post Feed
          Expanded(
            child: ListView.separated(
              itemCount: 3, // Example post count
              separatorBuilder: (context, index) => Divider(height: 10, color: Colors.transparent),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  margin: EdgeInsets.only(bottom: 10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Post Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Replace with actual profile image URLs
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                      children: <TextSpan>[
                                        TextSpan(text: 'Deven mestry '),
                                        TextSpan(
                                            text: 'is with ',
                                            style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey.shade800)),
                                        TextSpan(text: 'Mahesh Joshi', style: TextStyle(fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text('1h ', style: TextStyle(fontSize: 12, color: Colors.grey.shade800)),
                                      Icon(Icons.public, size: 12, color: Colors.grey.shade800),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.more_horiz, color: Colors.grey.shade700),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      // Post Content
                      Text(
                        'Old is Gold..!! ❤️🤩',
                        style: TextStyle(color: Colors.black87),
                      ),
                      SizedBox(height: 10),
                      Image.network('https://via.placeholder.com/400x300', fit: BoxFit.cover), // Replace with actual post image URLs
                      SizedBox(height: 10),
                      Divider(height: 1, color: Colors.grey.shade300),
                      // Post Actions
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.thumb_up_outlined, color: Color(0xFF757575)), // Colors.grey.shade700
                                SizedBox(width: 5),
                                Text('Like', style: TextStyle(color: Color(0xFF757575))), // Colors.grey.shade700
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(Icons.mode_comment_outlined, color: Color(0xFF757575)), // Colors.grey.shade700
                                SizedBox(width: 5),
                                Text('Comment', style: TextStyle(color: Color(0xFF757575))), // Colors.grey.shade700
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(Icons.share_outlined, color: Color(0xFF757575)), // Colors.grey.shade700
                                SizedBox(width: 5),
                                Text('Share', style: TextStyle(color: Color(0xFF757575))), // Colors.grey.shade700
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled, color: Color(0xFF1976D2)), label: ''), // Colors.blue.shade900
          BottomNavigationBarItem(icon: Icon(Icons.groups_outlined, color: Color(0xFF757575)), label: ''), // Colors.grey.shade700
          BottomNavigationBarItem(icon: Icon(Icons.play_circle_outline, color: Color(0xFF757575)), label: ''), // Colors.grey.shade700
          BottomNavigationBarItem(icon: Icon(Icons.person_outline, color: Color(0xFF757575)), label: ''), // Colors.grey.shade700
          BottomNavigationBarItem(icon: Icon(Icons.menu_outlined, color: Color(0xFF757575)), label: ''), // Colors.grey.shade700
        ],
      ),
    );
  }
}