---
date: '2004-07-25 20:57:01'
layout: post
slug: updated-split-bookmarklets-works-on-ie6
status: publish
title: Updated Split bookmarklets (works on IE6)
wordpress_id: '22'
tags:
- javascript
- misc
---

Thanks to the many comments I had about the [split bookmarklets](http://www.jmesnil.net/weblog/2004/07/bookmarklet-to-split-html-document.html), I updated them and here they are:

<ul>
<li><a href="javascript:document.write('&lt;HTML&gt;&lt;HEAD&gt;&lt;/HEAD&gt;&lt;FRAMESET ROWS=\'50%,*\'&gt;&lt;FRAME SRC=' + location.href + '&gt;&lt;FRAME SRC=' + location.href + '&gt;&lt;/FRAMESET&gt;&lt;/HTML&gt;');document.close();">split horizontally in current window</a> -&gt; drag to your bookmark folder</li>

<li><a href="javascript:document.write('&lt;HTML&gt;&lt;HEAD&gt;&lt;/HEAD&gt;&lt;FRAMESET COLS=\'50%,*\'&gt;&lt;FRAME SRC=' + location.href + '&gt;&lt;FRAME SRC=' + location.href + '&gt;&lt;/FRAMESET&gt;&lt;/HTML&gt;');document.close();">split vertically in current window</a> -&gt; drag to your bookmark folder</li>
</ul>

the main changes are:

  * they work on on Internet Explorer 6 (many thanks to [this anonymous commenter](http://www.jmesnil.net/weblog/2004/07/bookmarklet-to-split-html-document.html#109047543233946689))
  * Firefox throbber is stopped once the frames loading is finished
  * the scrollbars appear only in the frames and not in Firefox (on some sites, it still does not work...)

I'm by no means a JavaScript wizard but I find quite amazing the difficulties to get such a simple javascript code to work on different browsers. With that little experience, I'm even more impressed by web applications using JavaScript like [Gmail](http://gmail.google.com) ([Oddpost](http://www.oddpost.com) is also worth to take a look but they made their job easier by only targeting Internet Explorer).
