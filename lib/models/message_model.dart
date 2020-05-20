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
  final User emil = User(
    id: 1,
    name: 'Emil',
    imageUrl: 'assets/handshake.png',
  );
  final User lukas = User(
    id: 2,
    name: 'Lukas',
    imageUrl: 'assets/handshake.png',
  );
  final User sara = User(
    id: 3,
    name: 'Sara',
    imageUrl: 'assets/handshake.png',
  );
  final User simon = User(
    id: 4,
    name: 'Simon',
    imageUrl: 'assets/handshake.png',
  );
  final User jon = User(
    id: 5,
    name: 'Jon',
    imageUrl: 'assets/handshake.png',
  );
  final User amila = User(
    id: 6,
    name: 'Amila',
    imageUrl: 'assets/handshake.png',
  );
  final User linda = User(
    id: 7,
    name: 'Linda',
    imageUrl: 'assets/handshake.png',
  );

  //Favorite contacts
  List<User> favorites = [emil, amila, jon, linda, simon];
// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: simon,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: linda,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: lukas,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: jon,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: amila,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: emil,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
];



// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [   
  Message(
    sender: emil,
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
    sender: emil,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: emil,
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
    sender: emil,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];