<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.List,java.util.List,java.io.*,java.util.*,com.hsbc.dao.AssetDao, com.hsbc.models.Asset"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assets Check</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
  /* Split the screen in half */
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}
footer {
  background-color: #e9e9e9;
  text-align: center;
  color: black;
  z-index: 22;
  left: 0;
  width: 100%;
  height: 7%;
  bottom: 0;
  position: fixed;
}
.split {
  height: 100%;
  width: 50%;
  position: absolute;
  z-index: 1;
  top: 5;
  overflow-x: hidden;
  padding-top: 20px;
}

/* Control the left side */
.left {
  left: 0;
  background-color: black;/*#e9eeed*/
  background-image: url("spacedot.gif");
  background-repeat: no-repeat;
  background-size: 100% 100%;
  color: white;
  position: fixed;
}

/* Control the right side */
.right {
  right: 0;
  background-color: #f4f3f3;

}

/* If you want the content centered horizontally and vertically */
.centered {
  position: relative;
  top: 25%;
  left: 35%;
  transform: translate(5%, -50%);
  text-align: left;
}

/* Style the image inside the centered container, if needed */
.centered img {
  width: 150px;
  border-radius: 65%;
}
td {
padding-left: 80px; 
padding-top: 5px;
padding-bottom: 5px;
padding-right: 60px;
}
ol {
  padding-left: 120px;
}

.topnav {
  overflow: hidden;
  background-color: #e9e9e9;
    z-index: 100;
  width:100%;
  position: fixed;
}

.topnav a {
  float: left;
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #000000;
  color: white;
}

.topnav .search-container {
  float: right;
}

.topnav input[type=text] {
  padding: 6px;
  margin-top: 8px;
  font-size: 17px;
  border: none;
}

.topnav .search-container button {
  float: right;
  padding: 6px 10px;
  margin-top: 8px;
  margin-right: 16px;
  background: #ddd;
  font-size: 17px;
  border: none;
  cursor: pointer;
}

.topnav .search-container button:hover {
  background: #ccc;
}

@media screen and (max-width: 200px) {
  .topnav .search-container {
    float: none;
  }
  .topnav a, .topnav input[type=text], .topnav .search-container button {
    float: none;
    display: block;
    text-align: left;
    width: 100%;
    margin: 0;
    padding: 14px;
  }
  .topnav input[type=text] {
    border: 1px solid #ccc;  
  }
  
</style>
</head>
<body>
<script>

</script>
<div class="topnav">
  <a href="UserHomepage.html">Home</a>
  <a class="active" href="">Assets</a>
  <a href="userReturn.html">Return</a>
  <a href="userMessage.html">Messages</a>
  <div class="search-container">
    <form action=""><!--
      <input type="text" placeholder="Search.." name="search">
      <input type="submit" name="Search" value="Submit">-->
      <a href="">Logout</a>
    </form>
  </div>
</div>
<div class="split left">
  <div class="centered">
    <img src="face.png" alt="USER" style="left: 40%;">
  </div>
  <br><br><br><br><br>
  <table class="left" align="left">
    <tr>
      <td><ul><li>User Name</li></ul></td>
      <td>:</td>
      <td>--</td>
    </tr>
    <tr>
      <td><ul><li>Employee ID</li></ul></td>
      <td>:</td>
      <td>--</td>
    </tr>
    <tr>
      <td><ul><li>Name</li></ul></td>
      <td>:</td>
      <td>--</td>
    </tr>
    <tr>
      <td><ul><li>Telephone</li></ul></td>
      <td>:</td>
      <td>--</td>
    </tr>
  <tr>
      <td><ul><li>Email</li></ul></td>
      <td>:</td>
      <td>--</td>
    </tr>
         
    </table>
</div>

<div class="split right">
  <br><br><br><br><br>
    <h2 style="text-shadow: 4px 4px 2px #A0A0A0" align="center">Assets Available</h2><br>
    <p align="center">You can choose from the variety of assests available <br>exclusively for your comfort at a single click..</p><hr><br>
<%
// AssetDao dao=new AssetDao();
int userid = (Integer)session.getAttribute("userid");
// ArrayList<Asset> assetList= (ArrayList<Asset>)dao.getLendableAssets(userid);
ArrayList<Asset> assetList= (ArrayList<Asset>) session.getAttribute("assetsAvailable");
pageContext.setAttribute("asset",assetList);
System.out.println(assetList);
System.out.println(assetList);
%>



<table border=5>
		<tr>
			<th>Asset ID</th>
			<th>Category</th>
			<th>Sub-Category</th>
			<th>Feature Description</th>
			<th>Date Added</th>
			<th>Available</th>
			<th>Borrow</th>
		</tr>
		<c:forEach var="a" items="${asset}">
		<tr>
				<td>${a.assetId}</td>
				<td>${a.category}</td>
				<td>${a.subcategory}</td>
				<td>${a.featureDescription}</td>
				<td>${a.dateAdded}</td>
				<td>${a.isAvailable}</td>	
				<td><a href="BorrowAsset?action=BORROW & assetIdToBorrow=${a.assetId}">Borrow</a></td> 
		</tr>
		</c:forEach>
		</table>
		<hr>
</div>
<footer>
        <p><b>Copyright</b></p>
</footer>
</body>
</html>