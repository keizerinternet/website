+++
date = "2017-03-14T09:07:56-07:00"
title = "contact"

+++

# Contact Us

<div id="status"></div>
<!-- <form name="contact-form"> -->
<div id="form">
<br/>
<label for="name">Name</label>
<input type="text" name="name" placeholder="John Appleseed" maxlength="75">

<br/>
<label for="email">Email</label>
<input type="email" name="email" placeholder="email@example.com" maxlength="150" required="true" autocomplete="false">

<br/>
<label for="request-response">Response Requested</label>
<input type="checkbox" name="request-response" value="requst-response">

<br/>
<label for="message">Message</label>
<textarea id="message" name"message" placeholder="Hi 👋"  maxlength="7500" cols="30" rows="7"></textarea>

<br/>
<input type="button" value="Send" onclick="submit()">
</div>
<!-- </form> -->


<script>
function submit() {
console.log("submitform");
  var nameElement            = document.getElementsByName("name")[0];
  var emailElement           = document.getElementsByName("email")[0];
  var requestResponseElement = document.getElementsByName("request-response")[0];
  var messageElement         = document.getElementById("message");

  var name            = nameElement.value
  var email           = emailElement.value
  var requestResponse = requestResponseElement.checked;
  var message         = messageElement.value;

  if (typeof email === "undefined" || email.length < 1) {
    alert("Email address is required");
    return;
  }
  var emailValidation = /.+@.+\..+/;
  var valid = emailValidation.exec(email);
  if (!valid) {
    alert("Whoops! Looks like your email might not be valid. Perhaps a typo?");
    return;
  }
  if (typeof message === "undefined" || message.length < 1) {
    alert("Some kind of message is required. 😊");
    return;
  }

  // POST it
  var xhr = new XMLHttpRequest();
  xhr.open("POST", '----', true);

  // Set our headers
  xhr.setRequestHeader("Content-Type", "application/json");

  xhr.onreadystatechange = function() {
    if (xhr.readyState == XMLHttpRequest.DONE) {
      var statusDiv = document.getElementById("status");
      statusDiv.style.borderWidth = "thick";
      if (xhr.status == 200) {
        statusDiv.innerText = "Thanks for contacting us!";
        statusDiv.style.borderColor = "green";
        // Reset form values
        nameElement.value = "";
        emailElement.values = "";
        requestResponseElement.checked = false;
        messageElement.value = "";
      } else {
        statusDiv.innerText = "Whoops. Something went wrong.\nPlease contact `danielmiedema@me.com` so he can try to fix it.\n\nAlso, feel free to send your message there too, he'll make sure its recorded";
        statusDiv.style.borderColor = "red";
      }
    }
  }
  var json = {
    "name": name,
    "email": email,
    "response_requested": requestResponse,
    "message": message
  };
  console.log("JSON: " + json);
  xhr.send(JSON.stringify(json));
}
</script>
