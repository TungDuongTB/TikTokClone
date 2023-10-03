import 'package:flutter/material.dart';
import 'package:tiktok/Screen/home/pages/home/home_side_bar.dart';
import 'package:tiktok/Screen/home/video/video_detail.dart';
import 'package:tiktok/Screen/home/video/video_tile.dart';
import 'package:tiktok/database/models/mock.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}):super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isFllowingSelected = true;
  int _snappedPageIndex =0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: ()=>{
                setState((){
                  _isFllowingSelected = false;
                })
              },
              child: Text("Fllowing",
                style: Theme.of(context).textTheme.bodyText1!
                    .copyWith(fontSize:!_isFllowingSelected ? 18:14,
                    color:!_isFllowingSelected ? Colors.white: Colors.grey),),
            ),
            Text("   |   ",
              style: Theme.of(context).textTheme.bodyText1!
                  .copyWith(fontSize: 18,color: Colors.grey),
            ),
            GestureDetector(
              onTap: ()=>{
                setState((){
                  _isFllowingSelected = true;
                })
              },
              child: Text("For you",
                style: Theme.of(context).textTheme.bodyText1!
                    .copyWith(
                    fontSize: _isFllowingSelected ? 18:14,
                    color: _isFllowingSelected ? Colors.white: Colors.grey),),
            ),
          ],
        ),
      ),
      body: PageView.builder(
        onPageChanged: (int page)=>{
          setState(()=>_snappedPageIndex = page),
        },
        scrollDirection:  Axis.vertical,
        itemCount: videos.length,
        itemBuilder: (context,index){
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              VideoTile(
                  video: videos[index],
                curentIndex: index,
                snappedPageIndex: _snappedPageIndex,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 5,
                      child: Container(
                        height: MediaQuery.of(context).size.height/4,
                        child: VideoDetail(video: videos[index]),
                  )
                  ),Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height/1.75,
                        child: HomeSideBar(video: videos[index]),
                  )
                  ),
                ],
              )
            ],
          );
        }),
    );
  }
}
