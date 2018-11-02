//<![CDATA[

$(document).ready(function(){
	// Instance jPlayer
	$("#jplayer").jPlayer({
		ready: next,
		ended: next,
		supplied: "oga"
	});
});

function next()
{
	$.ajax({url: "/cgi-bin/randmus"})
	.done(function( data ) { play($("#jplayer"), data) } );
}

function playpause()
{
	var j = $("#jplayer");
	var p = j.data().jPlayer.status.paused;
	$('#btnPlayPause').attr("src", "images/"+(p?"pause":"play")+".png");
	j.jPlayer(p?"play":"pause");
}

function play(j, href)
{
	j.jPlayer("setMedia", {oga:href});
	playpause();
}
//]]>
