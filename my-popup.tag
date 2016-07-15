<my-popup>
  <h1>{opts.properties.name}</h1> <span>{opts.properties["撮影日"]} 撮影</span>
  <iframe width="420" height="315" src="{src}" frameborder="0" allowfullscreen></iframe>
  <code>{opts.geometry.coordinates}</code>
  <script>
    function getYoutubeEmbed(html) {
      var div = document.createElement("div");
      div.innerHTML = html;
      var href = div.querySelector("a").href;
      if (href.indexOf("https://youtu.be/") == 0)
        return href.replace("https://youtu.be/", "https://www.youtube.com/embed/");
      else if (href.indexOf("https://www.youtube.com/watch?v=") == 0)
        return href.replace("https://www.youtube.com/watch?v=", "https://www.youtube.com/embed/") + '?autoplay=1';
      return null;
    }
    this.src = getYoutubeEmbed(this.opts.properties["動画"]);
  </script>
  <style scoped>
    :scope {
      display: block;
    }

    h1 {
      font-size: 10pt;
      margin: 0;
      padding: 0;
    }
  </style>
</my-popup>
