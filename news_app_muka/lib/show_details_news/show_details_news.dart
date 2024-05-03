import 'package:flutter/material.dart';
import 'package:news_app_muka/data/model/news_model.dart';
import 'package:news_app_muka/show_details_news/widgets/row_element.dart';

class ShowDetailsNews extends StatelessWidget {
  const ShowDetailsNews({
    super.key,
    required this.newsModel,
  });
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          newsModel.author == null ? "Details " : newsModel.author!,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: newsModel.urlToImage == null
                  ? Container(
                      height: 350,
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(newsModel.urlToImage!,
                          loadingBuilder: (context, child, loadingProgress) {
                        return loadingProgress == null
                            ? child
                            : Container(
                                height: 250,
                              );
                      }),
                    ),
            ),
          ),
          Column(
            children: [
              RowElements(title: "Author : ", value: newsModel.author ?? ""),
              RowElements(
                  title: "Published At :  : ",
                  value: newsModel.publishedAt ?? ""),
              RowElements(title: "Title : ", value: newsModel.title ?? ""),
              RowElements(
                  title: "Description : ", value: newsModel.description ?? ""),
              RowElements(title: "Content : ", value: newsModel.content ?? ""),
              InkWell(
                  onTap: () {},
                  child:
                      RowElements(title: "Url : ", value: newsModel.url ?? "")),
            ],
          )
        ],
      ),
    );
  }
}
