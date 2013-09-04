The Creation Engine Blog
========================

A static site pushed to https://github.com/jimpurbrick/jimpurbrick.github.com

Setup
-----

1. virtualenv venv
2. source venv/bin/activate
3. pip install -r requirements.txt
4. git clone https://github.com/jimpurbrick/jimpurbrick.github.com.git output
5. git clone https://github.com/jimpurbrick/pelican-themes.git themes

Editing
-------

1. Edit blog posts in the content directory
2. make publish
3. cd output; git commit -am "update"; git push