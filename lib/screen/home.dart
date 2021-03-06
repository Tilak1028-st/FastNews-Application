import 'package:flutter/material.dart';
import 'package:news_24/screen/newsfetch.dart';
import 'package:news_24/category/bussiness/bussiness_category.dart';
import 'package:news_24/category/entertainment/entertainment_category.dart';
import 'package:news_24/category/science/science_category.dart';
import 'package:news_24/category/sports/sports_category.dart';
import 'package:news_24/screen/articleview.dart';
import 'package:news_24/category/technology/technology_category.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var newslist;
  bool _loading = false;



  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    // TODO: implement initState
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Fast",
              style:
              TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.share,)),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      drawer:Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Center(child:Text('FastNews',
              style: TextStyle(
                color: Colors.blueAccent,
              ),
              ),),),
            ListTile(
              title: Text('Home'),
              onTap: (){
                Navigator.pop(context);
              },),
            ListTile(
              title: Text('Bussiness'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){return BussinessHome();},),);
              },
            ),
             ListTile(
                title: Text('Entertainment'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){return EntertainmentHome();},),);
                  },
              ),
              ListTile(
                title: Text('Science'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){return ScienceHome();},),);
                },
              ),
            ListTile(
              title: Text('Sports'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){return SportsHome();},),);
              },
            ),
            ListTile(
              title: Text('Technology'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){return TechnologyHome();},),);
              },
            ),
          ],
        ),
      ),
      body: _loading ? Center(
        child: CircularProgressIndicator(),
      ) : SingleChildScrollView(
        child: Container(
          child: Container(
            margin: EdgeInsets.only(top: 16),
            child: ListView.builder(
                itemCount: newslist.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return NewsTile(
                    imgUrl: newslist[index].urlToImage ?? "",
                    title: newslist[index].title ?? "",
                    desc: newslist[index].description ?? "",
                    posturl: newslist[index].articleUrl ?? "",
                  );
                }),
          ),
        ),
      ),
    );
  }
}


class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc,posturl;

  NewsTile(
      {required this.imgUrl, required this.desc,required this.title,required this.posturl});

  var newslist;

  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => ArticleView(
            postUrl: posturl,
          )
      ));
    },
      child: Container(
        margin: EdgeInsets.only(bottom: 24),
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Container(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      imgUrl,
                      height: 200,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      fit: BoxFit.cover,
                    )),
                SizedBox(height: 12,),
                Text(
                  title,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  desc,
                  maxLines: 2,
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}