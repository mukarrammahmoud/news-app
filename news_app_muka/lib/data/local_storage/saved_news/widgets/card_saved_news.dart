import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app_muka/colors.dart';
import 'package:news_app_muka/data/local_storage/local_storage_hive.dart';
import 'package:news_app_muka/data/model/news_model.dart';

class CardSavedNews extends StatefulWidget {
  const CardSavedNews({
    super.key,
    required this.news,
    required this.onTapNews,
     required this.isSaved,
  });
  final NewsModel news;
  final Function() onTapNews;
final bool isSaved;
  @override
  State<CardSavedNews> createState() => _CardSavedNewsState();
}
  

class _CardSavedNewsState extends State<CardSavedNews> {

    late bool isSavedNews;
 @override
  void initState() {
    isSavedNews = widget.isSaved;
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: widget.onTapNews,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: cardColor.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: widget.news.author == null
                        ? const Text(
                            "From Unknow",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )
                        : Text(
                            widget.news.author!,
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                  ),
                  Expanded(
                      child: Text(
                    "Published At  ${widget.news.publishedAt!}".split('T').first,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ))
                ],
              ),
              Builder(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: widget.news.title!,
                        style: const TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500),
                      ),
                  
                    ]),
                  ),
                );
              }),
            
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: widget.news.urlToImage == null
                      ? Container(
                          height: 350,
                        )
                      : Image.network(widget.news.urlToImage!,
                          loadingBuilder: (context, child, loadingProgress) {
                          return loadingProgress == null
                              ? child
                              : Container(
                                  height: 250,
                                );
                        }),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.download),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<HiveStorage>().addOrRemoveNewsFromBox(
                          widget.news.toJson(), widget.news.publishedAt!);

                      setState(() {
                        isSavedNews = !isSavedNews;
                      });
                    },
                    icon:  Icon(
                      Icons.favorite,
                      color: isSavedNews ? readMoreColor : Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
