<%@ page import="org.cog.Picture" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Church of God - Portland, Oregon</title>
		<meta name="description" content="The Church of God congregation from Portland, Oregon; providing audio content and encouragement to all thirsty souls"/>
		<r:require module="haccordion"/>
		<r:script>
			haccordion.setup({
				accordionid: 'pictureAccordion', //main accordion div id
				paneldimensions: {peekw:'100px', fullw:'400px', h:'380px'},
				selectedli: [0, false], //[selectedli_index, persiststate_bool]
				collapsecurrent: false //<- No comma following very last setting!
			})
		</r:script>
	</head>
	<body>
		%{--<span class="structuralClear"></span>--}%
		<section id="churchOfGod" class="content scaffold-show" role="main">
            <h1 class=clearBoth>What is the Church?</h1>
            <article class="floatLeft marginLeft" style="width: 90%; text-align:justify;">
                <p>
				Our society commonly defines the word <em>church</em> as a building, or place of worship. 
				However, the Greek origin of the word as found in the Bible, 
				<a class="indexLinks noSpin" href="http://concordances.org/strongs/greek/1577.htm" target="_blank"><em>ekkl&eacute;sia</em></a>, 
				explains it as "an assembly, or congregation". It is derived from the words 
				<a class="indexLinks noSpin" href="http://concordances.org/strongs/greek/1537.htm" target="_blank"><em>ek</em></a> which means "out of" and 
				<a class="indexLinks noSpin" href="http://concordances.org/strongs/greek/2821.htm" target="_blank"><em>klesis</em></a>, which means "a calling".
			</p>
			<p>	 
				Thus, a more biblical way to view the term "church"" relates to <b><em>people</em></b>, not buildings. The Church is much more than a structure; 
				it is the people that have been "called out" from a life of selfishness to dedicate their lives to Christ. There may be religious buildings on virtually 
				every corner here in the United States, but there is only one true church. It is composed of all people that have sincerely asked
				God for forgiveness through his Son Jesus and are walking in the light of his Word, the Holy Bible. 
			</p>
			<p>	 
				This doesn't include everyone that simply calls themselves  
				Christian, but those that have 
				<a class="indexLinks noSpin" href="http://www.biblegateway.com/passage/?search=Revelation+7:13-14&version=KJV" target="_blank">
					<em>washed their robes, and	made them white in the blood of the Lamb</em>
				</a> and have become a 
				<a class="indexLinks noSpin" href="http://www.biblegateway.com/passage/?search=2Corinthians5:17&version=KJV" target="_blank">
					<em>new creature in Christ</em>.
				</a>
				Regardless to where you live, your race, gender or affiliation - if you have this kind of relationship with God, you are part of his Church. 
			</p>
			<p>
				It is then in the true spirit of ekkl&eacute;sia that this page celebrates the Church of God, with pictures of His people living for Him 
				in their everyday life. <a class="indexLinks noSpin" href="http://www.biblegateway.com/passage/?search=Acts+17:24-28&version=KJV" target="_blank">God dwelleth not in temples made 
				with hands</a>, but in every believer that walks humbly with him day by day.  	         
			</p>
			</article>
			<h1 class="structuralClear"></h1>
            <div class="pictures">
			<g:pictures/>
            </div>
		</section>
	</body>
</html>
