<!doctype html>

<html>
<head>
  <title>Sparkbox</title>
  <meta name="description" content="From deep in the American heartland, our team of craftsmen answers the call for a better web. Driven by a deep belief in the freedom of a web liberated from device constraints, Sparkbox labors with conviction toward a higher standard as we write, educate, and build.">
  <link rel="stylesheet" href="content-style.css" media="screen">
</head>

<body>
  <header>
  <!--Main navigation would be included here.-->
<?php include("navigation.php") ?>
  </header>

<section class="hero">
  <p>Build Right and</p>
  <h1>Set Your Site Free.</h1>
  <img src="" alt="Hero imagery speaks to freedom." />
     <p>Sparkbox builds right for the fluidity of your content, the integrity of your vision, and the cause of a more durable web.</p>
    <p>Rooted in the American heartland, our team of craftsmen answers the call for a better web. Driven by a deep determination for a web liberated of device constraints, Sparkbox leads toward a greater standard as we <a href="foundry-blog.php">write</a>, <a href="foundry-calendar.php">educate</a>, and <a href="foundry-sideprojects.php">build</a>.</p>
    <p>We invite you to <a href="contact-0.php">join us</a>.</p>
</section>

<!--Foundry section highlights featured blog, calendar, and side project entries.-->

<section class="foundry">
  <section class="blog">
    <h1><a href="foundry-blog.php">Foundry Articles</a></h1>
    <a href="foundry-blog-detail.php"><img src="" alt="Featured Image" /></a>
    <h2><a href="foundry-blog-detail.php">Slanted Elements With CSS3 (This is the most recent featured story?)</a></h2>
    <h3><time datetime="2013-04-22">4-22-13</time> | <a href="#">Adam Simpson</a></h3>
  </section>

    <section class="calendar">
    <h1><a href="foundry-calendar.php">Calendar</a></h1>
     <a href="foundry-calendar-detail.php"><img src="" alt="Category-determined Image (one if Build Responsively and another for everything else)" /></a>
     <h2><a href="foundry-calendar-detail.php">Coverge SE 2013</a></h2>
     <h3><time datetime="2013-04-25">4-25-13</time> | Columbia, SC</h3>
  </section>

  <section class="sideprojects">
    <h1><a href="foundry-sideprojects.php">Side Projects</a></h1>
    <a href="foundry-sideprojects-detail.php"><img src="" alt="Featured Image" /></a>
    <h2><a href="foundry-sideprojects-detail.php">Media Query Bookmarklet</a></h2>
    <h3><time datetime="2013-04-22">4-2-13</time> | <a href="#">Rob Tarr</a> and <a href="#">Potential Other Author</a></h3>
  </section>
</section>

<!--Work section highlights featured work entry -->

<section class="work">
  <h1>Featured Work</h1>
  <a href="featured-work.php"><img src="" alt="Featured Image" /></a>
  <h2><a href="featured-work.php">Stry.Us Long-Form News Website</a></h2>
    <p>Working with Stry on a ground-up brand and website overhaul was one of those rare occasions where the client hands over near complete creative control. The direction from Stry founder, <a href="https://twitter.com/danoshinsky">Dan Oshinsky</a>, was pretty much, "Make the most beautiful news website ever made." Stop by Stry.us for a look around. Be sure to set aside some time, however, because even if the beautiful, responsive design eventually loses your attention, the rich long-form articles will keep you there for hours. </p>
  <p><a href="http://stry.us">Go to stry.us</a></p>
</section>

<!--Footer featured some of our past clients' logos, but we only show logos for clients for whom we have work in our work section.	-->

<?php include("footer.php") ?>

</body>
</html>