# CS 1XA3 Project03 - <hez66@mcmaster.ca>

## Usage
* Install conda enivornment with command: 
    * conda activate djangoenv           

* Run on mac1xa3.ca with commands:
    1. python manage.py collectstatic
    1. python manage.py runserver localhost:10042

* Go to https://mac1xa3.ca/e/hez66/ , you can:
    1. log in by clicking the Login button, and then enter username and password and click *Login*. (cancel by clicking cancel or anywhere else)
    2. register by clicking the Create An Account button, then enter an unexisted username and the password twice, then click *creat* button.

* Log in with test users as follow:
    username | password
    -------- | --------
    gina | jimmy936
    suky | jimmy936
    sam | jimmy936
    sufjan | jimmy936
    jojo | jimmy936

* After you login, you can:
    * **log out** by clicking the top right *Logout* button on the Navbar
    * go to **People Page** (URL https://mac1xa3.ca/e/hez66/social/people/) by clicking the *people icon* button next to the Logout button, where you can send or deal with Friend Request.
    * go to **Messages Page** (URL https://mac1xa3.ca/e/hez66/social/messages/) by clicking the *message icon* button next to the people icon button, where you can submit or like posts.
    * go to **Account Setting Page** (URL https://mac1xa3.ca/e/hez66/social/account/) by clicking the top right icon on Navbar, where you can change password and update your info.

## Objective 01
Description:
- the URL https://mac1xa3.ca/e/hez66/ will route to the login ( and signup ) page
- this feature is displayed in **login/templates/signup.djhtml** which is rendered by **signup_view**
- URL https://mac1xa3.ca/e/hez66/signup direct to a signup page including a user creation form to give a standard signup form
- After logging the user in, redirect to the **Messages page**
- After creating new user, login and redirect to the **Messages Page**

Exceptions:
- If the username has already existed, or the password doesn't qualify the requirement, the page will tell you how to correct as a solid page.
 
## Objective 02
Description:
- this feature is displayed in **social/templates/social_base.djhtml**, showing a Profile(username, employment, location and birthday) and Interests
- renders the left_column used by **social/templates/messages.djhtml**, **social/templates/people.djhtml** and **social/templates/account.djhtml**
- **messages.djhtml**, **people.djhtml** and **account.djhtml** mentioned above are rendered in **social/views.py** (**messages_view**, **people_view** and **account_view** respectively)

## Objective 03
Description:
- this feature is displayed in **social/templates/account.djhtml**
- click the top right icon on the Navbar, goes to the **Account Setting Page** (URL https://mac1xa3.ca/e/hez66/social/account/)rendered by the template **social/templates/account.djhtml** and function **account_view** in **social/views.py**
- forms for changing password are provided, you need to input your current password once and new password twice and then click the *change* button to change password (instructions are given in forms)
- if password changed successfully, redirect to the login page
- forms for updating user infos (ie. update employment, location,birthday and add interests ) are provided, enter infos you need to update and click the *update* button (left blank if you have nothing to update)

Exceptions:
- if the current user is not authenticated, redirect to login page
- If you enter incorrect old password or unqualified new password when changing password, the form will tell you how to correct.

## Objective 04
Description:
- click the *people icon* on the Navbar, goes to the **People Page** (URL https://mac1xa3.ca/e/hez66/social/people/) rendered by the template **social/templates/people.djhtml**, function **people_view** in **social/views.py** and javascript **social/static/people.js**
- the middle column displays a actual user who is not your friend and a *More* button
- Each time you click the *More* button, one more not-your-friend person is displayed
- the amount of people displayed resets when the user logs out
- the more button is linked to send an AJAX POST through javascript **social/static/people.js** to function **more_ppl_view** in **social/views.py**, and then reload the page on success

Exceptions:
- if the current user is not authenticated, redirect to login page
- alert ''failed to request more ppl'' if javascript **social/static/people.js** fails to send an AJAX POST.

## Objective 05
Description:
- this feature is also displayed on the **People Page** as **Objective 04**
- you can click the *Friend Request* buttons of people displayed in the middle column to send Friend Requests
- All *Friend Request* buttons are linked to a JQuery event in **social/static/people.js**, sending its id which contains the user who receive the friend request, and then reload the page on success

Exceptions:
- if the current user is not authenticated, redirect to login page
- alert ''failed to create friend request'' if javascript **social/static/people.js** fails to send an AJAX POST.

## Objective 06
Description:
- this feature is displayed in **Objective 05**
- you can accept/decline FrendRequest by clicking *Accept* or *Decline* button
- **social/static/people.js** sends a POST to **accept_decline_view** in **social/views.py** with button id containing decision and username of the user who sent the Friend Request, and then reload the page on success
- if you accept, it updates both users' friends relation and delete the corresponding FriendRequest entry
- if you decline, the corresponding FriendRequest entry

Exceptions:
- if the current user is not authenticated, redirect to login page
- alert ''failed to decide'' if javascript **social/static/people.js** fails to send an AJAX POST.

## Objective 07
Description:
- click the *message icon* on the Navbar, goes to the **Messages Page** (URL https://mac1xa3.ca/e/hez66/social/messages/) rendered by the template **social/templates/messages.djhtml**, function **messages_view** in **social/views.py** and javascript **social/static/messages.js**
- the right column shows a list of current user's all friend(s)

Exceptions:
- if the current user is not authenticated, redirect to login page

## Objective 08
Description:
- this feature is also displayed on the **Messages Page** as **Objective 07**
- the top of the middle column contains a text field and a button, input your post in the text field and then click *Post* button. Your post will be submitted.
- when *Post* button is clicked, **social/static/messages.js** submits a AJAX POST request, sending the contents in the text field to **post_submit_view** in **social/views.py**, and then reload the page on success

Exceptions:
- if the current user is not authenticated, redirect to login page
- alert ''failed to submit post'' if javascript **social/static/messages.js** fails to send an AJAX POST.

## Objective 09
Description:
- this feature is displayed on the **Messages Page** under the submit post part (**Objective 08**)in the middle column
- **social/templates/messages.djhtml** show a most recent post and a *More* button
- Each time you click the *More* button, one more post is displayed, which is the next newest one
- the amount of posts displayed resets when the user logs out
- the *More* button is linked to send an AJAX POST through javascript **social/static/messages.js** to function **more_post_view** in **social/views.py**, and then reload the page on success

Exceptions:
- if the current user is not authenticated, redirect to login page
- alert ''failed to request more posts'' if javascript **social/static/messages.js** fails to send an AJAX POST.

## Objective 10
Description:
- this feature is displayed in **Objective 09**
- Each post in the list of posts has a *Like* button and display a Like Count (how many users liked this post)
- Each user can only like a post once. Once a user liked a post, the *Like* button of that post is disabled
- if a *Like* button is clicked, **social/static/messages.js** submits a AJAX POST request, sending the button id containing id of the post to function **like_view** in **social/views.py**, and then reload the page on success

Exceptions:
- if the current user is not authenticated, redirect to login page
- alert ''failed to like post'' if javascript **social/static/messages.js** fails to send an AJAX POST.

## Objective 11
username | password
-------- | --------
gina | jimmy936
suky | jimmy936
sam | jimmy936
sufjan | jimmy936
jojo | jimmy936
