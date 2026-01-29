from bs4 import BeautifulSoup

html_str = """
<html>
  <head>
    <title>안녕하세요</title>
  </head>
  <body>
    <div id="container">
      <p class='p1'>hello</p>
      <p>Bye</p>
    </div>
  </body>
</html>"""

soup = BeautifulSoup(html_str, "html.parser")
print(soup)

selected_p = soup.select("p")
print(selected_p)

selected_id = soup.select_one("#container")
print(selected_id)
