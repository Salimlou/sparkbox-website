<!doctype html>

<html>
<head>  
  <title>Sparkbox Team | Ethan Muller</title>
  <meta name="description" content="From deep in the American heartland, our team of craftsmen answers the call for a better web. Driven by a deep belief in the freedom of a web liberated from device constraints, Sparkbox labors with conviction toward a higher standard as we write, educate, and build.">
  <link rel="stylesheet" href="content-style.css" media="screen">
</head>

<body>
  <header>
  <!--Main navigation would be included here.-->
<?php include("navigation.php") ?>
  </header>

<!--Hero section highlights the team (our pictures?)-->

<section>
  <h1>Devoted To a Web Built Right</h1>
  <h2>Meet our team of web freedom fighters.</h2>
  <p>We&rsquo;re smart. We&rsquo;re hard-working. We&rsquo;re easy to talk to, and we love a challenge.</p>
  <?php include("team_nav.php") ?>		
</section>

<!--Detail section would contain overall team fun "statistics." This section could also be used to reveal a team member's details like we do on current site (unless we decided to make a page for this).-->

<section>
  <header>
    <a href="team.php">Back to Team</a>
    
    <h1>Ethan Muller</h1>
    <h2>Web Developer</h2>
    <ul>
      <li><a href="#">Twitter</a></li>
      <li><a href="#">GitHub</a></li>
      <li><a href="#">Dribbble</a></li>
    </ul>
    <p>I&rsquo;d like to do a short paragraph bio about each person... possibly in conjunction with an image of our "stuff". If we have the stuff, I like the idea of it being on top of the image, toggling back and forth transparency to hide/show the text versus the image so this page doesn't get super long</p>
  </header>
  
  <article>
    <h1>Recent Article by Ethan: <a href="#">All from Ethan</a></h1>
    <h2><a href="http://seesparkbox.com/foundry/vimnastics_writing_repetitive_markup_in_vim">Vimnastics: Writing Repetitive Markup in Vim</a></h2>
    <p>Love to flex your Vim muscles? Hate the copy, paste, repeat game when writing markup? Ethan has some time-saving exercises for you.<a href="#"> Read More.</a></p>
  </article>
  
  <article>
    <h1>Meet Ethan Next at: <a href="#">All Ethan's Events (on Lanyrd)</a></h1>
    <h2><a href="http://seesparkbox.com/foundry/build_guild10">Build Guild</a></h2>
    <h3>Dayton, OH</h3>
    <time>November 13</time>
    <p>Build Guild is a national group of local meetups for web geeks centered around great conversations instead of dry presentations. <a href="#">Read More.</a></p>
  </article>
  
  <p>Expertise</p>
  <ul>
    <li>HTML/CSS</li>
    <li>Web Design</li>
    <li>Print Design</li>
  </ul>

  <p>Tools</p>
  <ul>
    <li>MacVim</li>        
      <li>CodeKit</li>
      <li>Chrome</li>
      <li>JS Bin</li>
      <li>iTerm2</li>
      <li>Dropbox</li>
      <li>Photoshop</li>
      <li>Illustrator</li>
  </ul>
  
</section>


<!--Footer featured some of our past clients' logos, but we only show logos for clients for whom we have work in our work section.	-->

<?php include("footer.php") ?>

</body>
</html>