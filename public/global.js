
  var tabLinks = new Array();
  var contentDivs = new Array();

  // Function sets up tabs
  //
  // Create an Array to get each line from the list tabs.
  // Iterating through listTabs, if node is list item locate anchor tag
  // and get URL link
  //
  //
  function init(){
    var listTabs = document.getElementById("tabs").childNodes;
    for (var i = 0; i < listTabs.length; i++){
      if (listTabs[i].nodeName == "LI"){
        var tabLink = getFirstChildWithTagName(listTabs[i], "A");
        var id = getLink(tabLink.getAttribute("href"));
        tabLinks[id] = tabLink;
        contentDivs[id] = document.getElementById(id);
      }
    }

    // Starting with an index of 0, loop through tabLinks, adding
    // showTab function to each tab.
    var i = 0;

    for ( var id in tabLinks ) {
      tabLinks[id].onclick = showTab;
      tabLinks[id].onfocus = function() { this.blur() };
      if ( i == 0 ) tabLinks[id].className = 'selected';
      i++;
    }

    // Starting with an index of 0, loop through contentDivs, adding
    // hide Class when tab is not selected.
    var i = 0;

    for ( var id in contentDivs ) {
      if ( i != 0 ) contentDivs[id].className = 'tab_content hide';
      i++;
    }
  }

  // Shows currently selected tab information, and hides all others
  //
  function showTab(){
    var selectedID = getLink(this.getAttribute('href'));
    // for (var id = 0; id < contentDivs.length; id++) {
    for ( var id in contentDivs ) {
      if (id === selectedID) {
        tabLinks[id].className = 'selected';
        contentDivs[id].className = "tab_content";
      } else {
        tabLinks[id].className = "";
        contentDivs[id].className = "tab_content hide";
      }
    }

    // Prevents browser from following the link
    return false;
  }

  // Returns the first child of an element that matches a given id
  //
  // Utility function used in init() method
  function getFirstChildWithTagName(element, tagName) {
    for (var i = 0; i < element.childNodes.length; i++) {
      if (element.childNodes[i].nodeName == tagName) return element.childNodes[i];
    }
  }


  // Return the value of the URL portion after the second #
  //
  // Utility function used in init() and showTab() methods.
  function getLink(url){
    var linkPos = url.lastIndexOf ('#');
    return url.substring(linkPos + 1);
  }
