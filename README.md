#1. routing 

home : MyhomePage() 를 

initialRoute: '/',
getPages: [
        GetPage(
          name: '/',
          page: () => MyHomePage(),
        )
      ], 로 변경함

#2. DefaultAssetBundle을 이용해서 json 데이터 load

buildcontext를 통해 다른 위치의 AssetBundle 에 접근하여 Asset을 사용할 수 있다. 

해당 예제에서는 
	await DefaultAssetBundle.of(context)
        .loadString("json/recent.json")
        .then((value) {
      setState(() {
        // re render 하기 위해서 setState 사용
        list = json.decode(value);
      });
    }); 이렇게 사용하였다. 

여기서 현재 해당 코드를 사용한 파일은 lib 폴더 밑에 인데 
lib폴더와 json폴더는 같은 위치에 있다. 
근데 ../json/recent.json 이렇게 파일 위치를 하는 게 아니라 
main 파일 위치 기준으로 설정하는 것 같다. 

#3. Get.toNamed("/detail"); 

어떤 컨테이너를 눌렀을 때 다른 페이지로 이동하고 싶은데 
전체경로를 적는 게 아니라 위에 처럼 별명을 적고
메인파일에 /detail에 대한 실제 페이지를 명시해주면 된다. 

#4. Get.back() => 바로 앞전에 왓던 페이지로 되돌아 간다. 

#5. arguments 전달 

 Get.toNamed('/detail',  arguments: {'title': info[i]['title'].toString()});
이런식으로 보내고

받은 페이지에선 Get.arguments['title']이렇게 받는다. 

json형태로 여러개를 보낼 수 있다. 

# 6. dependency injection 

final DetailController fav = Get.put(DetailController());
