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
	<p><a href="foundry-blog.php">All Blog Posts</a></p>
	<section class="listing blog">
		<article class="post">
		 <h1>Slanted Elements With CSS3</h1>
		 <h2><time datetime="2013-04-22">4-22-13</time> | Posted by <a href="#">Adam Simpson</a></h2>
		 <img src="" alt="Featured Image" />
		 <p>On a recent project,&nbsp;Jeremy handed me a design that included some hip, slanted toggles in the responsive navigation for smaller screen sizes (similar to the image above). My first thought was to simply drop in a background-image and go about my merry way. In actuality, getting a correct implementation was a little more challenging. The final solution removes the need for any image requests, and it maintains perfect target accuracy for touch devices. Here's how we got there.</p>
		 <h3>First Try</h3>
		 <p>My first real attempt at implementing the slants was to use :before and :after pseudo classes and use background images to create the illusion of a slanted background. The main issue with this is that the click targets were all wrong. Clicking in the upper right or lower left corners of these faux slants resulted in a click on the element next to the targeted element. Also, this approach made four total requests for two toggles which obviously isn't winning any performance awards.</p>
		 <h3>Rotation Inception</h3>
		 <p>After talking it over with Ben, he recommended trying to use transform: rotate on the elements. I had tried this before and was disappointed because the children elements also rotated (in this case, the text inside the toggle). At Ben's urging, I gave it another go. After some Googling and thinking, I figured out that simply applying absolute positioning will not remove the parent's rotation, but it will allow a second transform (a counter-rotate) to transform the child element. One issue I ran into with this approach was that elements had to be made larger than desired and then cropped with&nbsp;overflow:hidden&nbsp; with their parent.</p>
		 <h3>The Results</h3>
		 <p>The elements were successfully rotated, their children counter-rotated, no images were loaded, and (most importantly) the rotate also changed the element's touch target to correspond directly to its visual appearance. This is a big change from a solution that had required one to four images, one to four requests, and resulted in an inaccurate target. Pretty sweet, huh?</p>
		 <p>WebKit obviously handles this fine, as does Firefox. According to <a href="http://caniuse.com/#search=transform">Can I Use</a>, IE 9+ will handle the transforms just fine as well. We thought this was an acceptable level of browser support. For IE8 and lower we decided it wasn't vital that they receive the slanted treatment, so they instead get standard square boxes.</p>
		 <h3>A Few Alternatives</h3>
		 <p>Now, after getting the slanted elements working, Rob and Ethan both suggested I should have used skew instead of rotate. Doh! They were right of course. Using skew greatly simplifies this approach. Going forward I would recommend skew over rotate simply because you don't have to do any sort of overflow cropping.</p>
		 <p>Another alternative, suggested by <a href="http://snook.ca/">Mr. Jonathan Snook</a>, was to use an image map and a single background image. I think this would work perfectly. However, since using skew removes the need for any image/request at all and we are fine with the browser support, I think skew is the best solution for this particular problem. Now, I'm sure that image maps would be great as a fallback for browsers that don't support transforms or in a situation where browser support is more critical. As with anything on the web, it all depends on your particular project, use case, and constraints.</p>
		 <h3>Demo</h3>
		 <p>Feel free to check out <a href="http://codepen.io/asimpson/pen/ejJsK">this code pen</a> to see the code and play around with the rendered touch targets.</p>
	 </article>
	 <h3>Tags: <a href="#">web</a>, <a href="#">design</a>, <a href="#">responsive</a>
	 </section>

		<section class="form">
			<h2>Leave a Comment</h2>
			<form>			
				<fieldset>
					<label for="name">Name</label>
					<input type="text" placeholder="Name"/>
				</fieldset>
				<fieldset>
					<label for="comment">Comment</label>
					<textarea name="textarea" rows="10" cols="30">Add Comment Here</textarea>
				</fieldset>
				<fieldset>
					<input type="submit" value="Submit" />
				</fieldset>	
			</form>
		</section>

  <section class="Recent Articles">
    <h3>This Author's Most Recent Articles</h3>
    <p><a href="foundry-blog-detail.php">Slanted Elements With CSS3 (This is the most recent featured story?)</a></br>
    <time datetime="2013-04-22">4-22-13</time></p>
    <a href="foundry-blog-detail.php">Slanted Elements With CSS3 (This is the most recent featured story?)</a></br>
    <time datetime="2013-04-22">4-22-13</time></p>
    <a href="foundry-blog-detail.php">Slanted Elements With CSS3 (This is the most recent featured story?)</a></br>
    <time datetime="2013-04-22">4-22-13</time></p>
    <p><a href="foundry-blog-detail.php">All Articles by Jeremy Loyd (author)</a>   
  </section>

		<p><a href="foundry-blog.php">All Blog Posts</a></p>


		<!--Footer featured some of our past clients' logos.-->
		<?php include("footer.php") ?>
	</body>
	</html>