<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="/js/hangjungdong.js" type="text/javascript"></script>

    <link rel="apple-touch-icon" href="/assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="/assets/img/favicon.ico">

    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/templatemo.css">
    <link rel="stylesheet" href="/assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
<style>
    ul.area_ul {
        list-style-type: none; 
        /* list 앞에 나타나는 총알을 없애줌 */
        margin: 0px;
        padding :0px;
        overflow: auto;
        background-color: #f3f3f3;
        border: 1px solid #e7e7e7;  
    }
    li.area_li {
    	height:40px;
        float: left;
        font-size:8px; 
        text-align: center;
        display: block;
        color: #666;
        padding: 4px 12px;
        text-decoration: none;
    }
    li.area_li a:hover:not(.active){
        text-decoration: underline;
    }
    
    ul.part_ul {
        list-style-type: none; 
        margin: 0px;
        padding :0px;
        overflow: auto;
    }    
    ul.part_ul li {
        float: left;
        font-size:8px; 
        display: block;
        width: 117px;
        color: #666;
        padding: 8px 12px;
        text-decoration: none; 
    }  
    ul.part_ul li a:hover:not(.active){
      	text-decoration: underline;
    }
    
    
    ul.specific_ul {
        list-style-type: none; 
        margin: 0px;
        padding :0px;
        overflow: auto;
    }    
    ul.specificl_ul li {
        float: left;
        font-size:8px; 
        display: block;
        width: 117px;
        color: #666;
        padding: 8px 12px;
        text-decoration: none; 
    }  
    ul.specific_ul li a:hover:not(.active){
      	text-decoration: underline;
    }
    
    
    .active{
        color: white;
        background-color: #4caf50;
    }
    table th {
 	 	width: 350px;
  		padding: 10px;
  		vertical-align: top;
	}
</style>
</head>

<body>
	<header><%@include file ="header.jsp" %></header>
	<main style="width: 70%; margin: 0 auto;">
		<div class="row align-items-center py-3">
			<div class="col-md-8 text-black">
        		<h2>나처럼 달려</h2><br><br>
	            <div id="route_buttons" style="width: 100%; height:60px; display:inline-block; align-items: center;">
    			<div style="width:150px; height:50px; display:inline-block;">
    				<form action ="/route" method="post" style=" display:inline-block">
    					<button id="routes_all" class="btn btn-success" style="width:150px;">전체보기</button>
    				</form></div>
    			<div style="width:200px; height:50px; display:inline-block;">
    				<form action ="/route_sort" method="post">
    					<button id="routes_sort" class="btn btn-success" style="width:200px;">지역별/거리별 보기</button>
    				</form></div>
    			<div style="width:150px; height:50px; display:inline-block; float:right;">
    				<form action ="/route_write" method="post">
    					<button id="route_reg" class="btn btn-success" style="width:150px;">코스등록하기</button>
    				</form></div>
    			</div>
        	</div>
		</div>
		
		<fieldset style="padding-bottom: 30px; border: 1px solid gray;">
		<form>
			<div id="area_div" style="margin: 0 auto; padding-top: 20px;">
				<div style="height:50px; margin: 0 auto;" >
					<div class="btn btn-success" style="width:10%; margin-left: 10%; display:inline-block;">지역</div>
					<input type="text" id="area_text" class="form-control mt-1" style="display:inline-block; width:70%;"/>
				</div>
				<div id="select_area" style="width:852px; margin: 0 auto; display: none; border: 1px solid gray;">
					<div id="select_range" style="width:852px;">
						<ul class="area_ul">
            				<li class="area_li active" value="11"><a>서울</a></li>
		        	    	<li class="area_li" value="26"><a>부산</a></li>
    		       			<li class="area_li" value="27"><a>대구</a></li>
        		   			<li class="area_li" value="28"><a>인천</a></li>
	           				<li class="area_li" value="29"><a>광주</a></li>
		           			<li class="area_li" value="30"><a>대전</a></li>
	    	        		<li class="area_li" value="31"><a>울산</a></li>
	    		   	    	<li class="area_li" value="36"><a>세종</a></li>
    	    	   			<li class="area_li" value="41"><a>경기</a></li>
	        	   			<li class="area_li" value="42"><a>강원</a></li>
    	        			<li class="area_li" value="43"><a>충북</a></li>
	    	        		<li class="area_li" value="44"><a>충남</a></li>
		           			<li class="area_li" value="45"><a>전북</a></li>
	        	   			<li class="area_li" value="46"><a>전남</a></li>
	    		    	   	<li class="area_li" value="47"><a>경북</a></li>
    	   		    		<li class="area_li" value="48"><a>경남</a></li>
	    	    	   		<li class="area_li" value="50"><a>제주</a></li>
    	    			</ul>
					</div>
    	    		<div id="select_part" style="width:852px; margin-top:3px;">
    	    			<ul id="part_ul" class="part_ul"></ul>
    	    		</div>
    	    		<div id="select_specific" style="width:852px; margin-top:3px;">
	    	    		<ul id="specific_ul" class="specific_ul"></ul>
    		    	</div>
       			</div>
			</div>
			<div id="distance_div" style="margin: 0 auto; padding-top: 20px;">
				<div style="height:50px; margin: 0 auto;" >
					<div class="btn btn-success" style="width:10%; margin-left: 10%; display:inline-block;">지역</div>
					<button style="width:15%; height:40px; text-align : center; line-height: 20px; display:inline-block;" class="btn btn-light">~5km</button>
					<button style="width:15%; height:40px; text-align : center; line-height: 20px; display:inline-block;" class="btn btn-light">5km~20km</button>
					<button style="width:15%; height:40px; text-align : center; line-height: 20px; display:inline-block;" class="btn btn-light">20km~</button>
				</div>
			</div><br><br>

			<div style="margin: 0 auto; text-align:center;">
				<input type="submit" value="검색" style="width:15%; height:40px; text-align : center; line-height: 20px;"/>
			</div>
		</form>
		</fieldset>
		
		<h2 style="display:inline-block">추천코스</h2>  <h4 style="display:inline-block">동작구</h4>
		<div id="routes_list" style="width: 90%; height:400px; margin-left: 5%; margin-right: 5%;">
        	<div id="route_mini" style="width: 30%; height:400px; display: inline-block; border: 1px solid gray; float:left;">
            	<div id="route_miniHeader">
                	<span id="route_userThumb">
                		<img id="userImage" src="data:image/png;base64,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" 
	                	style="width:25px; height:25px;">
    	            </span>
        	        <span id="route_userName">홍길동</span>
            	    <span id="route_uploadTime" style="float:right;">3시간 전</span> 
	            </div>
    	        <div id="route_miniInfo">
        	        <div id="route_miniTitle" style="text">보라매공원</div>
            	    <div id="route_miniThumbInfo">
                	    <img id="routeThumbImg"
                    		src="data:image/jpeg;base64,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"
                    		style="width:100%;height:300px; display:block; margin: auto;"/>
	                    <div id="route_miniContent">간단한설명</div>
    	            </div>
	            </div>
    	        <div id="route_miniFooter">
        	        <div id="route_miniFooterLeft" style="display: inline;" style="background-color:black ;">
            	        <span><img id="route_myLike" src="https://media.istockphoto.com/vectors/red-heart-design-icon-flat-valentines-day-sign-emblem-isolated-on-vector-id1131944419?b=1&k=20&m=1131944419&s=170x170&h=X3hjbz0XmLxyxWtuSMY9rXqlI89mqk1gSvgHHOtVuYA=" style="width: 15px; height:15px;"/></span>
                	    <span id="route_likes">3</span>
                    	<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTn6Horz4J02Of5NG7sPD2ieM6kG0ywqEJI1w&usqp=CAU" style="width:15px; height:15px;">
                    	<span id="route_Replies">4</span>
                	</div>
	                <div id="route_miniFooterRight"style="display: inline-block; float:right">
    	                <span>조회</span>
        	            <span id="route_myViews">3</span>
            	    </div>
            	</div>
        	</div>
        	<div id="route_mini" style="width: 30%; height:400px; display: inline-block; border: 1px solid gray; margin-left:5%;">
            	<div id="route_miniHeader">
                	<span id="route_userThumb">
                		<img id="userImage" src="data:image/png;base64,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" 
                			style="width:25px; height:25px;">
                	</span>
                	<span id="route_userName">홍길동</span>
                	<span id="route_uploadTime" style="float:right;">3시간 전</span> 
	            </div>	
            	<div id="route_miniInfo">
	                <div id="route_miniTitle" style="text">보라매공원</div>
                	<div id="route_miniThumbInfo">
                    	<img id="routeThumbImg"
                    		src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMSEhUTExMTFhUXFxcYGBgXFxsXFhoYHRcYFxgXGBoYHiggGCAlHRcaITEhJikrLi4uGiAzODMtNygtLisBCgoKDg0OGxAQGy0mHyUwLy0tLy8tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAOgA2QMBIgACEQEDEQH/xAAaAAACAwEBAAAAAAAAAAAAAAAEBQACAwEG/8QARhAAAQMBBAUIBgcIAgIDAQAAAQIDEQAEEiExBRNBUWEiMnGBkaGx0RQzUlNywQYVQmKCk7Ijc5Ki0uHi8EPxJGN0lMIW/8QAGQEAAwEBAQAAAAAAAAAAAAAAAQIDAAQF/8QAPBEAAQMCAgcGBQMCBgMBAAAAAQACEQMhEjEEQVFhkbHRE3GBocHwIjJCkuEUM/Ej4kNSU2KCsjRyogX/2gAMAwEAAhEDEQA/APYWXnHo+dF0LZecej50XXnBcDMkI428ZhxIxw5P2ZG3fEir2dDgJvqChsgRjRFSinUrzemLUpDhGtSgKBKU3CpRu8/svJNekpc8OUek0pSOWX0fcWoOKUsKTqwBCbpCgBfzGRMRTBq1JAAxwArGyOBIcKiByFZmNo30uVb2h9tPaKq1j3gFgJ7hKR1QNAkgJhZHAFScoqtmvh28t6UBAATA5xgqUYSIywxOB2bQPrNr201PrNr200RQrj6HfaeiQV2D6hxHVMw5yAAu6ZPgY2HbFY2e8GUpcc1jkypXEkmMAAQJjIZZCgvrNr201labegphDyUnDHPbiINHsK0Rgd9p6LfqGRGIcR1TNhcKBNG+mJ49leVbtRBE2lBAInkASJVO+JBT2Uf9Zte2mh+nrD6HfaeiwrMb9Q4oxwySd5NCaRNsD9nDCEFgga0m7hjypnlc3K7tzrn1m17aaMb08yABeGAos0eqPod9p6IsrUwbuHEdVZ8co9Jrey+rd+FPiKWOaVaJJvjE1rZ9LMhLgLicUiOPKBrN0atPyO1/Sdncg2tTn5hr1jYiWNtFWZyD04UpZ0oyP+RNao0syCDrE0Bo9YfQ77T0RbWpj6hxHVO7S5A4mkdlt5Wi8GzmBnsiZmK2f04yqOWkRxoVWkLPATfRAyEwBTHR6x+h32nonNamfqHEdUVr1ewe0UZYHjOIidlKDbLN7aO3q+VbN6YYBB1icONAaPWmzHfaeiHaM2jiE5tbkCN9DWfnJ6R41ZpzXpC2xeTiJSZE7qFaBU82BkFgK4GQMaeloz6tTDcRJMg2gewtWqhgDs5y3+816apWiWMsc42b58qrcoQuyF5iyc49HzoyloUQcKvrlb65pXIHACEfQlszFZ65W+grVaVqUGm+U4cN4SDv3nhT02OqHC3+N597hco3ecLRJPv3NhmSAu2m2JbwOKjkkYqPkOJrN1p24XHFpYbAk3jjG+QJ6wOujbLZUMZQtw85RxAPRtPcK8/9LkptbS2DaC2okXjdKhgeaRhImMjsHRXSDSonCBJ1k6u4XA4E65BsqAU2GPmPjhHCC7vMN1YXC5f2TRDHKJ1i1JSVTOcdMnbVk6sZNJ6yo/OsvoxaEXCi+p0oahRIKVKi6CThgSRRuta90r8z/GkqaRUcAS7iJ5gnzTfqKrQA1+Hu+HyaAsb6PdJ7/OpfR7pPf51trWvdK/M/xqa1r3SvzP8AGp9q/wDzDh+Fv1Wkf6zvuch1OoAJLacMftedBL03ZhMpSIEnBcREzOWVNda17pX5n+NVLjXuVfmf41u0O0cP7Uf1eka6rvuevNaY+mNlsz6GHGFFawgpKQCnlKKRiViMpyr0N9Huk/zeddWGCZNnkjIlQJ/TUtCm1JUlKFoJBAUFglJ2EApgxxomq7aOH9qx0uvqqu+5y0fCAlB1aeUkk872iN/Csr6PdJ7/ADoKzaILSmlqtNqdTdMocWi6eWvc3KcxlGVapaN4ElRE4pwyvTExu5M0XPcD8w4fhF2laRP7zvuciL6PdJ7/ADrZhKClZ1aeSARzt4G+prWvdK/M/wAa2s7jd1yGlc0Ty8+UOGFAVHHWOH4WbpWkT+877nIO+j3Sew+dS+j3SexXnW19k5oUniFA9xArZDSUJLiTfIMDCLvFQ37tlYVHnWOA6IDStJ/1Xfc7qs32m0J5Tab5yTB5I3qxz4UZYLQQ2gYc0eFJ1qJkkySMTR7LoS0lSsAEpnb4URVcbj0Ve3qVKJxOJhzYkk6nb0au3hJAJQCowkGASYJgTmYBMcDVvSjuFeL03Z2bU+0tVpdSLO4hQbS2bmsSoEKJjGQYnKDXpbJbkOzcMxBOBETMZ9BpjUeBn5DooydpQNltq0rfuqIl5RwjO6mrWR1QeSRkXEk8YM47saFZ9Y/+9V4JptoX1n4VVdukOpVzrkR5DkuJ1PtYBOv1K9El/LDKO6fOs79cqVCSvQleTNcprpXR6guUgkHdvoL0Nz2FdlRdReDEE+BXGQQYS+22i6MMVqwSOO/oGdHWJgWdMFN5ahKySZE4xI2nb2UHoxN5xTyhKW4CRxBjvUO6mVrN9KXMzkrpGR6x4V0v/o08A+Y3Pvdl926Ogf06cD5nCTuach/yEOO0FotdV9Jb9yj+I+dVL7XuUfxHzoepXHiO7gOihjO7gEfZVoIcutIQbisRM5jDE8aT6RW6GyWUpU5hdCubmJJjHKaaWH/k+BXiKUv2G8q9rHRwSsgZEZUxMgSiTIBKw0YLUlakvqaWm6ClaEFBvSZSpJUchEEddMqBOjJEa177WIXB5UDriMOk0cKUpSpUqVKCClSpUrLIm1+ra+BX6lUNRNr9W18Cv1Koamfnw5Jn5+A5KUXZfVu/CnxFCUXZfVu/CnxFBufgeSzM/A8kJWtnfKFSOgjYRtBoS2WgNtrcVzUJUo9ABJ8KlitSXW0Opm6tKVic4UARPbWEi4QEi4TO1WVtJ9aQCLwFwnA4jGa3s5Qltu8oiUA80kdtCW3mNfAfFVSwrCkhtRgG6Un2VeRyNVkC0DVt2TtXWCBSdA+pu3W1x2pghbZBIcPJxPJO8CqpebJgOGT9w0oFmtAS8A4lMXcCiTF9OGe6RPXRNjCmmwpZBdUDdjYPa7MB21tWXfn1Up3d+fVBJTDr4mYeV4JpnoX1n4TSawZu/vD4JpzoX1n4TT1P3+HIKNLMd/qn1SpUrLsS/R1pDqS0vMDDiPMUj00hTCVnHAG6d52dcxXQogyDBBwNb6et4cs4BwXfQDxxJJHZT0C2q5rH6iPEaxwXPh7X4Zh2Q5cUHo0lpICTxO49I20xKwghQEtuDFPiOkHI0AnIdA8KcWZgLZCemDuMmlp4qznXvcjvm/HIpqz5quc3aY7psO6IQTtkwvIN9HDMcFDZQtacptWZSobsK3NvUeddVxUgT21zfDrt74qXwnd7481LB/yfArxFCUa3bgJltOIg3ZSYrno6V+rJn2FZ/hOSqaJADbpiJAAug6LZQ2UGedBMicOUkCQTE4nLZQhFSkBSApo62xIOAEb1EEhSZyyME8MqjlnbhZA5t8dcYQbxAAkZjGOqldSmxDYmxjYpUqVKVIibX6tr4FfqVQ1E2v1bXwK/UqhqZ+fDkmfn4DkpRdl9W78KfEUJRdl9W78KfEUG5+B5LMz8DySbTBQpCmlrKb6TN0Em7IChhlIMb8TuqmhHGw2llC1L1aQAVAg3QSEjEYwBHVTGuBI3VpshNoRVt9W18CvFVVYscpSb6BITgVAHrpsxYkLZSpQMhJ2xtJrmjtGNqabUQZKROJzro7IkcOS7hSJoneW/9XLtnbSUG+pJIABIUMQCCLx2bpoB+zqWoqK25P3hhuAp0jRTYBABhQg4nfNZjQ7W4/xHrp3UnERHn+EhpOIAI815KyJhTwkGHTiMRknKnGhfWfhNaaH0Y2pT8g4PqAxOUJ86MWllhaQAby8sZzMSZp36O81ZHuAudtPswHOIA/MDzsjqlSpUV0ryZoPSWSfjHzow0HpPmg7lJ+fnS6N+83vXNRMVWH/c3mEUKZ6JtIEoO0yOndS1JwHV4VKnSqGm4OCVwhxBTVzSTZUUqadJAnFskZxgePzFds1uaUsIS0sE7S3CZiYJpKixOSFB57YY1hI5xVEHCNmWQorRzi2CQVrWDGC1FRETkTjt2zXpfqmZuBHh+ZTFsCYTh+xIVsAO8Yf90tFhKVG+YSnEqGZ3AcTTJNsCkynPduNYW6zm4TtzPRUtIDH3YJIuYyjruRDAG43eG/8ACweUHpIELGMe0n5qHfS+uoWQQQYIyNF2hAWNYkY/bSNh9ocD3Vw/NfXz3+/5U/FfXz3oOpUqUqRSpUqVlkTa/VtfAr9SqGo51lSkNBIJNxWXxKrRNgQjF1Y+EZ9vlVezc422DuyVC0kz3ckvbbKjCQSdwptZdGqCVhSgCoARnGIOMVl6cTyGUQOiT1/3rbRzSklanCBIGahOYzxwqlNjMQBvvyA45otGy/JU+pv/AGD+E+dT6m/9g/hPnV9IWRl6LzkQQQUrunAzHaKlisbLSlKSvFQAMqkYEkYbOca6uw0fb/8ASOG2XPqiLTY1ejFtOrUoDDWA6swq9ygDJoH6K2JbNiSlWqBDaYLYUAQGwkKVePO5OMUbb2mnEpvOlMBRF1y6FSCMYPKih9ANttNty8om6ZC3JiTeyO7IcKBwiwNl3tjsp3jzBXmNNtPutlDT6myrklQxhJ5x3zEgQRiQdlTQFgNkZDIdUsAk3jCSSTJJu5mScTjXtrUW3ExrAACCSlUcMwcM6zsQabKoeKr0c5y9ETlJ41z9jaMXviuTsbRi98UH9ETKHf36vBNYlxS7SnWYFLibqY+yVZ8cIx/0E6FtSAq0ytIm0KIxGUJxq1rsbbrqXEOJvCCRIMgHhlXp0qrKbzi2enrkoV6Tn0mBl4NxIuJ9Mx/CeIGX4P8A9VhWdSvMldZK8ko0PpFsqaWBnEjx+VLdPaMstrKUuqBKFEhIdKdovSEnOAROzGmtndQQAlQVAH2rxjIE9mdQa4scHjMGeC4XNlsKWZy8kEborWgbByFKbOwynoJkfMUdTV2BryBlmO43Hkr6R8T8f+b4uOY8HYh4Itt8AAVRDRcXCdvcN5rJloqMDOirWdWNUn8SvaPD7orF5c2+QQLnOb8WS1fdLSkgJISnaoYq3ny3U0bWFAEZGvDMfSy7afRSy8pJVdKyn9jN29gqcDPJnfXqbK4G1XJlCgFIJ47D4dIrr0arhdByPls45eiDiTf3/HuFe06NSZKcDu2f2pU04pCpGBH+kGvSUj0q3DhO/HzraZQDRjbbap5XChDa9urVuzSejamorRzmwA8QQcN+dB0VpIwrHYhM8OSK4pBEkeiaxElWRox0/ZjpIHzo1nRATis3vupy7aR6JfbtCStKpQkkKORkEiIOOMYcMa3fdvGctgG4bBTjC0S4eBP4HuVgWjV5/hNnlvRdQ3cSMoInxoJTARi7JVsQDieKjsHfXGAG0hwiVHmA7PvH5Un03aXUsuONoU44BISOcrESAYOMTsrPfiieGoeEBMSLTnv/AI8k1dtiiIHJT7KcB17+upZfVu/CnxFI/o9annGyp5txtUiErAwBQkwIAmCSJIzBp9ZfVu/CnxFJfFffySicV9h5ISpQWlWFOJCRfi9ywherUU3VYBQII5V3aKmiWlIQUm9F7kX16xQTCcCokk43tppLQlgQm1t9W18CvFVVYdbCUy1JhMm+RNWtvq2vgV4qrlhbASHFDki7A9pW7oG2qfjkuoftO72/9XJnZ22gg3k3bwBIvEwm8LpO7HHooF5SEqKSxiPvmgvTHyl46q8TdxvgYX049hOHCibIpTzYChDqQbomZSM09O0UxMgQPIKZMgQPIe/cJbZCCp6BA1pwmYwTtpxoX1n4TSawZu/vD4JpzoX1n4TTVP3uHJRo5j3rKfVKlSiuxeMXYkSZQmZOY3nHvqM2VCCSlKUkgAwIwEx4ntphpRq64rjj2/3mha5zMwuM2MIS3tHBxHORs3jaOnaKJsjocgpxn/TVwJrJyyqZcRcUJWsJUk5XlZHo39tXZ/VaKZzHy88PqN5O1dFEB7S19mznsJtwIz2QCNcslO6tN1POOZrJp8EXHMvsq2p8xwodwFKilQIUMwc+mNo41yoXaUtYva/C4RGrd6znORzCEtFntSFAHUQYMgKiIxIM440zdnUsAiVcoQNpvDAdZq1ntAAuLF5G7aDvTu6K3ty0oSgoQSEqC21XpBIIUQcM8IiqANM7PyPLemoNpueMXyyJ1WxDy36u+Ezs+jhADlodv4iGzyUkCSDKTMbzQFvdLZuOpC8LyVc3k5Yj7JGRFMTbEuwtD7KBiVJcQkqEgC6ZIIghRnbO4Ust2kW1uA3b6EouAjkBSplSgN3Cut7i1pv69V6VdgNJ+NkQNgEHUBABvkRskm4BFLMhtUqKCEJzN49QG8mgtKWoqxQyhRUoBQcUSm4cDhkcNlGv21C4BaVAyAVAHQAmsta17pX8f9q5S/ZHD+1eRAyB59Eh0dZVNqkMWdoLCb4bEYhMAYACBiBwp3ZGbxxwSBKjw8zlWzCW1mEsq/jwA3kxhWjtoaSChKVFMySFRJ7MQKWJOJx538kQ3WTz6IK0vFairLcNw2CgLXYA4ZK3E5c1UDCfOi7aZu6pNzE3io3sLpAgRsMHqoUNue13CMujfxoReZHn0S65nn0VbPYAgpN9xRAjlKJnCJI76bWX1bvwp8RQWldM2SzI1jyShMhIJWTJOQACZO09ANMbDaGVtrUhJKShKgQuQpJIIIMcQZotbrnbt2dyYNvM7duzuSi1WFtwgrTJHEjjsNds1iQ2ZSIwIzJzM7aZNltRADKyTkL/APajrVo9KE3tUo74Xl3Y1gwkGDbx6IBhIsbePRL7b6tr4FeKqa2XRyXGmioq5gwBAHHZQNtdbCG5bVEKjlZC8rPDHGmehLQFNpSAeSlIJ2TGIG+KvTYDM3y5L0KVEmg5xEiW8iPX1yVXNHNtoVziCADiN4OGFAJaaBkBYI+8PKtPpNbFtgQ42hBGIUlRUSFpJIIBgXZHTFIGdIKLgSX2TlICFAnl3ZByH+7BVezZsSdkzYtEKlx85S8rwTTTQvrPwmlFm57371Xgmm+hfWfhNRrf+Rw5LgZ8/ieZT6pUqUF1pZpqyqUEqCSYwMCcDke40mO6va3xvG3+od8ikOk9JNlRQlF5wGAcAJyiaduiuqk4M/evUoVxTYMT3R6ncg0gNiTzjlQK1S4yT79v9VWceJUQrBQJBG6DEVU+sY/ft/qoUqL6WkNa8QZ4923vFlM12VIDMgfHx3pppF8X1JcTeSMiMFJw+yr5HCsXdHKEXCFSJCSYcjoOBoq3BLbhWYKjzU7BhzlfIUrWsqJJMk5mkqOhxBvc89q6BXLW4HjENh1dxzG2xhccCk4LCkn74IrWy2sJkG6pBzTeHaNx411u1uJwCzG44jsNWNsJzS2eltPlUxgzE+Swdo+cOHiD6C3iUHbbIAoKQoKSrLESDuUNlbs2UxAjrWkeJq31gAoAts/lJx4TRripF5ttojanVIvJ7sRxpyWuGuy662l09IptY5zob3X3m+oW/lC+igc51ofik/yk139inNd/gnkjtVj3Uo+kX0k9FbC02dpwlSRdDaJulQSSMDOKgAIxJFQfSJS06xtqzasxdKwlCibqpSUqHJIIGBjA0IZE++a5g3R4n4uA9XJo9bZF1N1KfZBGPSczWEjeO0VjY9LOLM6uyxgTdCFESJAMCM8KC+j7L1mSlBS04g868LykLk4pK5vJIjkyIIwzwBwnM+X5SkaOc3O4N6pneG8doqXhvHaKJ9LPu2vykVPSz7tr8pFLDNvkljRtruDeqRaWsuvBbW0y41gYUrNWO44RvploZ1WpdDiUI5KAkBc4QmR1GR1UfZ3Cs4NswMyWkADiTW7tobukpbbMQLxaTiczA2CKdobGe1UaNHiZdwHVLEKSTBVdBwJSoBQ4gij7Q2yhIUH3VkkqALpIPKJhQ3CYx2Vh6WfdtflIqeln3bP5SKLHhogHyRbUoNEAu4DqtrXbE3Ecloyk7sOUcBjhUsVvdShCUoEACOSe3A1Vh+8oDVtYn3SMtuyuuacKPtNoSMgQAANlEOnImdwui6rTFOGk5jUNQPVGN2hxxKwtAwGHJIOJE50I+wu6bqRejC8kxOyYob/+qUebK/hQT35Vm39I7SskISkRtWfkmfGupocwfGI/9ob5EgnwUm6TTiJJ97kv0cXVuOfsykX1FcgkhUAXRG6JnoprYlqQ8hIEFRCTI2YCr6M0g40lc3VLWsrUYITJAEAdW+sbG/8At0lWJLiFzt2z/vAVak2jX0hzhFhMRY2iZOwnyC4KzsDW4SZJudl51bcsta9YGTw2d8+VVuVql8YYHC73T51nfritC9Qwq1ixo5kq9XJzmCTO/MVqaC0pYnHQEpVdAxMzjuy66rQnGAHYZzN/RRqj4ZwYiMhb1yVnLLZisoCUXxmMQf1GaA01ZkIDJSkA69vHrNVtOjVtNg8kKSeeJBM7MuO/ZQblqUpLLaySrXtweE5Gup7WCo09pO4zO8jUBbauem4g4XU8JN7RHcdc53iO5egcsiFGVJBJ21PQG/YHfWL+kkoUUkKJG6Kz+uEeyru868wloMFdJcxFegN+wO+p6A37A76F+uEeyru86n1wj2Vd3nQli2Jm5br0Wyc2x3+dJXpbcVdJEExFHuafQCBcWSd0edLH3LyireSaV5EWU6hbaFs4WnY1qBeBBCoBxGIJSds4yIqL0dfEJKHBukA/wqoapS4pzCTFOY98vJaI0cpEw0pM5wk44R14ClOi9LB9wtIQq8kSoCSRBgzhvgddNUvKGSlDoJrCwv2hB5ZZUCeVCLqyNvLTBz3zRGA5phgOco4WBzMi6N6iE+NS40nnKKzuTgnrUflXSlpeSlIP3uWP4hiOsVVyxrAmLw3pN4d2VGIuBPn78Vo1gT5+/FVftJUIwCRkkYD+54mrrH7JPxK8E0LWtraDlnuGYlQMGDiBEEGRlSgzM7PUIAzM7F5prSltLiVKsoDCnLkAnXpTJAdUMruExnjXoKBXotBM3nNuF8xiUk/p7zwgtlsJSEiTG/E0CRqQcRqWGklEIEEiVIEgkGCQDiOFWasLScQhM7zyj2nGtXrIXRdCgkyFAkSJSbwBxGcRQ3pLiee0Y3tm8OzOupheaQax2syJictRifCTsUiBMkd3vxCZ2BoKWlJyxkdU06RoxkZNgdvnXnNHaSbvgpUCRmnJW7I403Z08hUi4sRvjzqQb2fwuEHYRC6KTmkI/wBAb9gd9c+r2pBuCQQQccxjQ31wj2Vd3nW1jt6XFXQCDBOMUzHAH4Tfcqf03WsUbUq2rruqqmB2xWwlEXxgcDkezA/ymqnAGTkP0mPAivO6Ec5Sk78R1Z+PdTdaAQQciIoNqTdK2pIkJVpu0Xwi6ZRj1kGD/vGk59Yx+/b/AFUalMtrSc0KCuo8lXfFBH1jH79v9VCiS6u1x1rleS5wO2EbpT1qurwFCUXpT1qurwFEXRuFRqD43d55rYZKWVKZ3RuFS6NwpIRwJXG2u0zujcKl0bhWhbAllSmOGWFQAcK0IYEuqUzujcKl0bhWhHAllWbcKTKSQeBimN0bhUujcK0LYEP6be9YhKuI5Ku0Z9YrZhptSVhKyMASFDKCMZGBz3baxtY5PXUs2Dbp4IHar+1OHGb3/hEEze/8LN2wAjB9I6J7MqxVorDC1YxG3hieT/s1ypS4hsSYhsRzFlF5MOomRGKs56KVP26VKuNuEAkThsUQftbxRti9Yj4k+IoGyqASskgALcknADlmrMwdkXFs3AzOsHYRsQcbAC3sLB5QXzmFnpAntocIWnFsPp4Khae8z303qUzNKwjCG22SSOBJHkplgN13RbanG7zikNrki6cJGw7Y6KZ2BosrvrwQAeUDKeGI8KV1xSZEHKkbUpmoHFsCdXpPVUDi0WuRlO3fblC9GNOMkgBWf3TA2UdrBvrx4KggoB5JMxnuy3ZVXWO+8V216WLRXCWvjv8AwPUpW6ZXbaoye6BzJO/IImxu3XEnjB6DhXpq8ka9NZHbyEq3jHpyNeXTOpXpHMIB1F1+Dk4I/iEeIpKsQ4yDmH0D+anmm2+SlYzSfH+4pbpMf+QwoZLeaPbn3zVqA/qt7+f55oPEcR5/nmtNKetV1eAomhtKetV1eAomoVPnd3nmVm5n3tUqVKlKmUqVKlZZB2uzEqCkpSTtJJGQN3I45ntqllskKJKEAbCCZ3DuJo+pRlFSpVVGATQ3pfDv/tQSkgIupQnpfDv/ALVPS+Hf/ahKGILS183rqqcGTxWB2JJ+dV9JB5yZHxR8qIdcQG0cjAlRi8dkCZjGmGtCQZO5LqlE61v3f858qHsmlLM7OrCV3c7rkxnuHA9lLCSN61sXrEfEnxFea01YGbS04w46G1FTt034IJWpIN28L4xiDXrrGtBcQA3BvDG+Tt6KT2BplYvraC1FSiFXiMNYVp78a6GWouP+5vJyYWIvt9Fr9HW2kI1bSwpKR7esMkzJJJOOfhTeKAYDTc6toImJg5gZbK19L4d/9qhKYOC0tfNPV40FW7tokRHfWFKUjjJUqVKlZKumnGg3ZSpO4z1H/qk5ozRLt1wccPmPCmYYKdhhyc2tq8hSd4w6cxSBfKTZjtQ+hPUoyO+a9NXmrW0UuoAHJ9IZ8ZT4muuj+633vVn2IKvpT1qurwFc9L4d9d0p61XV4CgQVrWGmmy44RMAgBI9oqOCRUCxz6rmtF5PPgO82XOXQUZ6Xw76npfDvoe22Z9gXnmwlEgFaFX0pnK9gCkccq5QqUn04xa8siD4j35I4jMFNKlcFdpFVSpWFofiAm6VSnAqAN0mJqlltBVzrgOEXVTOGNFFbu5HoNLqZkTWXo6d3fSlI5pKBqUxasyOUSCbqSYmMqw1zXuT+YfKjhtc8/QFJhjM8/QIWi7bglofdJ7VE1Nc17k/mHyrrtqbVEsnAADlnIZbKwiDfn0RAABvz6JXbrTqwOQtV43YSJONI9C2RmyFZbbtH7Qyb+MCcEjEYC9nieJr2lr1SFqTqiYMTfI+VZtrQogBgknIaw+VGIkTz6Joj4Z59EOh7Vocd9hJjipXJQO091DWNm4hKdyQOvb31pbXUurCG/UtKkkGQt2IwO1Kccd9XQgnKq1h2bBS15nviw8BPidsqWu2r2fTnkQq1K19HVu8Kno6t3hXOjBV7O0CMd9bejp3d9csyCBjvreiFQAQsfR07u+p6Ond31tUowjAVzZmHeYu4rccu/5Gh3dHOtmQmYMynHuzqimkI55KleykwBwKvKtmNK3MEow3FSj40wg/OIO6eUdETgJ+Kx3dMk21ogHfjS/SqpDP/wAhrxNb2V7WgqiDMEUJppKgltV1Sgh5taroKjdBxMDE136PhxCCrEtwEyh9KetV1eArT6MBJLyTe1mtbXyecW4CUnIykG/I86wffaeWSh5uT9lR1assrq4oDS+jn0gPNBaXETCkzinaJT20tIOp13NeC3FIkg7ZHhaPPUuSS04wJA2X25L0hUlDDmtbtCEJZcCtYUFJBnk8nNRJwivN2NJDaArMJSD0xSux2t+1qBfdWtCDME8kq2YCAd8+dOq3/wCh8B7ImTmd1rDhc+GxJ2oqw5ogavfJMxXaX69W+pr1b68+VbGEWphJN4pBMRJGMZ1xqyoTzUJGWQ3YChderfU16t9HEtjCYVKX69W+pr1b6ErYwmaOa58KvlXjdOWBpa0rccCSmLkhRumYvJIULpJIFeosbpIck/YV8qR22xLWqUuXRuuJOEHIn711XVTTAHisXZHvRGkGQtpxCiUhSFAqGBAIIkRuzpT9FtHhlLn/AJK7QpSkypU4AJwSBJG89degbsThRjhCYLioSmY50nDPGhrAgJkX1WpWHMAQ2mBBvOkBMTjAmqUqFWqCGC3lxP4SXDb2HvLWfBNLeyVPORkDJJwSBGZJyFLnbTeBQySEnBb2RWNqW9w3q21ppJt1xZD6kwDOqRgid6jms8ThwrgFUc9lJxLLu26h3bTvyGqcxnGXGPz+OfcqtthICQIAwAFE2PndXlWFb2PndXlXLMmUG5hG1KlSirLJ9y6kkJKo2DM1kbUfduZHZuMR86JIoUaPRAHKwjadn/VFFENqkAwRwOdXriUwAN2FdoIJWalM/o8s8tKomZB4ZEdXzpbbLEtpwgcwmR0buqsWwJUi2GymOhHYUU7xPWP+6ckV5myu3VpVuPdtr1FUpm0K1I2XmLQoklLgSsAkQtIV41i0y0jFKFNne04pHcDHdR2mGocn2hPXkaBot0itT+FrjHvbKgWw7eFezoLabrb60Jkm6tpDiZJk5AHOsrPpJLi1NpXYnVo56QXG1pxjlRIFVeeCBKjAkDrJgUg0cbKy66+grl+CrkEweWrOMBgRG8cat+rc+cbWn/iEzRAtO7Xzy8F60tLAk2ZQByLb6VA9F4CsH7OFAAtWxEEGUhKurkqxFdstrIEjFKhJBEpI4iiQwlfqzdV7BPgdvQawq0Xf4YncSOcoi+XIeUAJemytpUFf+btkFlSgcAMYPCcIoj9nutP/ANZXnXFLUDBKgRskiqP2soSVFSoAkwSaXtdHP+Gfu/CWZ1Dz6rG0aRYQtDahab7nMTqIKoKUmMdhUJ3TRgRus7/4lNoH6ia8rpf0Z59h9x15K2FcgAkJJUtLeMicVQMCJp1ZLch0kJMlMTIg4zGfQeyt2lEX7Pi4omwy8kzbdcTN1lluRBvvFZj4UJ+dVLi/fhHBloA/xrJPdQ9St+rj5GNHhPNLidGfpyhRbbZMqSpxXtOrLnYk8kdlXddKhBOAyGQHQBgKpVVrABJIAGZOAFRq6RUqj43E8uGXklR2lzLy+n5UHWmlLYgrcWFJUkKzSbw2ez00tTpdqUi8QVEJTIIknZ3UrwcR7yqPBxHvR1WQsjKq1KRItNerfU16t9Z1KyMlaa9W+pr1b6zqVlpK016t9TXq31nUrLSVo06UqChmKfNuIeTiJ3jaD/u2pUp2G8J6RvCAc0UJ5Kx0Kz/3qpqwCEgKzAANdqVRoAyVmtAuEFppqUBXsnuP+ikdSpU6nzKNX5lKk1KlIpqVKlSssi02sKEOAqGxQ5w69vQa56Og5Op/ElQPcDXalMXXg3TYpN7qejJ96j+b+mp6In3qOxX9NSpRts5o22c+q56In3qOxX9NT0RPvUdiv6alShbZz6rW2c+qnoifeo7Ff01hb9EtvNqaW6kpWIUBeEjaJAwnKpUo22c+qMjZz6oaz/RmzMIcbsrmpQtV4cpaiDgDF6c430axYQkRrwrioqJ/TXKlMYNyETBuQtPRE+9R2K/pq6dHkglK0KjYDiegRXKlZjWuMRzRY1rjEc1RVlAJBcQIH3s92WdUSwOT+0RjnnhwOFSpSkAFJaclA0kYlYzghIMxvE4V116RdTgiZAwnrO2uVKWdSUnUsalSpQQX/9k="
	                    	style="width:100%;height:300px; display:block; margin: auto;"/>
    	                <div id="route_miniContent">간단한설명</div>
        	        </div>
            	</div>
            	<div id="route_miniFooter">
	                <div id="route_miniFooterLeft" style="display: inline;" style="background-color:black ;">
    	                <span><img id="route_myLike" src="https://media.istockphoto.com/vectors/red-heart-design-icon-flat-valentines-day-sign-emblem-isolated-on-vector-id1131944419?b=1&k=20&m=1131944419&s=170x170&h=X3hjbz0XmLxyxWtuSMY9rXqlI89mqk1gSvgHHOtVuYA=" style="width: 15px; height:15px;"/></span>
        	            <span id="route_likes">3</span>
            	        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTn6Horz4J02Of5NG7sPD2ieM6kG0ywqEJI1w&usqp=CAU" style="width:15px; height:15px;">
                	    <span id="route_Replies">4</span>
	                </div>
    	            <div id="route_miniFooterRight"style="display: inline-block; float:right">
        	            <span>조회</span>
            	        <span id="route_myViews">3</span>
                	</div>
	            </div>
    	    </div>
        	<div id="route_mini" style="width: 30%; height:400px; display: inline-block; border: 1px solid gray; float: right;">
            	<div id="route_miniHeader">
	                <span id="route_userThumb">
    	            	<img id="userImage" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPAAAADSCAMAAABD772dAAAAS1BMVEX39/eampr7+/uUlJSXl5f8/Pz09PTT09OSkpKnp6fl5eWdnZ3v7++8vLzy8vLBwcHZ2dnHx8ff39+3t7epqamwsLDNzc3W1tbj4+OXfCaUAAAJ40lEQVR4nO1daZOqOhCVJIiAqIgy9///0sfiwkgCyeluZF5xPs2tWxX70EmvWXa7DRs2bNiwYcOGDf8PqBG+LZEQGmZxvNsds0uSJGXR4dz8mWRZ85/x/4l5S/WUXerqlh50D/PA45+HPC3KJDu1vL8tLREN2f21rnLTkYzcaMmb/F5eTn9X1Y1ij8m50eok00/ah7xKsj9IutVskTda8+U6YK11VCTHv8S5WbP13SBkB6TTMov/BOeW7Q1S7Yh0Xmar17NSV5puPzjf6t2K9dxYqTJiY9tTNodqrWpulcvL9sFZp8lufZSVSlIJuj1lU+7XRVntklzLsH1wNsVxPZQb7crS7Sjr4rQOyuLafVNexcSOr+kidDvKpv62xY6z+2J0W+j8Gn+RrlJnKcvsplx9z3rF13xputEX57XaV4vO5jd0+g0lx5foC+rtYXS9NGO1K76k3h5LKznOvrF6hzAmWdBcq/qr6u2hq6VSCrVf1ve6YPJsEcbq+O3p/ITRlwWmdfyzCvX2OJzFGcflivg2C/kmHYR8K9hwwYj6J7W70fm+uyzdH+ThBE2XOqY0+Vqa+a2o6iT5ybJrndRFlXZtGMqo+p8QY5p5bnjlRZLtx/3S47W8k4qdQozVCefbsK3a7oldMKXi/fWc45y1RNSljnCyYPT9R83U05uPcS3gqX2o2Rnj89no89Gre6DUqTagUWTXMcy3SdcDKm9qV4Pz6MCbMKJ8G+0G1lbVDqwasVoulK9Os/CZFh+xMigr4xvGt4Q6f0ph4atmi7liiK/J/6GGJP4HreSciXEMVXP0jdAZUSfkG5uUhy9U3tAV8WeRqN3cGJyTuh4QvgX1p6F5pen5sTpC+iXzRRn/kJcx4pA4+O4w30A11XGFGI87T5ynkI+d034yQSZ0zuQP1RH52hXha2ML2LAFAOqCLOOE4A6RCgeD3XghPiOMj4v+HGlKjaBSQIIU/OIqg0LaPSPfnfqHqLjEGKscoEtZQTZAbgLzTdCEjtDp5MQeWVaIFNiE5i8gqjOiYqD+AVlorpBjiBOUmwZbaqwFLFEhhlQMfHnIQrOv4BbIKo4O1zBR4gKZSNwm+iELYqijsGIA6IKNAN02I4dWV9DHj++QpeDJCseMkYAgMgEREPZNIx24brzFQcxWZALiLcglNRChCy8w/yAXVLCppDrTCuLrv8JiTMGceeEHYchOe+eJUNodMD5AGCq8RObspwGs0cBX2bEAqrz4GmrURJhCjjC2iD0NNeaDm9EFt/SiMnlNOqRU2EIL7nxUJSaUjx3FvHwkabMaodD9jqmHZ4K3rkjuiAPtise0g7+l18eEga6zeUuK+iTBOKvFHp53c54JnTveXh4DUp/uMJclwiZL1A230S4q1kyPHEs9u5FFT9bAhGecB1Tofwwsljp0gkElpxbT0RY+o1dLeLqwiM/o9RLW2cSw+IxeL+Ep44KGrOsmfJsgDNvCFROO9Mk5LJhnr52wUzKwkrJ2wu6gF+tpPAmLtFleooEVgJ6xU8OU0zQrDS1bOB0TnDh0hEWTBxJh45h8pCUsrOEdHhG5FzFY7n6OyrF11wk4H+7gqOVRvLB7VB6QVpsrYzrRDlLKNId7gN2uF+GLTRmUQLobdSJIJxNOSFPaniKqmnZ01P4ZmQiTzItjiwtx0KAGdDBhmnmx2xeSq4tky5bQRp6hbNbaJW1MSTNNtFmOejwlVepHlesPE82LNdCHuxnvUcWsFil1aGGzL7TAshtVLpqmXo1gi3vJ00Zo4+GOYQlbyzyUFPsBqUVMKB4/YdGFQrtoA8JCNQBC8fglmmVUohuOZHZLtyD7Dzth+meU2lxKKB6/CFsCfYZLdmQcEzUE7AmPJWMgLFIEoAcIkVUVHMNGxl3zxgnTbbTNnrJ8R5kmMYNcYoQFYg905+dviBHm3yNOjqM7jMNeJsLmzk2YwQlHtmCaiTB7eIkdrxlBjjDvaVrwXJpFLDHCzCpm8UmRKGFeFe95hJIkzKpijjC6gyRhThUTmyEDoUY1Hj7CnNc8Ma1gwcCjBV8KgW4aHsNSm+Bx8P3oTFkiT5DVi2QpxjBeOku7HuYJfK/6GLaT3IyXRhuWW5C5XFILSwGAoaY1GJ/Bbim+CW31layE4ctS3sAuanPBVsQjdks/foDaO2X0Gp08ll/gSUtev0Cc1HuGIuoAtkI8bVfBJwytecrokTppLL1rnlLK4DcoFwJw30RvbabxLhpS+EHvnn3AWlyk7f2y/Qq8jNlFsX78mNdMEHwTaVevFdaUldlORHCiSG/NjyWx/g5bLvYC1j/lDCkfsB4E5YzVn0C8MXNA0MKx05fbTEfYMmbMU19iODpA7D+EnIQQULDr2DTDpocxwgMuASG0/RCxgNUKvwqBO+Br4TqqxR7fdD8W2ECV+OrODWTULZzWHwvccsofDUwEuRybKT4RTJg73mtwcN0DIDKdAg+7SBB23j8hsYhDcyaBWTaxB1QgqHN4BCcE3PDEZZv8FiO4tiXhliZ+jTtP0eHHAtjDn0mzydat6wHwbdYV8WG2kRBTVgS+mMb6S9EPlA8zvxQ6uQGUcU7rqEQfU40TxqeNZwIBpjltDmlCeDtW7fneJp/xixx22mhTZNBLSwPKpzP9DchempkfIpc9jL4le4YHRdWpJjwM+BZnNtKj0q2oyn1TVtc7Wc2zV3yTIh0Teb7450s5PtUpTc3zNSa8smVMGfDiny9nlRWEdz490nE0ejeRAN2esrrcUMoed5diZktEuwPOWQVR9msFhGekRheCdDvK8bGMwjXhtSsw+MEDo++Srzy/5No3fipQMr+DVIGlLej5SghKJWGUPffnB1V6dH6VfrZ8KFoYZd++h7+KjUkWpNsihLJ3eclXxcacCRkCioayZzLl39jyy5kaW7XQ4v1Ak0wdPCgH1A99VKzzy3fodgKeqnmdhHQuZ1ex0XB6z4P4OvcoYtARqjlfrG9fms0DEdV58lHV0F3bU+GW0fXCttmKOJtScuDRi6nysE6XCKw8oFThVHLwfWbu+qU+r0G9PeKLq0Jg2U06A0debKLrt1fvEK7n3IFX4uxHhnRKeChbAmpnq2JPXc/qHspit3TBLzIVtoeZD8ibE5bmqS7XNJ2fUKOtt6Cco5OsOlkj37ZT8cEYPoDwe1IfVsp3tL0amtAtfl8LuFb9tlDDdUxYeMMvt871+8Sgq0w6UfN+LY775Dc33odCwp8tHeJ1Il3qriwuvHwK8Z6JZ0wN24HF8PApmnoKsF/GZtULuEe3BQkKsX6jPwLIIZEwuhw+Z3jBfJ8b2fvfudDEwizPmKnjn1Bwq+IDz0ltdRW8dZYTRy4515Pwz+CvyLlhw4YNGzZs2LBhw4Y/gP8ARIqLgY69A70AAAAASUVORK5CYII=" 
        	        	style="width:25px; height:25px;">
            	    </span>
	                <span id="route_userName">홍길동</span>
    	            <span id="route_uploadTime" style="float:right;">3시간 전</span> 
        	    </div>
	            <div id="route_miniInfo">
                	<div id="route_miniTitle" style="text">보라매공원</div>
	                <div id="route_miniThumbInfo">
    	                <img id="routeThumbImg"
        	            	src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMSEhUTExMTFhUXFxcYGBgXFxsXFhoYHRcYFxgXGBoYHiggGCAlHRcaITEhJikrLi4uGiAzODMtNygtLisBCgoKDg0OGxAQGy0mHyUwLy0tLy8tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAOgA2QMBIgACEQEDEQH/xAAaAAACAwEBAAAAAAAAAAAAAAAEBQACAwEG/8QARhAAAQMBBAUIBgcIAgIDAQAAAQIDEQAEEiExBRNBUWEiMnGBkaGx0RQzUlNywQYVQmKCk7Ijc5Ki0uHi8EPxJGN0lMIW/8QAGQEAAwEBAQAAAAAAAAAAAAAAAQIDAAQF/8QAPBEAAQMCAgcGBQMCBgMBAAAAAQACEQMhEjEEQVFhkbHRE3GBocHwIjJCkuEUM/Ej4kNSU2KCsjRyogX/2gAMAwEAAhEDEQA/APYWXnHo+dF0LZecej50XXnBcDMkI428ZhxIxw5P2ZG3fEir2dDgJvqChsgRjRFSinUrzemLUpDhGtSgKBKU3CpRu8/svJNekpc8OUek0pSOWX0fcWoOKUsKTqwBCbpCgBfzGRMRTBq1JAAxwArGyOBIcKiByFZmNo30uVb2h9tPaKq1j3gFgJ7hKR1QNAkgJhZHAFScoqtmvh28t6UBAATA5xgqUYSIywxOB2bQPrNr201PrNr200RQrj6HfaeiQV2D6hxHVMw5yAAu6ZPgY2HbFY2e8GUpcc1jkypXEkmMAAQJjIZZCgvrNr201labegphDyUnDHPbiINHsK0Rgd9p6LfqGRGIcR1TNhcKBNG+mJ49leVbtRBE2lBAInkASJVO+JBT2Uf9Zte2mh+nrD6HfaeiwrMb9Q4oxwySd5NCaRNsD9nDCEFgga0m7hjypnlc3K7tzrn1m17aaMb08yABeGAos0eqPod9p6IsrUwbuHEdVZ8co9Jrey+rd+FPiKWOaVaJJvjE1rZ9LMhLgLicUiOPKBrN0atPyO1/Sdncg2tTn5hr1jYiWNtFWZyD04UpZ0oyP+RNao0syCDrE0Bo9YfQ77T0RbWpj6hxHVO7S5A4mkdlt5Wi8GzmBnsiZmK2f04yqOWkRxoVWkLPATfRAyEwBTHR6x+h32nonNamfqHEdUVr1ewe0UZYHjOIidlKDbLN7aO3q+VbN6YYBB1icONAaPWmzHfaeiHaM2jiE5tbkCN9DWfnJ6R41ZpzXpC2xeTiJSZE7qFaBU82BkFgK4GQMaeloz6tTDcRJMg2gewtWqhgDs5y3+816apWiWMsc42b58qrcoQuyF5iyc49HzoyloUQcKvrlb65pXIHACEfQlszFZ65W+grVaVqUGm+U4cN4SDv3nhT02OqHC3+N597hco3ecLRJPv3NhmSAu2m2JbwOKjkkYqPkOJrN1p24XHFpYbAk3jjG+QJ6wOujbLZUMZQtw85RxAPRtPcK8/9LkptbS2DaC2okXjdKhgeaRhImMjsHRXSDSonCBJ1k6u4XA4E65BsqAU2GPmPjhHCC7vMN1YXC5f2TRDHKJ1i1JSVTOcdMnbVk6sZNJ6yo/OsvoxaEXCi+p0oahRIKVKi6CThgSRRuta90r8z/GkqaRUcAS7iJ5gnzTfqKrQA1+Hu+HyaAsb6PdJ7/OpfR7pPf51trWvdK/M/xqa1r3SvzP8AGp9q/wDzDh+Fv1Wkf6zvuch1OoAJLacMftedBL03ZhMpSIEnBcREzOWVNda17pX5n+NVLjXuVfmf41u0O0cP7Uf1eka6rvuevNaY+mNlsz6GHGFFawgpKQCnlKKRiViMpyr0N9Huk/zeddWGCZNnkjIlQJ/TUtCm1JUlKFoJBAUFglJ2EApgxxomq7aOH9qx0uvqqu+5y0fCAlB1aeUkk872iN/Csr6PdJ7/ADoKzaILSmlqtNqdTdMocWi6eWvc3KcxlGVapaN4ElRE4pwyvTExu5M0XPcD8w4fhF2laRP7zvuciL6PdJ7/ADrZhKClZ1aeSARzt4G+prWvdK/M/wAa2s7jd1yGlc0Ty8+UOGFAVHHWOH4WbpWkT+877nIO+j3Sew+dS+j3SexXnW19k5oUniFA9xArZDSUJLiTfIMDCLvFQ37tlYVHnWOA6IDStJ/1Xfc7qs32m0J5Tab5yTB5I3qxz4UZYLQQ2gYc0eFJ1qJkkySMTR7LoS0lSsAEpnb4URVcbj0Ve3qVKJxOJhzYkk6nb0au3hJAJQCowkGASYJgTmYBMcDVvSjuFeL03Z2bU+0tVpdSLO4hQbS2bmsSoEKJjGQYnKDXpbJbkOzcMxBOBETMZ9BpjUeBn5DooydpQNltq0rfuqIl5RwjO6mrWR1QeSRkXEk8YM47saFZ9Y/+9V4JptoX1n4VVdukOpVzrkR5DkuJ1PtYBOv1K9El/LDKO6fOs79cqVCSvQleTNcprpXR6guUgkHdvoL0Nz2FdlRdReDEE+BXGQQYS+22i6MMVqwSOO/oGdHWJgWdMFN5ahKySZE4xI2nb2UHoxN5xTyhKW4CRxBjvUO6mVrN9KXMzkrpGR6x4V0v/o08A+Y3Pvdl926Ogf06cD5nCTuach/yEOO0FotdV9Jb9yj+I+dVL7XuUfxHzoepXHiO7gOihjO7gEfZVoIcutIQbisRM5jDE8aT6RW6GyWUpU5hdCubmJJjHKaaWH/k+BXiKUv2G8q9rHRwSsgZEZUxMgSiTIBKw0YLUlakvqaWm6ClaEFBvSZSpJUchEEddMqBOjJEa177WIXB5UDriMOk0cKUpSpUqVKCClSpUrLIm1+ra+BX6lUNRNr9W18Cv1Koamfnw5Jn5+A5KUXZfVu/CnxFCUXZfVu/CnxFBufgeSzM/A8kJWtnfKFSOgjYRtBoS2WgNtrcVzUJUo9ABJ8KlitSXW0Opm6tKVic4UARPbWEi4QEi4TO1WVtJ9aQCLwFwnA4jGa3s5Qltu8oiUA80kdtCW3mNfAfFVSwrCkhtRgG6Un2VeRyNVkC0DVt2TtXWCBSdA+pu3W1x2pghbZBIcPJxPJO8CqpebJgOGT9w0oFmtAS8A4lMXcCiTF9OGe6RPXRNjCmmwpZBdUDdjYPa7MB21tWXfn1Up3d+fVBJTDr4mYeV4JpnoX1n4TSawZu/vD4JpzoX1n4TT1P3+HIKNLMd/qn1SpUrLsS/R1pDqS0vMDDiPMUj00hTCVnHAG6d52dcxXQogyDBBwNb6et4cs4BwXfQDxxJJHZT0C2q5rH6iPEaxwXPh7X4Zh2Q5cUHo0lpICTxO49I20xKwghQEtuDFPiOkHI0AnIdA8KcWZgLZCemDuMmlp4qznXvcjvm/HIpqz5quc3aY7psO6IQTtkwvIN9HDMcFDZQtacptWZSobsK3NvUeddVxUgT21zfDrt74qXwnd7481LB/yfArxFCUa3bgJltOIg3ZSYrno6V+rJn2FZ/hOSqaJADbpiJAAug6LZQ2UGedBMicOUkCQTE4nLZQhFSkBSApo62xIOAEb1EEhSZyyME8MqjlnbhZA5t8dcYQbxAAkZjGOqldSmxDYmxjYpUqVKVIibX6tr4FfqVQ1E2v1bXwK/UqhqZ+fDkmfn4DkpRdl9W78KfEUJRdl9W78KfEUG5+B5LMz8DySbTBQpCmlrKb6TN0Em7IChhlIMb8TuqmhHGw2llC1L1aQAVAg3QSEjEYwBHVTGuBI3VpshNoRVt9W18CvFVVYscpSb6BITgVAHrpsxYkLZSpQMhJ2xtJrmjtGNqabUQZKROJzro7IkcOS7hSJoneW/9XLtnbSUG+pJIABIUMQCCLx2bpoB+zqWoqK25P3hhuAp0jRTYBABhQg4nfNZjQ7W4/xHrp3UnERHn+EhpOIAI815KyJhTwkGHTiMRknKnGhfWfhNaaH0Y2pT8g4PqAxOUJ86MWllhaQAby8sZzMSZp36O81ZHuAudtPswHOIA/MDzsjqlSpUV0ryZoPSWSfjHzow0HpPmg7lJ+fnS6N+83vXNRMVWH/c3mEUKZ6JtIEoO0yOndS1JwHV4VKnSqGm4OCVwhxBTVzSTZUUqadJAnFskZxgePzFds1uaUsIS0sE7S3CZiYJpKixOSFB57YY1hI5xVEHCNmWQorRzi2CQVrWDGC1FRETkTjt2zXpfqmZuBHh+ZTFsCYTh+xIVsAO8Yf90tFhKVG+YSnEqGZ3AcTTJNsCkynPduNYW6zm4TtzPRUtIDH3YJIuYyjruRDAG43eG/8ACweUHpIELGMe0n5qHfS+uoWQQQYIyNF2hAWNYkY/bSNh9ocD3Vw/NfXz3+/5U/FfXz3oOpUqUqRSpUqVlkTa/VtfAr9SqGo51lSkNBIJNxWXxKrRNgQjF1Y+EZ9vlVezc422DuyVC0kz3ckvbbKjCQSdwptZdGqCVhSgCoARnGIOMVl6cTyGUQOiT1/3rbRzSklanCBIGahOYzxwqlNjMQBvvyA45otGy/JU+pv/AGD+E+dT6m/9g/hPnV9IWRl6LzkQQQUrunAzHaKlisbLSlKSvFQAMqkYEkYbOca6uw0fb/8ASOG2XPqiLTY1ejFtOrUoDDWA6swq9ygDJoH6K2JbNiSlWqBDaYLYUAQGwkKVePO5OMUbb2mnEpvOlMBRF1y6FSCMYPKih9ANttNty8om6ZC3JiTeyO7IcKBwiwNl3tjsp3jzBXmNNtPutlDT6myrklQxhJ5x3zEgQRiQdlTQFgNkZDIdUsAk3jCSSTJJu5mScTjXtrUW3ExrAACCSlUcMwcM6zsQabKoeKr0c5y9ETlJ41z9jaMXviuTsbRi98UH9ETKHf36vBNYlxS7SnWYFLibqY+yVZ8cIx/0E6FtSAq0ytIm0KIxGUJxq1rsbbrqXEOJvCCRIMgHhlXp0qrKbzi2enrkoV6Tn0mBl4NxIuJ9Mx/CeIGX4P8A9VhWdSvMldZK8ko0PpFsqaWBnEjx+VLdPaMstrKUuqBKFEhIdKdovSEnOAROzGmtndQQAlQVAH2rxjIE9mdQa4scHjMGeC4XNlsKWZy8kEborWgbByFKbOwynoJkfMUdTV2BryBlmO43Hkr6R8T8f+b4uOY8HYh4Itt8AAVRDRcXCdvcN5rJloqMDOirWdWNUn8SvaPD7orF5c2+QQLnOb8WS1fdLSkgJISnaoYq3ny3U0bWFAEZGvDMfSy7afRSy8pJVdKyn9jN29gqcDPJnfXqbK4G1XJlCgFIJ47D4dIrr0arhdByPls45eiDiTf3/HuFe06NSZKcDu2f2pU04pCpGBH+kGvSUj0q3DhO/HzraZQDRjbbap5XChDa9urVuzSejamorRzmwA8QQcN+dB0VpIwrHYhM8OSK4pBEkeiaxElWRox0/ZjpIHzo1nRATis3vupy7aR6JfbtCStKpQkkKORkEiIOOMYcMa3fdvGctgG4bBTjC0S4eBP4HuVgWjV5/hNnlvRdQ3cSMoInxoJTARi7JVsQDieKjsHfXGAG0hwiVHmA7PvH5Un03aXUsuONoU44BISOcrESAYOMTsrPfiieGoeEBMSLTnv/AI8k1dtiiIHJT7KcB17+upZfVu/CnxFI/o9annGyp5txtUiErAwBQkwIAmCSJIzBp9ZfVu/CnxFJfFffySicV9h5ISpQWlWFOJCRfi9ywherUU3VYBQII5V3aKmiWlIQUm9F7kX16xQTCcCokk43tppLQlgQm1t9W18CvFVVYdbCUy1JhMm+RNWtvq2vgV4qrlhbASHFDki7A9pW7oG2qfjkuoftO72/9XJnZ22gg3k3bwBIvEwm8LpO7HHooF5SEqKSxiPvmgvTHyl46q8TdxvgYX049hOHCibIpTzYChDqQbomZSM09O0UxMgQPIKZMgQPIe/cJbZCCp6BA1pwmYwTtpxoX1n4TSawZu/vD4JpzoX1n4TTVP3uHJRo5j3rKfVKlSiuxeMXYkSZQmZOY3nHvqM2VCCSlKUkgAwIwEx4ntphpRq64rjj2/3mha5zMwuM2MIS3tHBxHORs3jaOnaKJsjocgpxn/TVwJrJyyqZcRcUJWsJUk5XlZHo39tXZ/VaKZzHy88PqN5O1dFEB7S19mznsJtwIz2QCNcslO6tN1POOZrJp8EXHMvsq2p8xwodwFKilQIUMwc+mNo41yoXaUtYva/C4RGrd6znORzCEtFntSFAHUQYMgKiIxIM440zdnUsAiVcoQNpvDAdZq1ntAAuLF5G7aDvTu6K3ty0oSgoQSEqC21XpBIIUQcM8IiqANM7PyPLemoNpueMXyyJ1WxDy36u+Ezs+jhADlodv4iGzyUkCSDKTMbzQFvdLZuOpC8LyVc3k5Yj7JGRFMTbEuwtD7KBiVJcQkqEgC6ZIIghRnbO4Ust2kW1uA3b6EouAjkBSplSgN3Cut7i1pv69V6VdgNJ+NkQNgEHUBABvkRskm4BFLMhtUqKCEJzN49QG8mgtKWoqxQyhRUoBQcUSm4cDhkcNlGv21C4BaVAyAVAHQAmsta17pX8f9q5S/ZHD+1eRAyB59Eh0dZVNqkMWdoLCb4bEYhMAYACBiBwp3ZGbxxwSBKjw8zlWzCW1mEsq/jwA3kxhWjtoaSChKVFMySFRJ7MQKWJOJx538kQ3WTz6IK0vFairLcNw2CgLXYA4ZK3E5c1UDCfOi7aZu6pNzE3io3sLpAgRsMHqoUNue13CMujfxoReZHn0S65nn0VbPYAgpN9xRAjlKJnCJI76bWX1bvwp8RQWldM2SzI1jyShMhIJWTJOQACZO09ANMbDaGVtrUhJKShKgQuQpJIIIMcQZotbrnbt2dyYNvM7duzuSi1WFtwgrTJHEjjsNds1iQ2ZSIwIzJzM7aZNltRADKyTkL/APajrVo9KE3tUo74Xl3Y1gwkGDbx6IBhIsbePRL7b6tr4FeKqa2XRyXGmioq5gwBAHHZQNtdbCG5bVEKjlZC8rPDHGmehLQFNpSAeSlIJ2TGIG+KvTYDM3y5L0KVEmg5xEiW8iPX1yVXNHNtoVziCADiN4OGFAJaaBkBYI+8PKtPpNbFtgQ42hBGIUlRUSFpJIIBgXZHTFIGdIKLgSX2TlICFAnl3ZByH+7BVezZsSdkzYtEKlx85S8rwTTTQvrPwmlFm57371Xgmm+hfWfhNRrf+Rw5LgZ8/ieZT6pUqUF1pZpqyqUEqCSYwMCcDke40mO6va3xvG3+od8ikOk9JNlRQlF5wGAcAJyiaduiuqk4M/evUoVxTYMT3R6ncg0gNiTzjlQK1S4yT79v9VWceJUQrBQJBG6DEVU+sY/ft/qoUqL6WkNa8QZ4923vFlM12VIDMgfHx3pppF8X1JcTeSMiMFJw+yr5HCsXdHKEXCFSJCSYcjoOBoq3BLbhWYKjzU7BhzlfIUrWsqJJMk5mkqOhxBvc89q6BXLW4HjENh1dxzG2xhccCk4LCkn74IrWy2sJkG6pBzTeHaNx411u1uJwCzG44jsNWNsJzS2eltPlUxgzE+Swdo+cOHiD6C3iUHbbIAoKQoKSrLESDuUNlbs2UxAjrWkeJq31gAoAts/lJx4TRripF5ttojanVIvJ7sRxpyWuGuy662l09IptY5zob3X3m+oW/lC+igc51ofik/yk139inNd/gnkjtVj3Uo+kX0k9FbC02dpwlSRdDaJulQSSMDOKgAIxJFQfSJS06xtqzasxdKwlCibqpSUqHJIIGBjA0IZE++a5g3R4n4uA9XJo9bZF1N1KfZBGPSczWEjeO0VjY9LOLM6uyxgTdCFESJAMCM8KC+j7L1mSlBS04g868LykLk4pK5vJIjkyIIwzwBwnM+X5SkaOc3O4N6pneG8doqXhvHaKJ9LPu2vykVPSz7tr8pFLDNvkljRtruDeqRaWsuvBbW0y41gYUrNWO44RvploZ1WpdDiUI5KAkBc4QmR1GR1UfZ3Cs4NswMyWkADiTW7tobukpbbMQLxaTiczA2CKdobGe1UaNHiZdwHVLEKSTBVdBwJSoBQ4gij7Q2yhIUH3VkkqALpIPKJhQ3CYx2Vh6WfdtflIqeln3bP5SKLHhogHyRbUoNEAu4DqtrXbE3Ecloyk7sOUcBjhUsVvdShCUoEACOSe3A1Vh+8oDVtYn3SMtuyuuacKPtNoSMgQAANlEOnImdwui6rTFOGk5jUNQPVGN2hxxKwtAwGHJIOJE50I+wu6bqRejC8kxOyYob/+qUebK/hQT35Vm39I7SskISkRtWfkmfGupocwfGI/9ob5EgnwUm6TTiJJ97kv0cXVuOfsykX1FcgkhUAXRG6JnoprYlqQ8hIEFRCTI2YCr6M0g40lc3VLWsrUYITJAEAdW+sbG/8At0lWJLiFzt2z/vAVak2jX0hzhFhMRY2iZOwnyC4KzsDW4SZJudl51bcsta9YGTw2d8+VVuVql8YYHC73T51nfritC9Qwq1ixo5kq9XJzmCTO/MVqaC0pYnHQEpVdAxMzjuy66rQnGAHYZzN/RRqj4ZwYiMhb1yVnLLZisoCUXxmMQf1GaA01ZkIDJSkA69vHrNVtOjVtNg8kKSeeJBM7MuO/ZQblqUpLLaySrXtweE5Gup7WCo09pO4zO8jUBbauem4g4XU8JN7RHcdc53iO5egcsiFGVJBJ21PQG/YHfWL+kkoUUkKJG6Kz+uEeyru868wloMFdJcxFegN+wO+p6A37A76F+uEeyru86n1wj2Vd3nQli2Jm5br0Wyc2x3+dJXpbcVdJEExFHuafQCBcWSd0edLH3LyireSaV5EWU6hbaFs4WnY1qBeBBCoBxGIJSds4yIqL0dfEJKHBukA/wqoapS4pzCTFOY98vJaI0cpEw0pM5wk44R14ClOi9LB9wtIQq8kSoCSRBgzhvgddNUvKGSlDoJrCwv2hB5ZZUCeVCLqyNvLTBz3zRGA5phgOco4WBzMi6N6iE+NS40nnKKzuTgnrUflXSlpeSlIP3uWP4hiOsVVyxrAmLw3pN4d2VGIuBPn78Vo1gT5+/FVftJUIwCRkkYD+54mrrH7JPxK8E0LWtraDlnuGYlQMGDiBEEGRlSgzM7PUIAzM7F5prSltLiVKsoDCnLkAnXpTJAdUMruExnjXoKBXotBM3nNuF8xiUk/p7zwgtlsJSEiTG/E0CRqQcRqWGklEIEEiVIEgkGCQDiOFWasLScQhM7zyj2nGtXrIXRdCgkyFAkSJSbwBxGcRQ3pLiee0Y3tm8OzOupheaQax2syJictRifCTsUiBMkd3vxCZ2BoKWlJyxkdU06RoxkZNgdvnXnNHaSbvgpUCRmnJW7I403Z08hUi4sRvjzqQb2fwuEHYRC6KTmkI/wBAb9gd9c+r2pBuCQQQccxjQ31wj2Vd3nW1jt6XFXQCDBOMUzHAH4Tfcqf03WsUbUq2rruqqmB2xWwlEXxgcDkezA/ymqnAGTkP0mPAivO6Ec5Sk78R1Z+PdTdaAQQciIoNqTdK2pIkJVpu0Xwi6ZRj1kGD/vGk59Yx+/b/AFUalMtrSc0KCuo8lXfFBH1jH79v9VCiS6u1x1rleS5wO2EbpT1qurwFCUXpT1qurwFEXRuFRqD43d55rYZKWVKZ3RuFS6NwpIRwJXG2u0zujcKl0bhWhbAllSmOGWFQAcK0IYEuqUzujcKl0bhWhHAllWbcKTKSQeBimN0bhUujcK0LYEP6be9YhKuI5Ku0Z9YrZhptSVhKyMASFDKCMZGBz3baxtY5PXUs2Dbp4IHar+1OHGb3/hEEze/8LN2wAjB9I6J7MqxVorDC1YxG3hieT/s1ypS4hsSYhsRzFlF5MOomRGKs56KVP26VKuNuEAkThsUQftbxRti9Yj4k+IoGyqASskgALcknADlmrMwdkXFs3AzOsHYRsQcbAC3sLB5QXzmFnpAntocIWnFsPp4Khae8z303qUzNKwjCG22SSOBJHkplgN13RbanG7zikNrki6cJGw7Y6KZ2BosrvrwQAeUDKeGI8KV1xSZEHKkbUpmoHFsCdXpPVUDi0WuRlO3fblC9GNOMkgBWf3TA2UdrBvrx4KggoB5JMxnuy3ZVXWO+8V216WLRXCWvjv8AwPUpW6ZXbaoye6BzJO/IImxu3XEnjB6DhXpq8ka9NZHbyEq3jHpyNeXTOpXpHMIB1F1+Dk4I/iEeIpKsQ4yDmH0D+anmm2+SlYzSfH+4pbpMf+QwoZLeaPbn3zVqA/qt7+f55oPEcR5/nmtNKetV1eAomhtKetV1eAomoVPnd3nmVm5n3tUqVKlKmUqVKlZZB2uzEqCkpSTtJJGQN3I45ntqllskKJKEAbCCZ3DuJo+pRlFSpVVGATQ3pfDv/tQSkgIupQnpfDv/ALVPS+Hf/ahKGILS183rqqcGTxWB2JJ+dV9JB5yZHxR8qIdcQG0cjAlRi8dkCZjGmGtCQZO5LqlE61v3f858qHsmlLM7OrCV3c7rkxnuHA9lLCSN61sXrEfEnxFea01YGbS04w46G1FTt034IJWpIN28L4xiDXrrGtBcQA3BvDG+Tt6KT2BplYvraC1FSiFXiMNYVp78a6GWouP+5vJyYWIvt9Fr9HW2kI1bSwpKR7esMkzJJJOOfhTeKAYDTc6toImJg5gZbK19L4d/9qhKYOC0tfNPV40FW7tokRHfWFKUjjJUqVKlZKumnGg3ZSpO4z1H/qk5ozRLt1wccPmPCmYYKdhhyc2tq8hSd4w6cxSBfKTZjtQ+hPUoyO+a9NXmrW0UuoAHJ9IZ8ZT4muuj+633vVn2IKvpT1qurwFc9L4d9d0p61XV4CgQVrWGmmy44RMAgBI9oqOCRUCxz6rmtF5PPgO82XOXQUZ6Xw76npfDvoe22Z9gXnmwlEgFaFX0pnK9gCkccq5QqUn04xa8siD4j35I4jMFNKlcFdpFVSpWFofiAm6VSnAqAN0mJqlltBVzrgOEXVTOGNFFbu5HoNLqZkTWXo6d3fSlI5pKBqUxasyOUSCbqSYmMqw1zXuT+YfKjhtc8/QFJhjM8/QIWi7bglofdJ7VE1Nc17k/mHyrrtqbVEsnAADlnIZbKwiDfn0RAABvz6JXbrTqwOQtV43YSJONI9C2RmyFZbbtH7Qyb+MCcEjEYC9nieJr2lr1SFqTqiYMTfI+VZtrQogBgknIaw+VGIkTz6Joj4Z59EOh7Vocd9hJjipXJQO091DWNm4hKdyQOvb31pbXUurCG/UtKkkGQt2IwO1Kccd9XQgnKq1h2bBS15nviw8BPidsqWu2r2fTnkQq1K19HVu8Kno6t3hXOjBV7O0CMd9bejp3d9csyCBjvreiFQAQsfR07u+p6Ond31tUowjAVzZmHeYu4rccu/5Gh3dHOtmQmYMynHuzqimkI55KleykwBwKvKtmNK3MEow3FSj40wg/OIO6eUdETgJ+Kx3dMk21ogHfjS/SqpDP/wAhrxNb2V7WgqiDMEUJppKgltV1Sgh5taroKjdBxMDE136PhxCCrEtwEyh9KetV1eArT6MBJLyTe1mtbXyecW4CUnIykG/I86wffaeWSh5uT9lR1assrq4oDS+jn0gPNBaXETCkzinaJT20tIOp13NeC3FIkg7ZHhaPPUuSS04wJA2X25L0hUlDDmtbtCEJZcCtYUFJBnk8nNRJwivN2NJDaArMJSD0xSux2t+1qBfdWtCDME8kq2YCAd8+dOq3/wCh8B7ImTmd1rDhc+GxJ2oqw5ogavfJMxXaX69W+pr1b68+VbGEWphJN4pBMRJGMZ1xqyoTzUJGWQ3YChderfU16t9HEtjCYVKX69W+pr1b6ErYwmaOa58KvlXjdOWBpa0rccCSmLkhRumYvJIULpJIFeosbpIck/YV8qR22xLWqUuXRuuJOEHIn711XVTTAHisXZHvRGkGQtpxCiUhSFAqGBAIIkRuzpT9FtHhlLn/AJK7QpSkypU4AJwSBJG89degbsThRjhCYLioSmY50nDPGhrAgJkX1WpWHMAQ2mBBvOkBMTjAmqUqFWqCGC3lxP4SXDb2HvLWfBNLeyVPORkDJJwSBGZJyFLnbTeBQySEnBb2RWNqW9w3q21ppJt1xZD6kwDOqRgid6jms8ThwrgFUc9lJxLLu26h3bTvyGqcxnGXGPz+OfcqtthICQIAwAFE2PndXlWFb2PndXlXLMmUG5hG1KlSirLJ9y6kkJKo2DM1kbUfduZHZuMR86JIoUaPRAHKwjadn/VFFENqkAwRwOdXriUwAN2FdoIJWalM/o8s8tKomZB4ZEdXzpbbLEtpwgcwmR0buqsWwJUi2GymOhHYUU7xPWP+6ckV5myu3VpVuPdtr1FUpm0K1I2XmLQoklLgSsAkQtIV41i0y0jFKFNne04pHcDHdR2mGocn2hPXkaBot0itT+FrjHvbKgWw7eFezoLabrb60Jkm6tpDiZJk5AHOsrPpJLi1NpXYnVo56QXG1pxjlRIFVeeCBKjAkDrJgUg0cbKy66+grl+CrkEweWrOMBgRG8cat+rc+cbWn/iEzRAtO7Xzy8F60tLAk2ZQByLb6VA9F4CsH7OFAAtWxEEGUhKurkqxFdstrIEjFKhJBEpI4iiQwlfqzdV7BPgdvQawq0Xf4YncSOcoi+XIeUAJemytpUFf+btkFlSgcAMYPCcIoj9nutP/ANZXnXFLUDBKgRskiqP2soSVFSoAkwSaXtdHP+Gfu/CWZ1Dz6rG0aRYQtDahab7nMTqIKoKUmMdhUJ3TRgRus7/4lNoH6ia8rpf0Z59h9x15K2FcgAkJJUtLeMicVQMCJp1ZLch0kJMlMTIg4zGfQeyt2lEX7Pi4omwy8kzbdcTN1lluRBvvFZj4UJ+dVLi/fhHBloA/xrJPdQ9St+rj5GNHhPNLidGfpyhRbbZMqSpxXtOrLnYk8kdlXddKhBOAyGQHQBgKpVVrABJIAGZOAFRq6RUqj43E8uGXklR2lzLy+n5UHWmlLYgrcWFJUkKzSbw2ez00tTpdqUi8QVEJTIIknZ3UrwcR7yqPBxHvR1WQsjKq1KRItNerfU16t9Z1KyMlaa9W+pr1b6zqVlpK016t9TXq31nUrLSVo06UqChmKfNuIeTiJ3jaD/u2pUp2G8J6RvCAc0UJ5Kx0Kz/3qpqwCEgKzAANdqVRoAyVmtAuEFppqUBXsnuP+ikdSpU6nzKNX5lKk1KlIpqVKlSssi02sKEOAqGxQ5w69vQa56Og5Op/ElQPcDXalMXXg3TYpN7qejJ96j+b+mp6In3qOxX9NSpRts5o22c+q56In3qOxX9NT0RPvUdiv6alShbZz6rW2c+qnoifeo7Ff01hb9EtvNqaW6kpWIUBeEjaJAwnKpUo22c+qMjZz6oaz/RmzMIcbsrmpQtV4cpaiDgDF6c430axYQkRrwrioqJ/TXKlMYNyETBuQtPRE+9R2K/pq6dHkglK0KjYDiegRXKlZjWuMRzRY1rjEc1RVlAJBcQIH3s92WdUSwOT+0RjnnhwOFSpSkAFJaclA0kYlYzghIMxvE4V116RdTgiZAwnrO2uVKWdSUnUsalSpQQX/9k="
            	        	style="width:100%;height:300px; display:block; margin: auto;"/>
                	    <div id="route_miniContent">간단한설명</div>
	                </div>
    	        </div>
        	    <div id="route_miniFooter">
            	    <div id="route_miniFooterLeft" style="display: inline;" style="background-color:black ;">
                	    <span><img id="route_myLike" src="https://media.istockphoto.com/vectors/red-heart-design-icon-flat-valentines-day-sign-emblem-isolated-on-vector-id1131944419?b=1&k=20&m=1131944419&s=170x170&h=X3hjbz0XmLxyxWtuSMY9rXqlI89mqk1gSvgHHOtVuYA=" style="width: 15px; height:15px;"/></span>
                    	<span id="route_likes">3</span>
	                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTn6Horz4J02Of5NG7sPD2ieM6kG0ywqEJI1w&usqp=CAU" style="width:15px; height:15px;">
    	                <span id="route_Replies">4</span>
        	        </div>
            	    <div id="route_miniFooterRight"style="display: inline-block; float:right">
                	    <span>조회</span>
                    	<span id="route_myViews">3</span>
	                </div>
    	        </div>
        	</div>
    	</div>
	</main>
	

	<script>
		$(function(){
			var part_ul = $("#part_ul");
			var specific_ul = $("#specific_ul");
			
			var area_values = [];
			var parts = [];
			
			/* 지역 검색창 열기 */
			$('#area_text').click(function(){
				$('#select_area').show();
				
				//도시 번호
				area_values[0] = '11';
				parts = [];
				
				for(var i in hangjungdong.sigugun){
					if(hangjungdong.sigugun[i].sido==area_values[0]){
						parts.push(hangjungdong.sigugun[i]);
					}
				}
				
				$("#part_ul li").remove();
				$("#specific_ul li").remove();
				for(var i in parts){
					part_ul.append("<li><a>"+Object.values(parts[i])[2]+"</a></li>");
				}
			});
			
			$(document).on("click",".area_ul li", function(){
				//도시 번호
				area_values[0] = $(this).val();	
				parts = [];
				
				for(var i in hangjungdong.sigugun){
					if(hangjungdong.sigugun[i].sido==area_values[0]){
						parts.push(hangjungdong.sigugun[i]);
					}
				}
				console.log(parts);
				
				$("#part_ul li").remove();
				$("#specific_ul li").remove();
				for(var i in parts){
					part_ul.append("<li><a>"+Object.values(parts[i])[2]+"</a></li>");
				}
			});
			
			var specific = [];
			$(document).on("click",".part_ul li", function(){
				var index = $(".part_ul li").index(this);
				area_values[1] = Object.values(parts[index])[1];
				
				specific = [];
				for(var i in hangjungdong.dong){
					if(hangjungdong.dong[i].sigugun==area_values[1]){
						specific.push(hangjungdong.dong[i]);
						console.log(hangjungdong.dong[i]);
					}
				}
				
				$("#specific_ul li").remove();
				for(var i in specific){
					specific_ul.append("<li><a>"+Object.values(specific[i])[3]+"</a></li>");
				}
				
			});
			
		});
	</script>
	
 	<script>
  	$(function(){
  		jQuery(document).ready(function(){
  		  //sido option 추가
  		  jQuery.each(hangjungdong.sido, function(idx, code){
  		    //append를 이용하여 option 하위에 붙여넣음
  		    jQuery('#sido').append(fn_option(code.sido, code.codeNm));
  		  });

  		  //sido 변경시 시군구 option 추가
  		  jQuery('#sido').change(function(){
  		    jQuery('#sigugun').show();
  		    jQuery('#sigugun').empty();
  		    jQuery('#sigugun').append(fn_option('','선택')); //
  		    jQuery.each(hangjungdong.sigugun, function(idx, code){
  		      if(jQuery('#sido > option:selected').val() == code.sido)
  		        jQuery('#sigugun').append(fn_option(code.sigugun, code.codeNm));
  		    });

  		    //세종특별자치시 예외처리
  		    //옵션값을 읽어 비교
  		    if(jQuery('#sido option:selected').val() == '36'){
  		      jQuery('#sigugun').hide();
  		      //index를 이용해서 selected 속성(attr)추가
  		      //기본 선택 옵션이 최상위로 index 0을 가짐
  		      jQuery('#sigugun option:eq(1)').attr('selected', 'selected');
  		      //trigger를 이용해 change 실행
  		      jQuery('#sigugun').trigger('change');
  		    }
  		  });

  		  //시군구 변경시 행정동 옵션추가
  		  jQuery('#sigugun').change(function(){
  		    //option 제거
  		    jQuery('#dong').empty();
  		    jQuery.each(hangjungdong.dong, function(idx, code){
  		      if(jQuery('#sido > option:selected').val() == code.sido && jQuery('#sigugun > option:selected').val() == code.sigugun)
  		        jQuery('#dong').append(fn_option(code.dong, code.codeNm));
  		    });
  		    //option의 맨앞에 추가
  		    jQuery('#dong').prepend(fn_option('','선택'));
  		    //option중 선택을 기본으로 선택
  		    jQuery('#dong option:eq("")').attr('selected', 'selected');

  		  });

  		  jQuery('#dong').change(function(){
  		    var sido = jQuery('#sido option:selected').val();
  		    var sigugun = jQuery('#sigugun option:selected').val();
  		    var dong = jQuery('#dong option:selected').val();
  		    var dongCode = sido + sigugun + dong + '00';

  		    //동네예보 URL
  		    var url = 'https://www.weather.go.kr/weather/process/timeseries-dfs-body-ajax.jsp?myPointCode=' + dongCode + '&unit=K';

  		    //iframe으로 결과 보기
  		    fn_iframe(url);
  		  });
  		});

  		function fn_option(code, name){
  		  return '<option value="' + code +'">' + name +'</option>';
  		}
  		function fn_iframe(url){
  		  jQuery('#iframe').attr('src', url);
  		}
  	});
  </script>
	
</body>
</html>