var printView=false;

if(window.addEventListener){
	window.addEventListener("keydown", function(e){
	  if(printView && e.keyCode == 27){
                printFriendly();
          }
        });
}


function printFriendly(){
	printView=!printView;

	changeDisplay('sidebar');
	changeDisplay('header');
	changeDisplay('menubar');
	changeDisplay('toc_container');
    changeDisplay('shadowbar');
	changeDisplay('footer');
	changeDisplay('root_nav');
	changeDisplay('comments');
	changeDisplay('views_header');
	changeDisplay('views_footer');
	changeDisplay('print_button_header');
	changeDisplay('print_button_footer');

	var contentDiv=document.getElementById('print_content');
	if(contentDiv){
		if(printView) {
			contentDiv.style.width="95%";
		}else{
			contentDiv.style.width="76%";
		}
	}
}

function changeDisplay(id){
	var element=document.getElementById(id);
	if(element){
		if(printView){
			element.style.display='none';
		}else{
			element.style.display='block';
		}
	}
}
