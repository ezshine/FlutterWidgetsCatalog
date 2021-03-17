const axios = require("axios");
const cheerio = require('cheerio');
const fs = require('fs');

var totalWidgets = 0;
async function getWidgetsCatalog() {
	// body...
	const res = await axios.get("https://flutter.dev/docs/development/ui/widgets");

	const $ = cheerio.load(res.data);


	var final = {
		catalog:[]
	};

	var catalog = $('.card');

	for(var i = 0;i<catalog.length;i++){
		var item_dom =  catalog[i];

		var title = $(item_dom).find(".card-title").eq(0).text();
		var desc = $(item_dom).find(".card-text").eq(0).text();
		var url = $(item_dom).find("a").eq(0).attr("href");

		var item = {
			title:title,
			desc:desc,
			url:url,
			list:await getWidgetsList(url)
		};

		final.catalog.push(item);
	}

	final.total = totalWidgets;

	console.log("共计"+totalWidgets+"个组件，正在写入widgets_catalog.json");
	
	fs.writeFile('./widgets_catalog.json',JSON.stringify(final),'utf8',function(err){
	    if(err)
	        console.log('写入出错：'+err);
	    else
	        console.log('写入成功');
	})
}

async function getWidgetsList(catalogurl){
	//https://flutter.dev/

	const res = await axios.get("https://flutter.dev/"+catalogurl);

	const $ = cheerio.load(res.data);
	
	var _arr = [];

	var cates = $(".catalog h2");

	if(cates.length>0){

		console.log($(".site-content__title h1").text()+"有子分类");

		for(var i = 0;i<cates.length;i++){
			var _cate = {
				title:$(cates[i]).text(),
				list:[]
			};
			var _cate_list = $(cates[i]).next().children(".card");
			_cate.list = parseCateList($,_cate_list);

			_arr.push(_cate);
		}
	}else{
		var _cate_list = $(".card-deck").children(".card");

		console.log($(".site-content__title h1").text()+"无子分类");

		_arr = parseCateList($,_cate_list);
	}

	return _arr;
}

function parseCateList($,_cate_list){
	var cate_list = [];

	totalWidgets += _cate_list.length;

	for(var j = 0;j<_cate_list.length;j++){
		var item = _cate_list[j];

		var title = $(item).find(".card-title").eq(0).text();
		var desc = $(item).find(".card-text").eq(0).text();
		var url = $(item).find("a").eq(0).attr("href");

		cate_list.push({
			title:title,
			desc:desc,
			url:url
		});
	}

	return cate_list;
}

getWidgetsCatalog();