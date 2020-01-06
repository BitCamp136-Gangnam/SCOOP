<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- <head>
   <meta charset="UTF-8">
   <meta name="google-signin-client_id" 
        content="47797892299-i06tt9qhbs15g8mn89ncu1isa1eneql8.apps.googleusercontent.com">
   <title>Insert title here</title><script src="https://apis.google.com/js/platform.js" async defer></script>
   <script type="text/javascript">
      /* 클라이언트id : 47797892299-i06tt9qhbs15g8mn89ncu1isa1eneql8.apps.googleusercontent.com */
      /* 클라이언트pwd : JICBHFg-3JA4UmXz6HIhyUUN */
   
      function onSignIn(googleUser){
         let profile = googleUser.getBasicProfile();
         $("#id").html(profile.getId());
          $("#name").html(profile.getName());
          $("#email").html(profile.getEmail());
          $("#image_url").attr('src', profile.getImageUrl());
      }
      
      function signOut(){
         let auth2 = gapi.auth2.getAuthInstance();
         auth2.signOut().then(function(){
            console.log('User signed out.');
         });
      }
   </script>
</head>

<body>
   <div class="g-signin2" data-onSignIn></div>
   <div>
      id : <span id="id" /><br/>
      name : <span id="name" /><br/>
      email : <span id="email" /><br/>
      image_url<br/>
      <img id="image_url" src="#"/>
   </div>
   <div>
      <a href="#" onclick="signOut();">Sign out</a>
   </div>

</body> -->
<head>
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="47797892299-i06tt9qhbs15g8mn89ncu1isa1eneql8.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
  </head>
  <body>
    <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
    <script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
      }
    </script>
  </body>
</html>