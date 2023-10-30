import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newreader/models/blocstatemanager.dart';
import 'package:newreader/models/model.dart';
import 'package:newreader/models/selectcategorybloc.dart';
import 'package:newreader/utils.dart';

import 'newheaderline.dart';

class newscreen extends StatefulWidget {
  const newscreen({super.key});

  @override
  State<newscreen> createState() => _newscreenState();
}

class _newscreenState extends State<newscreen> {
  late getnewsbloc getnews;
  late selectcategorybloc selectcats;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getnews = getnewsbloc();
    getnews.getnews('general', 'us');
    selectcats = selectcategorybloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "News Reader",
          style: GoogleFonts.playfairDisplay(
              fontWeight: FontWeight.w500, fontSize: 30, color: Colors.black),
        ),
        actions: [
          StreamBuilder(
              stream: selectcats.countrystream,
              initialData: selectcats.defaultcountry,
              builder: (context, snapshot) {
                return DropdownButton(
                  dropdownColor: Colors.white,
                  value: snapshot.data,
                  style: GoogleFonts.playfairDisplay(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      color: Colors.black),
                  items: countrycodes
                      .map((code) => DropdownMenuItem(
                            child: Text(code),
                            value: code,
                          ))
                      .toList(),
                  iconSize: 22,
                  onChanged: (value) {
                    selectcats.selectcountry(value.toString());
                  },
                );
              })
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        bottomOpacity: 30,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            StreamBuilder(
                stream: selectcats.catstream,
                initialData: selectcats.defaultcategory,
                builder: (context, snapshot) {
                  return StreamBuilder(
                      stream: selectcats.countrystream,
                      initialData: selectcats.defaultcountry,
                      builder: (context, csnapshot) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: cats.map((e) {
                              return Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: InkWell(
                                  onTap: () {
                                    selectcats.selectcategory(e);
                                    getnews.getnews(e, csnapshot.data);
                                  },
                                  child: Text(
                                    e,
                                    style: GoogleFonts.playfairDisplay(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 30,
                                        color: snapshot.data == e
                                            ? Colors.black
                                            : Colors.grey),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      });
                }),
            SizedBox(
              height: 20,
            ),
            StreamBuilder<newsresponse>(
                stream: getnews.subs.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  List<newsmodel> newslist = snapshot.data!.news;
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: newslist.length,
                      itemBuilder: (context, index) {
                        newsmodel news = newslist[index];
                        return newsheaderline(
                            news.author == null ? '' : news.author,
                            news.title == null ? '' : news.title,
                            news.des == null ? '' : news.des,
                            news.img == null ? '' : news.img,
                            news.date == null ? '' : news.date,
                            news.url == null ? '' : news.url);
                      });
                }),
          ],
        ),
      ),
    );
  }
}
