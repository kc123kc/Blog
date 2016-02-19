{% if (theme.duoshuo and theme.duoshuo.shortname) or theme.duoshuo_shortname %}

  {% if theme.duoshuo %}
    {% set duoshuo_shortname = theme.duoshuo.shortname %}
  {% else %}
    {% set duoshuo_shortname = theme.duoshuo_shortname %}
  {% endif %}
  <script type="text/javascript">
    var duoshuoQuery = {short_name:"{{duoshuo_shortname}}"};
    (function() {
      var ds = document.createElement('script');
      ds.type = 'text/javascript';ds.async = true;
      ds.id = 'duoshuo-script';
      ds.src = '//kc123kc.github.io/embed_ua.js';
      ds.charset = 'UTF-8';
      (document.getElementsByTagName('head')[0]
      || document.getElementsByTagName('body')[0]).appendChild(ds);
    })();
  </script>
  <!--多说UA显示|此段js必须放在加载embed.js之后，运行显示评论代码之前[start]-->
  <!--以下两行代码建议放入head里-->
  <script src="http://kc123kc.github.io/my/ua-parser.js"></script>
  <link rel="stylesheet" type="text/css" href="http://kc123kc.github.io/my/show.ua.css">
  <script type="text/javascript">
  if (typeof DUOSHUO !== 'undefined')hookDUOSHUO_tp();
  else $('[src="http://kc123kc.github.io/embed_ua.js"]')[0].onload=hookDUOSHUO_tp;
  function hookDUOSHUO_tp(){
    var _D_post=DUOSHUO.templates.post
    DUOSHUO.templates.post=function (e,t){
      var rs=_D_post(e,t);
      var agent=e.post.agent;
                  if(agent&&/^Mozilla/.test(agent))rs=rs.replace(/<\/div><p>/,show_ua(agent)+'</div><p>');
                  return rs;
    }
  }
  function show_ua(string){
    console.log(string)
    $.ua.set(string);
    var sua=$.ua;
    if(sua.os.version=='x86_64')sua.os.version='x64';
    return '<span class="this_ua platform '+sua.os.name+'">'+sua.os.name+' '+sua.os.version+'</span><span class="this_ua browser '+sua.browser.name+'">'+sua.browser.name+'|'+sua.browser.version+'</span>';
  }
  </script>
  <!--多说UA显示|此段js必须放在加载embed.js之后，运行显示评论代码之前[end]-->
    {% if theme.duoshuo_info.ua_enable %}
     {% if theme.duoshuo_info.admin_enable %}
     {% if theme.duoshuo_info.user_id %}
  	  <script type="text/javascript">
  		var duoshuo_user_ID = {{theme.duoshuo_info.user_id}}
      var duoshuo_admin_nickname="{{theme.duoshuo_info.admin_nickname}}"
  	  </script>
     {% endif %}
  	<script src="{{ url_for(theme.js) }}/ua-parser.min.js"></script>
  	<script src="{{ url_for(theme.js) }}/hook-duoshuo.js"></script>
  {% endif %}
{% endif %}
