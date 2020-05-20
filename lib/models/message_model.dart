import 'package:pvt_project/models/user_model.dart';

class Message {
  final User sender;
  final String
       time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.text,
    this.isLiked,
    this.time,
    this.unread

  });
}   

  //Current User - you!
  final User currentUser = User(
    id: 0,
    name: 'Current User',
    imageUrl: 'assets/handshake.png',
  );

  //Users
  final User elie = User(
    id: 1,
    name: 'Elie',
    imageUrl: 'assets/handshake.png',
  );
  final User mathias = User(
    id: 2,
    name: 'Mathias',
    imageUrl: 'assets/handshake.png',
  );
  final User sara = User(
    id: 3,
    name: 'Sara',
    imageUrl: 'assets/handshake.png',
  );
  final User adam = User(
    id: 4,
    name: 'Adam',
    imageUrl: 'assets/handshake.png',
  );
  final User caroline = User(
    id: 5,
    name: 'Caroline',
    imageUrl: 'assets/handshake.png',
  );
  final User alex = User(
    id: 6,
    name: 'Alex',
    imageUrl: 'assets/handshake.png',
  );
  final User breanna = User(
    id: 7,
    name: 'Breanna',
    imageUrl: 'assets/handshake.png',
  );

  //Favorite contacts
  List<User> favorites = [elie, alex, caroline, breanna, adam];
// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: adam,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: breanna,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: mathias,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: caroline,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: alex,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: elie,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
];



// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [   
  Message(
    sender: elie,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: elie,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: elie,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: elie,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];