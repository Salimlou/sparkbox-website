<!doctype html>

<html>
<head>
  <title>Sparkbox Blog</title>
  <meta name="description" content="">
  <link rel="stylesheet" href="content-style.css" media="screen">
</head>

<body>
  <header>
    <!--Main navigation would be included here.-->
    <?php include("navigation.php") ?>
  </header>
  <h1>Foundry Blog</h1>
  <h2>We Really Like To Share</h2>
  <section class="listing blog">
    <article class="featured post">
     <h2>Featured Article</a></h2>
     <a href="foundry-blog-detail.php"><img src="" alt="Featured Image" /></a>
     <h1><a href="foundry-blog-detail.php">Slanted Elements With CSS3</a></h1>
     <h2><time datetime="2013-04-22">4-22-13</time> | Posted by <a href="#">Adam Simpson</a></h2>
     <p>Adam walks through some unique challenges of slanted elements, especially those with anchor target areas, and some CSS3 magic to solve them.</p>
   </article>

   <article class="post">
    <h1><a href="foundry-blog-detail.php">The Programmer&rsquo;s Notebook</a></h1>
    <h2><time datetime="2013-04-15">4-15-13</time> | Posted by <a href="#">Jeremy Mack</a></h2>
    <p>Jeremy shares a bit of his finely-tuned personal workflow and methods for efficiently maintaining bookmarks, notes, and more.</p>
  </article>

  <article class="post">
    <h1><a href="foundry-blog-detail.php">Ben and Jeremy Recently Featured on Leading Blogs</a></h1>
    <h2><time datetime="2013-04-10">4-10-13</time> | Posted by <a href="#">Ben Callahan</a> and <a href="#">Jeremy Loyd</a></h2>
    <p>Ben's recent article on Web Standards Sherpa and Jeremy's on Web Design Tuts Plus are now live. Ben introduces responsive retrofitting while Jeremy discusses typographic hierarchy. Both are great reads.</p>
  </article>
</section>

<!--Listing page will display 5-8 per page-->

<footer class="nextpage">
  <p><a href="foundry-blog.php">Older Posts (is this to see all or a paging element?)</a><p>
  </footer>


  <!--Footer featured some of our past clients' logos.-->
  <?php include("footer.php") ?>
</body>
</html>