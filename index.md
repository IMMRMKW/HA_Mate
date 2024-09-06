---
layout: default
title: Home Automation Mate landing page
---

# Home Automation Mate
This is the landing page for the Home Automation Mate; your friend when it comes to automating a variety of things in your house. Quickly check out the projects in the bar on the left to see the possibilities or be creative, and think of your own!

{% image_tag ./assets/images/HA_Mate/image_list.json,ha-mate.png, HA Mate, 25, 90 %}

## Interested?
You can contact me via the following form for more information or to order the board.
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Form</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .container {
            display: flex;
            justify-content: center;
            width: 100%;
        }
        #contact-form {
            display: flex;
            flex-direction: column;
            width: 300px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            margin-bottom: 5px;
        }
        input, textarea {
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js"></script>
    <script type="text/javascript">
        (function() {
            emailjs.init("YOUR_PUBLIC_KEY");
        })();
    </script>
</head>
<body>
    <div class="container">
        <form id="contact-form">
            <label for="name">Name:</label>
            <input type="text" id="name" name="user_name" required>
            <label for="email">Email:</label>
            <input type="email" id="email" name="user_email" required>
            <label for="message">Message:</label>
            <textarea id="message" name="message" required></textarea>
            <input type="submit" value="Send">
        </form>
    </div>

    <script type="text/javascript">
        window.onload = function() {
            document.getElementById('contact-form').addEventListener('submit', function(event) {
                event.preventDefault();
                emailjs.sendForm('YOUR_SERVICE_ID', 'YOUR_TEMPLATE_ID', this)
                    .then(function() {
                        alert('SUCCESS!');
                    }, function(error) {
                        alert('FAILED...', error);
                    });
            });
        }
    </script>
</body>
</html>



