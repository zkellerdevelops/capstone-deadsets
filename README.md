<h1>Deadsets</h1>
NSS Ruby on Rails capstone project - NSS Cohort 2.

<h2>Purpose</h2>
Deadsets is a Ruby on Rails app which allows users to search for Grateful Dead concert setlists. If a user is signed in, they can save a concert to a list of favorites. It is my final project for Nashville Software School.

The goal is to provide a responsive, nice-looking app which will allow fans of Grateful Dead to research setlists and hopefully, spark conversation about Grateful Dead concerts with fellow fans of the band.

I often find myself looking up Grateful Dead setlists because iTunes and Google Play Music have a habit of randomly re-ordering my live shows. A typical dead show is 3 hours, split across 3 cd's. (Apparently, deadheads still use cd's.) I've found that different music players read metadata differently, and going back and forth between apps for years on different computers and operating systems has made files' metadata pretty glitchy. Listening to a dead show out of order is possibly one of my least favorite things. I figured an app like this would make it easy for me to check a setlist, should the need arise, and change my setlist order as necessary.

<h2>Project Status</h2>
These features are implemented and working:
- Setlist data scraped from http://www.cs.cmu.edu/~mleone/gdead/setlists.html
- Setlist search functionality implemented
- Devise user sign in/registration/sign out implemented
- Responsive CSS styling implemented
- Add concert to favorites for signed in user implemented
- Access favorites for signed in user
- Delete favorites for signed in user
- Heroku app working properly, concert database scraped
- Favorite concerts toggle corresponding concert's setlist on click

<h2>To-do</h2>
These features still need to be implemented:
- Fix styling on add favorites and password reset buttons

These features are planned for the very near future:
- Replace delete button/styling changes for all links on app
- Re-work homepage styling to better appear as a homepage/landing page
- Deploy app on private server/get better url

<h2>Features</h2>
- <strong>Search for a concert</strong> - A concert date is entered, and the corresponding setlist data is populated on the page.
- <strong>Add concert to favorites</strong> - Once a concert setlist has been returned on page, if the user is signed in, they can save the corresponding concert date to a list of favorites for easy retrieval at a later date by clicking the "create favorite" button.

<h2>Demo</h2>
http://capstone-deadsets.herokuapp.com/

<h2>Known Bugs</h2>
- Button CSS being stripped on iOS browsers

<h2>About the data</h2>
Setlist data was scraped from http://www.cs.cmu.edu/~mleone/gdead/setlists.html
This site is no longer maintained. The following is quoted from the cmu.edu site:
"Most of these setlists were extracted from a database that was created by Jerry Stratton (jerry@teetot.acusd.edu) and others. It's available by ftp from gdead.berkeley.edu.(Other credits are listed where applicable)."

<h2>Author</h2>
Zach Keller

<h2>License</h2>
Copyright &copy; 2013 Zach Keller

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
