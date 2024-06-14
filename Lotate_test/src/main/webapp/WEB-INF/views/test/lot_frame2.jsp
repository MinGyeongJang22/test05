<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Rotate Animation</title>
	    <link rel="stylesheet" href="styles.css">
		
		<style>
		body {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    height: 100vh;
	    margin: 0;
	    background-color: #f0f0f0;
		}
	
	.rotate-box {
	    width: 100px;
	    height: 100px;
	    background-color: #3498db;
	    animation: rotate 2s linear infinite;
	}
	
	@keyframes rotate {
	    from {
	        transform: rotate(0deg);
	    }
	    to {
	        transform: rotate(360deg);
	    }
	}
		</style>    
	    
	</head>
	
	<body>
	
		<div id="container" style="border: 1px solid;">
		
<!-- 	    <div class="rotate-box"></div> -->
		
		</div>
	
	</body>
</html>