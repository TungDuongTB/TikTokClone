import 'package:tiktok/database/models/video.dart';
import 'user.dart';
User curentUser = User('stackedlist', 'https://picsum.photos/id/1062/400/400',"duong@gmail.com","0123456789","123456","nam","18","12345");

User demoUser1 = User("duong@gmail.com",'Dương','https://picsum.photos/id/1062/400/400',"0123456789","123456","nam","18","12345");
User demoUser2 = User("duong@gmail.com",'Doraemon',
    'https://kenh14cdn.com/thumb_w/660/203336854389633024/2021/6/27/base64-1624787647071660114429.png',"0123456789","123456","nam","18","12345");
final List<Video> videos = [
  Video('v1.mp4', demoUser1, 'Caption', 'audioName', '12k', '456','Duong','123','123'),
  Video('v2.mp4', demoUser2, 'Caption', 'audioName', '2k', '13','Duong','123','123'),
  Video('v3.mp4', demoUser1, 'Caption', 'audioName', '22k', '130','Duong','123','123'),
  Video('v4.mp4', demoUser2, 'Caption', 'audioName', '12k', '456','Duong','123','123'),
];