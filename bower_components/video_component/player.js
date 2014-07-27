
    Polymer({
		      	var playerType = ["youtube", "vimeo", "dailymotion"];
				player = player? player.toLowerCase() : '';
				if (playerType.indexOf(player) > -1) {
		        if (player == 'youtube')
		        {
		        		 src="//www.youtube.com/embed/"+id; 
		        }
		        if (player == 'vimeo')
		        {
		        	src="//player.vimeo.com/video/"+id+"?byline=0&amp;portrait=0&amp;badge=0&amp;color=ffffff";  
		        }
		        if (player == 'dailymotion')
		        {
		        	src="//www.dailymotion.com/embed/video/" +id;
		        }
				 } 
				else {
				    alert("Site not supported");
				}
		      }
		    });
