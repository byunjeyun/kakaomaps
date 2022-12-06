<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
 @license
 Copyright 2019 Google LLC. All Rights Reserved.
 SPDX-License-Identifier: Apache-2.0
-->
<html>
  <head>
    <!-- <script type="module">import angle from './index.ts';
    // alert(imp.print());
   
    </script> -->
    <meta charset="UTF-8">
    <title>Geocoding Service</title>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>

    <link rel="stylesheet" type="text/css" href="./style.css" />
    <!-- <link rel="stylesheet" type="text/css" href="./result.css" /> -->
    <script type="module" src="./index.ts"></script>
    <script type="module" src="./result.ts"></script>

  </head>
  <body>
  <div id="result" style="float: left; width: 20%; background-color:#fff;">
  <h2>Test Result <br></h2>
  <h3><script type="text/javascript">"&{angle.angle_ne};"</script></h3>

  <form action="/">
    <!-- <label for="fname">First name:</label><br> -->
    <input type="text" id="fname" name="address" value=""><br> 

    <input type="submit" value="Submit">
  </form> 


  <!-- <iframe src="http://localhost:3000/address" ></iframe> -->

  </div>

    <!-- map 출력 -->
    <div style="float: left; width: 79%;" id="map"></div>

    <!-- 
     The `defer` attribute causes the callback to execute after the full HTML
     document has been parsed. For non-blocking uses, avoiding race conditions,
     and consistent behavior across browsers, consider loading using Promises
     with https://www.npmjs.com/package/@googlemaps/js-api-loader.
    -->
    <script
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAd5KqC4ADvVIucEkwj5Yto_xInGAYAh8M&callback=initMap&libraries=drawing&v=weekly"
    defer
  ></script>
    
  </body>
</html>