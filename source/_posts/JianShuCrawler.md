title: 简书爬虫
date: 2016-03-11 17:46:23
tags:
---
``` python
import requests
import json
from bs4 import BeautifulSoup


class JianShuItem(object):

    def __init__(self, title, content):
        super(JianShuItem, self).__init__()
        self.title = title
        self.content = content

    def toObj(self):
        obj = {}
        obj["title"] = self.title
        obj["content"] = self.content
        return obj

    def console(self):
        print(self.title)
        for c in self.content:
            print(self.content[c])
        print("=========================")


class JianShuCrawler(object):

    def __init__(self):
        super(JianShuCrawler, self).__init__()
        self.stories = []

    def loadPageItems(self, pageIndex):
        url = 'http://www.jianshu.com/collections/38/notes?order_by=added_at&page=' + \
            str(pageIndex)
        response = requests.get(url)
        soup = BeautifulSoup(response.text, "html.parser")
        titles = soup.find_all('h4', class_="title")
        for t in titles:
            item = JianShuItem(t.select("a")[0].get_text(),
                               self.getDetail(t.select("a")[0]["href"]))
            item.console()
            self.stories.append(item.toObj())

    def getDetail(self, url):
        contentUrl = 'http://www.jianshu.com' + url
        response = requests.get(contentUrl)
        soup = BeautifulSoup(response.text, "html.parser")
        content = soup.find('div', attrs={"class": "show-content"})
        detailContent = content.select("p")
        contentArr = {}
        index = 0
        for c in detailContent:
            contentArr[index] = c.get_text()
            index += 1
        return contentArr

    def start(self):
        for i in range(10):
            self.loadPageItems(i)
        self.save()

    def save(self):
        jsonStr = json.dumps(self.stories)
        print(jsonStr)
        with open('data.txt', 'wt') as f:
            f.write(jsonStr)

crawler = JianShuCrawler()
crawler.start()
```