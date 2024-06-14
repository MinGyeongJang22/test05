<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="UTF-8">
	  <!--   <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
	    <title>Animation</title>
	    <link rel="stylesheet" href="resources/css/cloud.css">
		
		<style>
			#container{
					margin: 50px auto;
					width: 1200px;
					height: 600px;
					background-color: #34bdc7;
					box-shadow: 10px 5px 0 #aac288; 
					/* transform: rotate(160deg); 회전 */
					transform: skewX(-15deg); /*x축 방향으로 30도만큼 기울임*/
		/*			transform: skewY(-20deg); y축 방향으로 -20도만큼 기울이*/
			}
			
			#c1{ margin: 50px
				}
			#c2{ margin: 100px
				}
			
			.cloud{
					width: 200px;
					height: 120px;
					position: relative;
					}
			
			.cloud1{background-color: white;
					width: 50px;
					height: 50px;
					border-radius: 40px;
					position: absolute;
					}
			
			#cl_1{	left: 90px;
					top: 10px;
					}

			#cl_2{	left: 50px;
					top: 10px;
					}
					
			.cloud2{background-color: white;
					width: 150px;
					height: 60px;
					position: absolute;
					left: 20px;
					bottom: 30px;
					border-radius: 30px;
					box-shadow: 5px 3px 0 #aac288;
					}
			
		</style>    
	    
	</head>
	
	<body>
		<div class="component">
		<div id="container" >
			<div class="cloud" id="c_1">
				<div class="cloud1" id="cl_1"></div>
				<div class="cloud1" id="cl_2"></div>
				<div class="cloud2" id="cl_3"></div>
			</div>
			
			<div class="cloud" id="c_2">
				<div class="cloud1" id="cl_1"></div>
				<div class="cloud1" id="cl_2"></div>
				<div class="cloud2" id="cl_3"></div>
			</div>
		
		</div>
	
		</div>
	</body>
</html>