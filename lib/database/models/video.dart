
import 'package:tiktok/database/models/user.dart';

class Video{
  final String userName;
  final String uid;
  final String id;
  final String videoUrl;
  final User postedBy;
  final String Caption;
  final String audioName;
  final String likes;
  final String comments;

  Video(this.videoUrl, this.postedBy, this.Caption, this.audioName, this.likes,
      this.comments, this.userName, this.uid, this.id);
}