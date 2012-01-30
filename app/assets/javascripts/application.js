// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//=require jquery
//=require jquery_ujs
//= require_tree .

// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function(){
		$("#question_type_normal").click(function(){

			$("#questions").show();
			$(".clonedInput").hide(); //hiding measurement text fields
			$(".hidebtnm").hide(); //hiding button as a class
			
		}); //normal text box show 
		
		$("#question_type_Measurement").click(function(){
			$("#questions").hide();
			$(".clonedInput").show();
			$(".hidebtnm").show();
		});//quesiton_type_Measurement
		
		$("#question_sequence_rbbkt").click(function(){
			$("#textboxkc1").show();
			$("#btntextkcadd").show();
			$("#btntextkcdel").show();
			$("#textbinsize1").hide();
			$("#hidebs").hide();
			$("#hidekc").show();
		});//quesiton_sequence_Measurement
		
		$("#question_sequence_rbdtree").click(function(){
			$(".tobeclonedtextbinsize").show();
			$("#btntextaddbinsize").show();
			$("#btntextdelbinsize").show();
			$("#hidekc").hide();
			$("#hidebs").show();
			$(".tobeclonedtextkc").hide();

		});//quesiton_sequence_
		$("#btnadd").click(function(){
			$(".clonedInput").show();
		}); //

		
		$('#btntextkcadd').click(function() {
			$(".tobeclonedtextkc").show();
			
            var num     = $('.tobeclonedtextkc').length; // how many "duplicatable" input fields we currently have
			var newNum  = new Number(num + 1);      // the numeric ID of the new input field being added
			var newElem = $('#textboxkc' + num).clone().attr('id', 'textboxkc' + newNum);		
			newElem.children('#kcs'+num).attr('id', 'kcs' +  newNum ).attr('name', 'kcs' +  newNum );         
			$('#textboxkc' + num).after(newElem);
			if (num >= 1){
			    $("#btntextkcdel").attr("disabled", false );
			}	

        });
		$('#btntextkcdel').click(function() {
		     var num = $('.tobeclonedtextkc').length; // how many "duplicatable" input fields we currently have
		     $('#textboxkc' + num).remove();     // remove the last element
		     $('#btntextkcadd').attr('disabled', false );         
		     if (num-1 == 1){
		           $('#btntextkcdel').attr('disabled', true);
			}
		
		});  
		
		$('#btnadd').click(function() {
			
            var num     = $('.clonedInput').length; // how many "duplicatable" input fields we currently have
            var newNum  = new Number(num + 1);      // the numeric ID of the new input field being added
			var newElem = $('#txtbtnkcinput' + num).clone().attr('id', 'txtbtnkcinput' + newNum);		
			newElem.children('#sp'+num).attr('id', 'sp' +  newNum ).attr('name', 'sp' +  newNum );
            newElem.children('#ep'+num).attr('id', 'ep' +  newNum ).attr('name', 'ep' +  newNum );
            newElem.children('#fp'+num).attr('id', 'fp' +  newNum ).attr('name', 'fp' +  newNum );
            newElem.children('#answer'+num).attr('id', 'answer' +  newNum ).attr('name', 'answer'+ newNum );
			$('#txtbtnkcinput' + num).after(newElem);
			if (num >= 1){
			    $("#btnDel").attr("disabled", false );
				//$("#btnDel").disable();
			}
        });
		$('#btnDel').click(function() {
			    var num = $('.clonedInput').length; 
			    $('#txtbtnkcinput' + num).remove();     
			               
			    $('#btnadd').attr('disabled', false );
					
			       if (num-1 == 1)
			         $('#btnDel').attr('disabled','disabled');
		});  
		
		$('#btntextaddbinsize').click(function() {
			$(".tobeclonedtextbinsize").show();
            var num     = $('.tobeclonedtextbinsize').length; 
            var newNum  = new Number(num + 1);     
            var newElem = $('#textbinsize' + num).clone().attr('id', 'textbinsize' + newNum);
            newElem.children('#binsize' + num).attr('id', 'binsize' + newNum).attr('name', 'binsize' + newNum);
            $('#binsize' + num).after(newElem);
			if (num >= 1){
			    $("#btntextdelbinsize").attr("disabled", false );
			}	
        });
		$('#btntextdelbinsize').click(function() {
			    var num = $('.tobeclonedtextbinsize').length; 
			      $('#textbinsize' + num).remove();    
				  $('#btntextaddbinsize').attr('disabled', false);
			      if (num-1 == 1){
			        $('#btntextdelbinsize').attr('disabled','disabled');
			     	}
		});  
		
		$("#question_sequence_random").click(function(){
			$(".tobeclonedtextkc").hide();
			$(".tobeclonedtextbinsize").hide();
			$('#btntextkcadd').hide();
			$('#btntextkcdel').hide();
            $("#btntextaddbinsize").hide();
			$('#btntextdelbinsize').hide();
		    
		});
		$("#question_sequence_random_once").click(function(){
			$(".tobeclonedtextkc").hide();
			$(".tobeclonedtextbinsize").hide();
			$('#btntextkcadd').hide();
			$('#btntextkcdel').hide();
            $("#btntextaddbinsize").hide();
			$('#btntextdelbinsize').hide();

		});
		$("#question_sequence_as_in_instruction_set").click(function(){
			$(".tobeclonedtextkc").hide();
			$(".tobeclonedtextbinsize").hide();
			$('#btntextkcadd').hide();
			$('#btntextkcdel').hide();
            $("#btntextaddbinsize").hide();
			$('#btntextdelbinsize').hide();
		});
		
		$('#btntextdelbinsize').attr('disabled', true);
        $('#btnDel').attr('disabled', true);
		$('#btntextkcdel').attr('disabled', true);
		

});
