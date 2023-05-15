<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<script type="text/javascript">
	$('#tree').jstree({ 
	  'core' : {
	    'data' : [
	      { "id" : "ajson1", "parent" : "#", "text" : "Simple root node" },
	      { "id" : "ajson2", "parent" : "#", "text" : "Root node 2" },
	      { "id" : "ajson3", "parent" : "ajson2", "text" : "Child 1" },
	      { "id" : "ajson4", "parent" : "ajson2", "text" : "Child 2" },
	    ]
	  }
	});
</script>
<div id="tree"></div>
