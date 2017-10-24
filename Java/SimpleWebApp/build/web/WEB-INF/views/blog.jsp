<%-- 
    Document   : blog
    Created on : 17.okt.2017, 11:08:49
    Author     : evakristine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog</title>
        <style>
            div#textEditor{
                margin: 1px;
                width: 750px;
                height: 300px;
            }
            div#theRibbon{
                border-bottom: none;
                padding: 10px;
                background-color: firebrick;
                color: white;
                border-radius: 8px 8px 0px 0px;
            }
            div#richTextArea{
                border: 2px firebrick;
                height: 100%;
                width: 746px;
            }
            iframe#theWYSIWYG{
                height: 100%;
                width: 100%;
            }
            div#theRibbon > button {
                color: white;
                border: none;
                outline: none;
                background-color: transparent;
                cursor: pointer;
            }
            input[type="color"]{
                color: transparent;
                border: none;
                padding: 8px;     
            } 
            input[type="submit"]{
                color: white;
                border: none;
                outline: none;
                background-color: grey;
                cursor: pointer;
            }
            
        </style>
        <script>
            window.addEventListener("load", function () {
                var editor = theWYSIWYG.document;
                editor.designMode = "on";

                boldButton.addEventListener("click", function () {
                    editor.execCommand("Bold", false, null);
                }, false);

                italicButton.addEventListener("click", function () {
                    editor.execCommand("Italic", false, null);
                }, false);

                strikeButton.addEventListener("click", function () {
                    editor.execCommand("Strikethrough", false, null);
                }, false);

                orderedListButton.addEventListener("click", function () {
                    editor.execCommand("InsertOrderedList", false, "newOL" + Math.round(Math.random() * 1000));
                }, false);

                unorderedListButton.addEventListener("click", function () {
                    editor.execCommand("InsertUnorderedList", false, "newOL" + Math.round(Math.random() * 1000));
                }, false);

                fontColorButton.addEventListener("change", function (event) {
                    editor.execCommand("ForeColor", false, event.target.value);
                }, false);

                highlightButton.addEventListener("change", function (event) {
                    editor.execCommand("BackColor", false, event.target.value);
                }, false);

                fontChanger.addEventListener("change", function (event) {
                    editor.execCommand("FontName", false, event.target.value);
                }, false);

                fontSizeChanger.addEventListener("change", function (event) {
                    editor.execCommand("FontSize", false, event.target.value);
                }, false);
                
                linkButton.addEventListener("click", function () {
                    var url = prompt("Enter a URL", "http://");
                    editor.execCommand("CreateLink", false, url);      
                }, false);
                
                unLinkButton.addEventListener("click", function () {
                    editor.execCommand("UnLink", false, null);
                }, false);

                undoButton.addEventListener("click", function () {
                    editor.execCommand("undo", false, null);
                }, false);

                redoButton.addEventListener("click", function () {
                    editor.execCommand("redo", false, null);
                }, false);

            }, false);
        </script>
    </head>
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>


    <body>
        <h1>Blog</h1> 
        <p>Blog post:</p>


        <div id="textEditor">   
            <div id="theRibbon">
                <button id="boldButton" title="Bold"><b>B</b></button>
                <button id="italicButton" title="Italic"><em>I</em></button>
                <button id="strikeButton" title="Strikethrough"><s>abc</s></button>
                <button id="orderedListButton" title="Numbered list">(i)</button>
                <button id="unorderedListButton" title="Bulleted list">&bull;</button>
                <input type="color" id="fontColorButton" title="Change font color" >
                <input type="color" id="highlightButton" title="Highlight Text" >
                <select id="fontChanger">
                    <option value="Times New Roman" > Times New Roman</option>
                    <option value="Consolas" > Consolas</option>
                    <option value="Tahoma" > Tahoma</option>
                    <option value="Monospace" > Monospace</option>
                    <option value="Cursive" > Cursive</option>
                    <option value="Sans-Serif" > Sans-Serif</option>
                    <option value="Calibri" > Calibri</option>

                </select>
                <select id="fontSizeChanger">
                    <script>
                        for (var i = 5; i < 30; i++) {
                            document.write("<option value= '" + i + "'>" + i + "</option>");
                        }
                    </script>
                </select>
                <button id="linkButton" title="Create Link">Link</button>
                <button id="unLinkButton" title="Remove Link">UnLink</button>
                <button id="undoButton" title="Undo the previous action">&larr;</button>
                <button id="redoButton" title="Redo">&rarr;</button>
            </div>



            <div id="richTextArea">
                <iframe id="theWYSIWYG" name="theWYSIWYG" frameborder="2"></iframe>
            </div>  
        </div> 
        
        <div>
        <form   
            action = "BlogPost.jsp" method="post" >
            <input type="submit" value="Publiser">
        </form>   
            </div> 
    </body>
</html>
