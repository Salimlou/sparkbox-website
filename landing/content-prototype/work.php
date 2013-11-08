<!doctype html>

<html>
<head>  
  <title>Sparkbox Work</title>
  <meta name="description" content="From deep in the American heartland, our team of craftsmen answers the call for a better web. Driven by a deep belief in the freedom of a web liberated from device constraints, Sparkbox labors with conviction toward a higher standard as we write, educate, and build.">
  <link rel="stylesheet" href="content-style.css" media="screen">
</head>

<body>
  <header>
  <!--Main navigation would be included here.-->
<?php include("navigation.php") ?>
  </header>

  <section> 
    <h1>Work</h1>
    <h2>Behavior of this page:</h2>
    <p>Items on this page will appear similarly to the other Foundry listing pages. We can not handle this as we are on the current site. For example, the first and second most recent items are currently in the left-hand column on top of one another</p>
  </section>
  
  <section> 
    <h1>Fields for each work entry:</h1>
    
    <h2>Required</h2>
    <ul>
      <li>Project Title</li>
      <li>Client (clickable to show other projects for this client. similar to how we handle author on blog posts.)</li>
      <li>Featured Image (for use on homepage only)</li>
      <li>Project Short Description (1-2 paragraphs)</li>
    </ul>
    
    <h2>Discipline Categories</h2>
    <ul>
      <li>Planning</li>
      <li>Information Architecture</li>
      <li>Content Strategy</li>
      <li>Design</li>
      <li>Frontend Development</li>
      <li>CMS Integration</li>
      <li>CMS Extension</li>
      <li>Web App Development</li>
      <li>Consulting</li>
      <li>Training</li>
      <li>Project Management</li>
    </ul>
    
    <h2>Potential Attributes</h2>
    <p>Projects could have multiples of each/any of the below:</p>    
    <dl>
      <dt>Main Image(s)</dt>
        <dd>Most commonly a screenshot of the project... that screenshot is placed on an image of the originating device (so we will have PSD's of devices to put our screenshots on). However, the main image could also be a sketch, wireframe, plan, brand piece, etc.</dd>
      <dt>Project Statistic(s)</dt>
        <dd>HTML text field allowing us to call out statistics or project successes in text form. (Example: Increased Enrollment 25%)</dd>
      <dt>Client Quote(s)</dt>
        <dd>HTML text field</dd>
      <dt>Additional Image(s) w/ Supporting Long Caption</dt>
        <dd>An image that wouldn't be in the carousel of main images, but instead would be used to illustrate a textual point (caption) further down the page. (Example: picture of the university we worked for with a blurb about them).</dd>
    </dl>
    
  </section>
  


<!--Footer featured some of our past clients' logos, but we only show logos for clients for whom we have work in our work section.  -->

<?php include("footer.php") ?>

</body>
</html>