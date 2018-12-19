<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/23 0023
  Time: 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="test.Test1" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="dao.impl.UserDAOImpl" %>
<%@ page import="beans.User" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

  <title>首页</title>

  <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
  <link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

  <link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

  <link href="../css/hmstyle.css" rel="stylesheet" type="text/css" />
  <script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
  <script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

</head>

<body>
<div class="hmtop">
  <!--顶部导航条 -->
  <div class="am-container header">
    <ul class="message-l">
      <div class="topMessage">
        <div class="menu-hd">
          <a href="login.jsp" target="_top" class="h" style="color: red">亲，请登录</a>
          <a href="register.jsp" target="_top" style="color: lightblue;">免费注册</a>
          <a href="adminLogin.jsp" target="_top">管理员登录</a>
        </div>
      </div>
    </ul>
    <ul class="message-r">
      <div class="topMessage home">
        <div class="menu-hd"><a href="index.jsp" target="_top" class="h">书城首页</a></div>
      </div>
      <%--<div class="topMessage my-shangcheng">--%>
        <%--<div class="menu-hd MyShangcheng"><a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>--%>
      <%--</div>--%>
      <div class="topMessage mini-cart">
        <div class="menu-hd"><a id="mc-menu-hd" href="cart.jsp" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i> <span>购物车</span>
        </div>
        <div class="topMessage favorite">
    </ul>
  </div>

  <!--悬浮搜索框-->

  <div class="nav white">
    <div class="logo"><img src="../images/logo.png"  /></div>
    <div class="logoBig">
      <li><img src="../images/logo_sdname02.jpg" /></li>
    </div>

    <%--<div class="search-bar pr">--%>
      <%--<a name="index_none_header_sysc" href="#"></a>--%>
      <%--<form>--%>
        <%--<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">--%>
        <%--<input id="ai-topsearch" class="submit am-btn" value="search" index="1" type="submit">--%>
      <%--</form>--%>
    <%--</div>--%>
  </div>

  <div class="clear"></div>
</div>
<b class="line"></b>
<div class="shopNav">
  <div class="slideall" style="height: auto;">

    <div class="long-title"><span class="all-goods">全部分类</span></div>
    <div class="nav-cont">
      <ul>
        <li class="index"><a href="index.jsp">首页</a></li>
        <li class="qc"><a href="getBook.jsp?id=1">文学</a></li>
        <li class="qc"><a href="getBook2.jsp?id=2">社科</a></li>
        <li class="qc"><a href="getBook.jsp?id=3">少儿</a></li>
        <li class="qc last"><a href="getBook.jsp?id=4">艺术</a></li>
      </ul>
      <div class="nav-extra">
        <a href="register.jsp" style="font-size:20px;color:yellow">注册</a>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="login.jsp" style="font-size:20px;color:yellow">登录</a>
      </div>
    </div>

    <div class="bannerTwo">
      <!--轮播 -->
      <div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
        <ul class="am-slides">
          <li class="banner1"><a href="introduction.html"><img src="../images/ts_ad01.jpg" /></a></li>
          <li class="banner2"><a><img src="../images/ts_ad01.jpg" /></a></li>
          <li class="banner3"><a><img src="../images/ts_ad02.jpg" /></a></li>
          <li class="banner4"><a><img src="../images/ts_ad03.jpg" /></a></li>
        </ul>
      </div>
      <div class="clear"></div>
    </div>

    <!--侧边导航 -->
    <div id="nav" class="navfull" style="position: static;">
      <div class="area clearfix">
        <div class="category-content" id="guide_2">

          <div class="category" style="box-shadow:none ;margin-top: 2px;">
            <ul class="category-list navTwo" id="js_climit_li">
              <li>
                <div class="category-info">
                  <h3 class="category-name b-category-name"><i><img src="../images/cake.png"></i><a class="ml-22" title="图书">图书/童书</a></h3>
                  <em>&gt;</em></div>
                <div class="menu-item menu-in top">
                  <div class="area-in">
                    <div class="area-bg">
                      <div class="menu-srot">
                        <div class="sort-side">
                          <dl class="dl-sort">
                            <dt><span title="教育">教育</span></dt>
                            <dd><a title="中小学教辅" href="#"><span>中小学教辅</span></a></dd>
                            <dd><a title="考试" href="#"><span>考试</span></a></dd>
                            <dd><a title="大中专教材" href="#"><span>大中专教材</span></a></dd>
                            <dd><a title="外语" href="#"><span>外语</span></a></dd>
                            <dd><a title="工具书" href="#"><span>工具书</span></a></dd>
                            <dd><a title="教师用书" href="#"><span>教师用书</span></a></dd>
                            <dd><a title="英语四六级" href="#"><span>英语四六级</span></a></dd>
                            <dd><a title="公务员" href="#"><span>公务员</span></a></dd>
                            <dd><a title="教师资格考试" href="#"><span>教师资格考试</span></a></dd>
                          </dl>
                          <dl class="dl-sort">
                            <dt><span title="文艺">文艺</span></dt>
                            <dd><a title="小说" href="#"><span>小说</span></a></dd>
                            <dd><a title="文学" href="#"><span>文学</span></a></dd>
                            <dd><a title="传记" href="#"><span>传记</span></a></dd>
                            <dd><a title="青春文学" href="#"><span>青春文学</span></a></dd>
                            <dd><a title="动漫/幽默" href="#"><span>动漫/幽默</span></a></dd>
                            <dd><a title="艺术" href="#"><span>艺术</span></a></dd>
                            <dd><a title="摄影" href="#"><span>摄影</span></a></dd>
                            <dd><a title="偶像明星" href="#"><span>偶像明星</span></a></dd>
                            <dd><a title="涂色/填色" href="#"><span>涂色/填色</span></a></dd>
                          </dl>

                        </div>
                        <div class="brand-side">
                          <dl class="dl-sort"><dt><span>出版社</span></dt>
                            <dd><a title="小说" href="#"><span>人民文学出版社</span></a></dd>
                            <dd><a title="文学" href="#"><span>现代出版社</span></a></dd>
                            <dd><a title="传记" href="#"><span>中华书局</span></a></dd>
                            <dd><a title="青春文学" href="#"><span>作家出版社</span></a></dd>
                            <dd><a title="动漫/幽默" href="#"><span>海豚出版社</span></a></dd>
                            <dd><a title="艺术" href="#"><span>云南人民出版社</span></a></dd>
                            <dd><a title="摄影" href="#"><span>人民出版社</span></a></dd>
                            <dd><a title="偶像明星" href="#"><span>长江文艺出版社</span></a></dd>
                          </dl>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <b class="arrow"></b>
              </li>
              <li >
                <div class="category-info">
                  <h3 class="category-name b-category-name"><i><img src="../images/cookies.png"></i><a class="ml-22" title="历史">社科</a></h3>
                  <em>&gt;</em></div>
                <div class="menu-item menu-in top">
                  <div class="area-in">
                    <div class="area-bg">
                      <div class="menu-srot">
                        <div class="menu-srot">
                          <div class="sort-side">
                            <dl class="dl-sort">
                              <dt><span title="历史">历史</span></dt>
                              <dd><a title="中小学教辅" href="#"><span>中小学教辅</span></a></dd>
                              <dd><a title="考试" href="#"><span>考试</span></a></dd>
                              <dd><a title="大中专教材" href="#"><span>大中专教材</span></a></dd>
                              <dd><a title="外语" href="#"><span>外语</span></a></dd>
                              <dd><a title="工具书" href="#"><span>工具书</span></a></dd>
                              <dd><a title="教师用书" href="#"><span>教师用书</span></a></dd>
                              <dd><a title="英语四六级" href="#"><span>英语四六级</span></a></dd>
                              <dd><a title="公务员" href="#"><span>公务员</span></a></dd>
                              <dd><a title="教师资格考试" href="#"><span>教师资格考试</span></a></dd>
                            </dl>
                            <dl class="dl-sort">
                              <dt><span title="社会科学">社会科学</span></dt>
                              <dd><a title="小说" href="#"><span>小说</span></a></dd>
                              <dd><a title="文学" href="#"><span>文学</span></a></dd>
                              <dd><a title="传记" href="#"><span>传记</span></a></dd>
                              <dd><a title="青春文学" href="#"><span>青春文学</span></a></dd>
                              <dd><a title="动漫/幽默" href="#"><span>动漫/幽默</span></a></dd>
                              <dd><a title="艺术" href="#"><span>艺术</span></a></dd>
                              <dd><a title="摄影" href="#"><span>摄影</span></a></dd>
                              <dd><a title="偶像明星" href="#"><span>偶像明星</span></a></dd>
                              <dd><a title="涂色/填色" href="#"><span>涂色/填色</span></a></dd>
                            </dl>

                          </div>
                          <div class="brand-side">
                            <dl class="dl-sort"><dt><span>出版社</span></dt>
                              <dd><a title="小说" href="#"><span>人民文学出版社</span></a></dd>
                              <dd><a title="文学" href="#"><span>现代出版社</span></a></dd>
                              <dd><a title="传记" href="#"><span>中华书局</span></a></dd>
                              <dd><a title="青春文学" href="#"><span>作家出版社</span></a></dd>
                              <dd><a title="动漫/幽默" href="#"><span>海豚出版社</span></a></dd>
                              <dd><a title="艺术" href="#"><span>云南人民出版社</span></a></dd>
                              <dd><a title="摄影" href="#"><span>人民出版社</span></a></dd>
                              <dd><a title="偶像明星" href="#"><span>长江文艺出版社</span></a></dd>
                            </dl>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <b class="arrow"></b>
              </li>
              <li >
                <div class="category-info">
                  <h3 class="category-name b-category-name"><i><img src="../images/meat.png"></i><a class="ml-22" title="少儿">少儿</a></h3>
                  <em>&gt;</em></div>
                <div class="menu-item menu-in top">
                  <div class="area-in">
                    <div class="area-bg">
                      <div class="menu-srot">
                        <div class="menu-srot">
                          <div class="sort-side">
                            <dl class="dl-sort">
                              <dt><span title="儿童文学">儿童文学</span></dt>
                              <dd><a title="中小学教辅" href="#"><span>中小学教辅</span></a></dd>
                              <dd><a title="考试" href="#"><span>考试</span></a></dd>
                              <dd><a title="大中专教材" href="#"><span>大中专教材</span></a></dd>
                              <dd><a title="外语" href="#"><span>外语</span></a></dd>
                              <dd><a title="工具书" href="#"><span>工具书</span></a></dd>
                              <dd><a title="教师用书" href="#"><span>教师用书</span></a></dd>
                              <dd><a title="英语四六级" href="#"><span>英语四六级</span></a></dd>
                              <dd><a title="公务员" href="#"><span>公务员</span></a></dd>
                              <dd><a title="教师资格考试" href="#"><span>教师资格考试</span></a></dd>
                            </dl>
                            <dl class="dl-sort">
                              <dt><span title="绘本">绘本</span></dt>
                              <dd><a title="小说" href="#"><span>小说</span></a></dd>
                              <dd><a title="文学" href="#"><span>文学</span></a></dd>
                              <dd><a title="传记" href="#"><span>传记</span></a></dd>
                              <dd><a title="青春文学" href="#"><span>青春文学</span></a></dd>
                              <dd><a title="动漫/幽默" href="#"><span>动漫/幽默</span></a></dd>
                              <dd><a title="艺术" href="#"><span>艺术</span></a></dd>
                              <dd><a title="摄影" href="#"><span>摄影</span></a></dd>
                              <dd><a title="偶像明星" href="#"><span>偶像明星</span></a></dd>
                              <dd><a title="涂色/填色" href="#"><span>涂色/填色</span></a></dd>
                            </dl>

                          </div>
                          <div class="brand-side">
                            <dl class="dl-sort"><dt><span>出版社</span></dt>
                              <dd><a title="小说" href="#"><span>人民文学出版社</span></a></dd>
                              <dd><a title="文学" href="#"><span>现代出版社</span></a></dd>
                              <dd><a title="传记" href="#"><span>中华书局</span></a></dd>
                              <dd><a title="青春文学" href="#"><span>作家出版社</span></a></dd>
                              <dd><a title="动漫/幽默" href="#"><span>海豚出版社</span></a></dd>
                              <dd><a title="艺术" href="#"><span>云南人民出版社</span></a></dd>
                              <dd><a title="摄影" href="#"><span>人民出版社</span></a></dd>
                              <dd><a title="偶像明星" href="#"><span>长江文艺出版社</span></a></dd>
                            </dl>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <b class="arrow"></b>
              </li>
              <li >
                <div class="category-info">
                  <h3 class="category-name b-category-name"><i><img src="../images/bamboo.png"></i><a class="ml-22" title="艺术">艺术</a></h3>
                  <em>&gt;</em></div>
                <div class="menu-item menu-in top">
                  <div class="area-in">
                    <div class="area-bg">
                      <div class="menu-srot">
                        <div class="menu-srot">
                          <div class="sort-side">
                            <dl class="dl-sort">
                              <dt><span title="绘画">绘画</span></dt>
                              <dd><a title="中小学教辅" href="#"><span>中小学教辅</span></a></dd>
                              <dd><a title="考试" href="#"><span>考试</span></a></dd>
                              <dd><a title="大中专教材" href="#"><span>大中专教材</span></a></dd>
                              <dd><a title="外语" href="#"><span>外语</span></a></dd>
                              <dd><a title="工具书" href="#"><span>工具书</span></a></dd>
                              <dd><a title="教师用书" href="#"><span>教师用书</span></a></dd>
                              <dd><a title="英语四六级" href="#"><span>英语四六级</span></a></dd>
                              <dd><a title="公务员" href="#"><span>公务员</span></a></dd>
                              <dd><a title="教师资格考试" href="#"><span>教师资格考试</span></a></dd>
                            </dl>
                            <dl class="dl-sort">
                              <dt><span title="音乐">音乐</span></dt>
                              <dd><a title="小说" href="#"><span>小说</span></a></dd>
                              <dd><a title="文学" href="#"><span>文学</span></a></dd>
                              <dd><a title="传记" href="#"><span>传记</span></a></dd>
                              <dd><a title="青春文学" href="#"><span>青春文学</span></a></dd>
                              <dd><a title="动漫/幽默" href="#"><span>动漫/幽默</span></a></dd>
                              <dd><a title="艺术" href="#"><span>艺术</span></a></dd>
                              <dd><a title="摄影" href="#"><span>摄影</span></a></dd>
                              <dd><a title="偶像明星" href="#"><span>偶像明星</span></a></dd>
                              <dd><a title="涂色/填色" href="#"><span>涂色/填色</span></a></dd>
                            </dl>

                          </div>
                          <div class="brand-side">
                            <dl class="dl-sort"><dt><span>出版社</span></dt>
                              <dd><a title="小说" href="#"><span>人民文学出版社</span></a></dd>
                              <dd><a title="文学" href="#"><span>现代出版社</span></a></dd>
                              <dd><a title="传记" href="#"><span>中华书局</span></a></dd>
                              <dd><a title="青春文学" href="#"><span>作家出版社</span></a></dd>
                              <dd><a title="动漫/幽默" href="#"><span>海豚出版社</span></a></dd>
                              <dd><a title="艺术" href="#"><span>云南人民出版社</span></a></dd>
                              <dd><a title="摄影" href="#"><span>人民出版社</span></a></dd>
                              <dd><a title="偶像明星" href="#"><span>长江文艺出版社</span></a></dd>
                            </dl>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <b class="arrow"></b>
              </li>
              <li >
                <div class="category-info">
                  <h3 class="category-name b-category-name"><i><img src="../images/nut.png"></i><a class="ml-22" title="生活">生活</a></h3>
                  <em>&gt;</em></div>
                <div class="menu-item menu-in top">
                  <div class="area-in">
                    <div class="area-bg">
                      <div class="menu-srot">
                        <div class="menu-srot">
                          <div class="sort-side">
                            <dl class="dl-sort">
                              <dt><span title="美食">美食</span></dt>
                              <dd><a title="中小学教辅" href="#"><span>中小学教辅</span></a></dd>
                              <dd><a title="考试" href="#"><span>考试</span></a></dd>
                              <dd><a title="大中专教材" href="#"><span>大中专教材</span></a></dd>
                              <dd><a title="外语" href="#"><span>外语</span></a></dd>
                              <dd><a title="工具书" href="#"><span>工具书</span></a></dd>
                              <dd><a title="教师用书" href="#"><span>教师用书</span></a></dd>
                              <dd><a title="英语四六级" href="#"><span>英语四六级</span></a></dd>
                              <dd><a title="公务员" href="#"><span>公务员</span></a></dd>
                              <dd><a title="教师资格考试" href="#"><span>教师资格考试</span></a></dd>
                            </dl>
                            <dl class="dl-sort">
                              <dt><span title="旅游">旅游</span></dt>
                              <dd><a title="小说" href="#"><span>小说</span></a></dd>
                              <dd><a title="文学" href="#"><span>文学</span></a></dd>
                              <dd><a title="传记" href="#"><span>传记</span></a></dd>
                              <dd><a title="青春文学" href="#"><span>青春文学</span></a></dd>
                              <dd><a title="动漫/幽默" href="#"><span>动漫/幽默</span></a></dd>
                              <dd><a title="艺术" href="#"><span>艺术</span></a></dd>
                              <dd><a title="摄影" href="#"><span>摄影</span></a></dd>
                              <dd><a title="偶像明星" href="#"><span>偶像明星</span></a></dd>
                              <dd><a title="涂色/填色" href="#"><span>涂色/填色</span></a></dd>
                            </dl>

                          </div>
                          <div class="brand-side">
                            <dl class="dl-sort"><dt><span>出版社</span></dt>
                              <dd><a title="小说" href="#"><span>人民文学出版社</span></a></dd>
                              <dd><a title="文学" href="#"><span>现代出版社</span></a></dd>
                              <dd><a title="传记" href="#"><span>中华书局</span></a></dd>
                              <dd><a title="青春文学" href="#"><span>作家出版社</span></a></dd>
                              <dd><a title="动漫/幽默" href="#"><span>海豚出版社</span></a></dd>
                              <dd><a title="艺术" href="#"><span>云南人民出版社</span></a></dd>
                              <dd><a title="摄影" href="#"><span>人民出版社</span></a></dd>
                              <dd><a title="偶像明星" href="#"><span>长江文艺出版社</span></a></dd>
                            </dl>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <b class="arrow"></b>
              </li>
              <li >
                <div class="category-info">
                  <h3 class="category-name b-category-name"><i><img src="../images/candy.png"></i><a class="ml-22" title="文教">文教</a></h3>
                  <em>&gt;</em></div>
                <div class="menu-item menu-in top">
                  <div class="area-in">
                    <div class="area-bg">
                      <div class="menu-srot">
                        <div class="sort-side">
                          <dl class="dl-sort">
                            <dt><span title="外语">外语</span></dt>
                            <dd><a title="中小学教辅" href="#"><span>中小学教辅</span></a></dd>
                            <dd><a title="考试" href="#"><span>考试</span></a></dd>
                            <dd><a title="大中专教材" href="#"><span>大中专教材</span></a></dd>
                            <dd><a title="外语" href="#"><span>外语</span></a></dd>
                            <dd><a title="工具书" href="#"><span>工具书</span></a></dd>
                            <dd><a title="教师用书" href="#"><span>教师用书</span></a></dd>
                            <dd><a title="英语四六级" href="#"><span>英语四六级</span></a></dd>
                            <dd><a title="公务员" href="#"><span>公务员</span></a></dd>
                            <dd><a title="教师资格考试" href="#"><span>教师资格考试</span></a></dd>
                          </dl>
                          <dl class="dl-sort">
                            <dt><span title="教材">教材</span></dt>
                            <dd><a title="小说" href="#"><span>小说</span></a></dd>
                            <dd><a title="文学" href="#"><span>文学</span></a></dd>
                            <dd><a title="传记" href="#"><span>传记</span></a></dd>
                            <dd><a title="青春文学" href="#"><span>青春文学</span></a></dd>
                            <dd><a title="动漫/幽默" href="#"><span>动漫/幽默</span></a></dd>
                            <dd><a title="艺术" href="#"><span>艺术</span></a></dd>
                            <dd><a title="摄影" href="#"><span>摄影</span></a></dd>
                            <dd><a title="偶像明星" href="#"><span>偶像明星</span></a></dd>
                            <dd><a title="涂色/填色" href="#"><span>涂色/填色</span></a></dd>
                          </dl>

                        </div>
                        <div class="brand-side">
                          <dl class="dl-sort"><dt><span>出版社</span></dt>
                            <dd><a title="小说" href="#"><span>人民文学出版社</span></a></dd>
                            <dd><a title="文学" href="#"><span>现代出版社</span></a></dd>
                            <dd><a title="传记" href="#"><span>中华书局</span></a></dd>
                            <dd><a title="青春文学" href="#"><span>作家出版社</span></a></dd>
                            <dd><a title="动漫/幽默" href="#"><span>海豚出版社</span></a></dd>
                            <dd><a title="艺术" href="#"><span>云南人民出版社</span></a></dd>
                            <dd><a title="摄影" href="#"><span>人民出版社</span></a></dd>
                            <dd><a title="偶像明星" href="#"><span>长江文艺出版社</span></a></dd>
                          </dl>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <b class="arrow"></b>
              </li>
              <li >
                <div class="category-info">
                  <h3 class="category-name b-category-name"><i><img src="../images/chocolate.png"></i><a class="ml-22" title="古籍">古籍</a></h3>
                  <em>&gt;</em></div>
                <div class="menu-item menu-in top">
                  <div class="area-in">
                    <div class="area-bg">
                      <div class="menu-srot">
                        <div class="menu-srot">
                          <div class="sort-side">
                            <dl class="dl-sort">
                              <dt><span title="教育">教育</span></dt>
                              <dd><a title="中小学教辅" href="#"><span>中小学教辅</span></a></dd>
                              <dd><a title="考试" href="#"><span>考试</span></a></dd>
                              <dd><a title="大中专教材" href="#"><span>大中专教材</span></a></dd>
                              <dd><a title="外语" href="#"><span>外语</span></a></dd>
                              <dd><a title="工具书" href="#"><span>工具书</span></a></dd>
                              <dd><a title="教师用书" href="#"><span>教师用书</span></a></dd>
                              <dd><a title="英语四六级" href="#"><span>英语四六级</span></a></dd>
                              <dd><a title="公务员" href="#"><span>公务员</span></a></dd>
                              <dd><a title="教师资格考试" href="#"><span>教师资格考试</span></a></dd>
                            </dl>
                            <dl class="dl-sort">
                              <dt><span title="文艺">文艺</span></dt>
                              <dd><a title="小说" href="#"><span>小说</span></a></dd>
                              <dd><a title="文学" href="#"><span>文学</span></a></dd>
                              <dd><a title="传记" href="#"><span>传记</span></a></dd>
                              <dd><a title="青春文学" href="#"><span>青春文学</span></a></dd>
                              <dd><a title="动漫/幽默" href="#"><span>动漫/幽默</span></a></dd>
                              <dd><a title="艺术" href="#"><span>艺术</span></a></dd>
                              <dd><a title="摄影" href="#"><span>摄影</span></a></dd>
                              <dd><a title="偶像明星" href="#"><span>偶像明星</span></a></dd>
                              <dd><a title="涂色/填色" href="#"><span>涂色/填色</span></a></dd>
                            </dl>

                          </div>
                          <div class="brand-side">
                            <dl class="dl-sort"><dt><span>出版社</span></dt>
                              <dd><a title="小说" href="#"><span>人民文学出版社</span></a></dd>
                              <dd><a title="文学" href="#"><span>现代出版社</span></a></dd>
                              <dd><a title="传记" href="#"><span>中华书局</span></a></dd>
                              <dd><a title="青春文学" href="#"><span>作家出版社</span></a></dd>
                              <dd><a title="动漫/幽默" href="#"><span>海豚出版社</span></a></dd>
                              <dd><a title="艺术" href="#"><span>云南人民出版社</span></a></dd>
                              <dd><a title="摄影" href="#"><span>人民出版社</span></a></dd>
                              <dd><a title="偶像明星" href="#"><span>长江文艺出版社</span></a></dd>
                            </dl>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <b class="arrow"></b>
              </li>
              <li >
                <div class="category-info">
                  <h3 class="category-name b-category-name"><i><img src="../images/fish.png"></i><a class="ml-22" title="经济">经济</a></h3>
                  <em>&gt;</em></div>
                <div class="menu-item menu-in top">
                  <div class="area-in">
                    <div class="area-bg">
                      <div class="menu-srot">
                        <div class="menu-srot">
                          <div class="sort-side">
                            <dl class="dl-sort">
                              <dt><span title="教育">教育</span></dt>
                              <dd><a title="中小学教辅" href="#"><span>中小学教辅</span></a></dd>
                              <dd><a title="考试" href="#"><span>考试</span></a></dd>
                              <dd><a title="大中专教材" href="#"><span>大中专教材</span></a></dd>
                              <dd><a title="外语" href="#"><span>外语</span></a></dd>
                              <dd><a title="工具书" href="#"><span>工具书</span></a></dd>
                              <dd><a title="教师用书" href="#"><span>教师用书</span></a></dd>
                              <dd><a title="英语四六级" href="#"><span>英语四六级</span></a></dd>
                              <dd><a title="公务员" href="#"><span>公务员</span></a></dd>
                              <dd><a title="教师资格考试" href="#"><span>教师资格考试</span></a></dd>
                            </dl>
                            <dl class="dl-sort">
                              <dt><span title="文艺">文艺</span></dt>
                              <dd><a title="小说" href="#"><span>小说</span></a></dd>
                              <dd><a title="文学" href="#"><span>文学</span></a></dd>
                              <dd><a title="传记" href="#"><span>传记</span></a></dd>
                              <dd><a title="青春文学" href="#"><span>青春文学</span></a></dd>
                              <dd><a title="动漫/幽默" href="#"><span>动漫/幽默</span></a></dd>
                              <dd><a title="艺术" href="#"><span>艺术</span></a></dd>
                              <dd><a title="摄影" href="#"><span>摄影</span></a></dd>
                              <dd><a title="偶像明星" href="#"><span>偶像明星</span></a></dd>
                              <dd><a title="涂色/填色" href="#"><span>涂色/填色</span></a></dd>
                            </dl>

                          </div>
                          <div class="brand-side">
                            <dl class="dl-sort"><dt><span>出版社</span></dt>
                              <dd><a title="小说" href="#"><span>人民文学出版社</span></a></dd>
                              <dd><a title="文学" href="#"><span>现代出版社</span></a></dd>
                              <dd><a title="传记" href="#"><span>中华书局</span></a></dd>
                              <dd><a title="青春文学" href="#"><span>作家出版社</span></a></dd>
                              <dd><a title="动漫/幽默" href="#"><span>海豚出版社</span></a></dd>
                              <dd><a title="艺术" href="#"><span>云南人民出版社</span></a></dd>
                              <dd><a title="摄影" href="#"><span>人民出版社</span></a></dd>
                              <dd><a title="偶像明星" href="#"><span>长江文艺出版社</span></a></dd>
                            </dl>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <b class="arrow"></b>
              </li>
              <li >
                <div class="category-info">
                  <h3 class="category-name b-category-name"><i><img src="../images/tea.png"></i><a class="ml-22" title="悬疑推理">悬疑推理</a></h3>
                  <em>&gt;</em></div>
                <div class="menu-item menu-in top">
                  <div class="area-in">
                    <div class="area-bg">
                      <div class="menu-srot">
                        <div class="menu-srot">
                          <div class="sort-side">
                            <dl class="dl-sort">
                              <dt><span title="教育">教育</span></dt>
                              <dd><a title="中小学教辅" href="#"><span>中小学教辅</span></a></dd>
                              <dd><a title="考试" href="#"><span>考试</span></a></dd>
                              <dd><a title="大中专教材" href="#"><span>大中专教材</span></a></dd>
                              <dd><a title="外语" href="#"><span>外语</span></a></dd>
                              <dd><a title="工具书" href="#"><span>工具书</span></a></dd>
                              <dd><a title="教师用书" href="#"><span>教师用书</span></a></dd>
                              <dd><a title="英语四六级" href="#"><span>英语四六级</span></a></dd>
                              <dd><a title="公务员" href="#"><span>公务员</span></a></dd>
                              <dd><a title="教师资格考试" href="#"><span>教师资格考试</span></a></dd>
                            </dl>
                            <dl class="dl-sort">
                              <dt><span title="文艺">文艺</span></dt>
                              <dd><a title="小说" href="#"><span>小说</span></a></dd>
                              <dd><a title="文学" href="#"><span>文学</span></a></dd>
                              <dd><a title="传记" href="#"><span>传记</span></a></dd>
                              <dd><a title="青春文学" href="#"><span>青春文学</span></a></dd>
                              <dd><a title="动漫/幽默" href="#"><span>动漫/幽默</span></a></dd>
                              <dd><a title="艺术" href="#"><span>艺术</span></a></dd>
                              <dd><a title="摄影" href="#"><span>摄影</span></a></dd>
                              <dd><a title="偶像明星" href="#"><span>偶像明星</span></a></dd>
                              <dd><a title="涂色/填色" href="#"><span>涂色/填色</span></a></dd>
                            </dl>

                          </div>
                          <div class="brand-side">
                            <dl class="dl-sort"><dt><span>出版社</span></dt>
                              <dd><a title="小说" href="#"><span>人民文学出版社</span></a></dd>
                              <dd><a title="文学" href="#"><span>现代出版社</span></a></dd>
                              <dd><a title="传记" href="#"><span>中华书局</span></a></dd>
                              <dd><a title="青春文学" href="#"><span>作家出版社</span></a></dd>
                              <dd><a title="动漫/幽默" href="#"><span>海豚出版社</span></a></dd>
                              <dd><a title="艺术" href="#"><span>云南人民出版社</span></a></dd>
                              <dd><a title="摄影" href="#"><span>人民出版社</span></a></dd>
                              <dd><a title="偶像明星" href="#"><span>长江文艺出版社</span></a></dd>
                            </dl>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <b class="arrow"></b>
              </li>
              <li>
                <div class="category-info">
                  <h3 class="category-name b-category-name"><i><img src="../images/package.png"></i><a class="ml-22" title="法律">法律</a></h3>
                  <em>&gt;</em></div>
                <div class="menu-item menu-in top">
                  <div class="area-in">
                    <div class="area-bg">
                      <div class="menu-srot">
                        <div class="menu-srot">
                          <div class="sort-side">
                            <dl class="dl-sort">
                              <dt><span title="教育">教育</span></dt>
                              <dd><a title="中小学教辅" href="#"><span>中小学教辅</span></a></dd>
                              <dd><a title="考试" href="#"><span>考试</span></a></dd>
                              <dd><a title="大中专教材" href="#"><span>大中专教材</span></a></dd>
                              <dd><a title="外语" href="#"><span>外语</span></a></dd>
                              <dd><a title="工具书" href="#"><span>工具书</span></a></dd>
                              <dd><a title="教师用书" href="#"><span>教师用书</span></a></dd>
                              <dd><a title="英语四六级" href="#"><span>英语四六级</span></a></dd>
                              <dd><a title="公务员" href="#"><span>公务员</span></a></dd>
                              <dd><a title="教师资格考试" href="#"><span>教师资格考试</span></a></dd>
                            </dl>
                            <dl class="dl-sort">
                              <dt><span title="文艺">文艺</span></dt>
                              <dd><a title="小说" href="#"><span>小说</span></a></dd>
                              <dd><a title="文学" href="#"><span>文学</span></a></dd>
                              <dd><a title="传记" href="#"><span>传记</span></a></dd>
                              <dd><a title="青春文学" href="#"><span>青春文学</span></a></dd>
                              <dd><a title="动漫/幽默" href="#"><span>动漫/幽默</span></a></dd>
                              <dd><a title="艺术" href="#"><span>艺术</span></a></dd>
                              <dd><a title="摄影" href="#"><span>摄影</span></a></dd>
                              <dd><a title="偶像明星" href="#"><span>偶像明星</span></a></dd>
                              <dd><a title="涂色/填色" href="#"><span>涂色/填色</span></a></dd>
                            </dl>

                          </div>
                          <div class="brand-side">
                            <dl class="dl-sort"><dt><span>出版社</span></dt>
                              <dd><a title="小说" href="#"><span>人民文学出版社</span></a></dd>
                              <dd><a title="文学" href="#"><span>现代出版社</span></a></dd>
                              <dd><a title="传记" href="#"><span>中华书局</span></a></dd>
                              <dd><a title="青春文学" href="#"><span>作家出版社</span></a></dd>
                              <dd><a title="动漫/幽默" href="#"><span>海豚出版社</span></a></dd>
                              <dd><a title="艺术" href="#"><span>云南人民出版社</span></a></dd>
                              <dd><a title="摄影" href="#"><span>人民出版社</span></a></dd>
                              <dd><a title="偶像明星" href="#"><span>长江文艺出版社</span></a></dd>
                            </dl>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

              </li>

              <!--比较多的导航	-->
              <li >
                <div class="category-info">
                  <h3 class="category-name b-category-name"><i><img src="../images/cookies.png"></i><a class="ml-22" title="世界名著">世界名著</a></h3>
                  <em>&gt;</em></div>
                <div class="menu-item menu-in top">
                  <div class="area-in">
                    <div class="area-bg">
                      <div class="menu-srot">
                        <div class="sort-side">
                          <dl class="dl-sort">
                            <dt><span title="教育">教育</span></dt>
                            <dd><a title="中小学教辅" href="#"><span>中小学教辅</span></a></dd>
                            <dd><a title="考试" href="#"><span>考试</span></a></dd>
                            <dd><a title="大中专教材" href="#"><span>大中专教材</span></a></dd>
                            <dd><a title="外语" href="#"><span>外语</span></a></dd>
                            <dd><a title="工具书" href="#"><span>工具书</span></a></dd>
                            <dd><a title="教师用书" href="#"><span>教师用书</span></a></dd>
                            <dd><a title="英语四六级" href="#"><span>英语四六级</span></a></dd>
                            <dd><a title="公务员" href="#"><span>公务员</span></a></dd>
                            <dd><a title="教师资格考试" href="#"><span>教师资格考试</span></a></dd>
                          </dl>
                          <dl class="dl-sort">
                            <dt><span title="文艺">文艺</span></dt>
                            <dd><a title="小说" href="#"><span>小说</span></a></dd>
                            <dd><a title="文学" href="#"><span>文学</span></a></dd>
                            <dd><a title="传记" href="#"><span>传记</span></a></dd>
                            <dd><a title="青春文学" href="#"><span>青春文学</span></a></dd>
                            <dd><a title="动漫/幽默" href="#"><span>动漫/幽默</span></a></dd>
                            <dd><a title="艺术" href="#"><span>艺术</span></a></dd>
                            <dd><a title="摄影" href="#"><span>摄影</span></a></dd>
                            <dd><a title="偶像明星" href="#"><span>偶像明星</span></a></dd>
                            <dd><a title="涂色/填色" href="#"><span>涂色/填色</span></a></dd>
                          </dl>

                        </div>
                        <div class="brand-side">
                          <dl class="dl-sort"><dt><span>出版社</span></dt>
                            <dd><a title="小说" href="#"><span>人民文学出版社</span></a></dd>
                            <dd><a title="文学" href="#"><span>现代出版社</span></a></dd>
                            <dd><a title="传记" href="#"><span>中华书局</span></a></dd>
                            <dd><a title="青春文学" href="#"><span>作家出版社</span></a></dd>
                            <dd><a title="动漫/幽默" href="#"><span>海豚出版社</span></a></dd>
                            <dd><a title="艺术" href="#"><span>云南人民出版社</span></a></dd>
                            <dd><a title="摄影" href="#"><span>人民出版社</span></a></dd>
                            <dd><a title="偶像明星" href="#"><span>长江文艺出版社</span></a></dd>
                          </dl>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <b class="arrow"></b>
              </li>
              <li >
                <div class="category-info">
                  <h3 class="category-name b-category-name"><i><img src="../images/meat.png"></i><a class="ml-22" title="文学理论">文学理论</a></h3>
                  <em>&gt;</em></div>
                <div class="menu-item menu-in top">
                  <div class="area-in">
                    <div class="area-bg">
                      <div class="menu-srot">
                        <div class="sort-side">
                          <dl class="dl-sort">
                            <dt><span title="教育">教育</span></dt>
                            <dd><a title="中小学教辅" href="#"><span>中小学教辅</span></a></dd>
                            <dd><a title="考试" href="#"><span>考试</span></a></dd>
                            <dd><a title="大中专教材" href="#"><span>大中专教材</span></a></dd>
                            <dd><a title="外语" href="#"><span>外语</span></a></dd>
                            <dd><a title="工具书" href="#"><span>工具书</span></a></dd>
                            <dd><a title="教师用书" href="#"><span>教师用书</span></a></dd>
                            <dd><a title="英语四六级" href="#"><span>英语四六级</span></a></dd>
                            <dd><a title="公务员" href="#"><span>公务员</span></a></dd>
                            <dd><a title="教师资格考试" href="#"><span>教师资格考试</span></a></dd>
                          </dl>
                          <dl class="dl-sort">
                            <dt><span title="文艺">文艺</span></dt>
                            <dd><a title="小说" href="#"><span>小说</span></a></dd>
                            <dd><a title="文学" href="#"><span>文学</span></a></dd>
                            <dd><a title="传记" href="#"><span>传记</span></a></dd>
                            <dd><a title="青春文学" href="#"><span>青春文学</span></a></dd>
                            <dd><a title="动漫/幽默" href="#"><span>动漫/幽默</span></a></dd>
                            <dd><a title="艺术" href="#"><span>艺术</span></a></dd>
                            <dd><a title="摄影" href="#"><span>摄影</span></a></dd>
                            <dd><a title="偶像明星" href="#"><span>偶像明星</span></a></dd>
                            <dd><a title="涂色/填色" href="#"><span>涂色/填色</span></a></dd>
                          </dl>

                        </div>
                        <div class="brand-side">
                          <dl class="dl-sort"><dt><span>出版社</span></dt>
                            <dd><a title="小说" href="#"><span>人民文学出版社</span></a></dd>
                            <dd><a title="文学" href="#"><span>现代出版社</span></a></dd>
                            <dd><a title="传记" href="#"><span>中华书局</span></a></dd>
                            <dd><a title="青春文学" href="#"><span>作家出版社</span></a></dd>
                            <dd><a title="动漫/幽默" href="#"><span>海豚出版社</span></a></dd>
                            <dd><a title="艺术" href="#"><span>云南人民出版社</span></a></dd>
                            <dd><a title="摄影" href="#"><span>人民出版社</span></a></dd>
                            <dd><a title="偶像明星" href="#"><span>长江文艺出版社</span></a></dd>
                          </dl>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <b class="arrow"></b>
              </li>
              <li >
                <div class="category-info">
                  <h3 class="category-name b-category-name"><i><img src="../images/bamboo.png"></i><a class="ml-22" title="哲学宗教">哲学/宗教</a></h3>
                  <em>&gt;</em></div>
                <div class="menu-item menu-in top">
                  <div class="area-in">
                    <div class="area-bg">
                      <div class="menu-srot">
                        <div class="sort-side">
                          <dl class="dl-sort">
                            <dt><span title="教育">教育</span></dt>
                            <dd><a title="中小学教辅" href="#"><span>中小学教辅</span></a></dd>
                            <dd><a title="考试" href="#"><span>考试</span></a></dd>
                            <dd><a title="大中专教材" href="#"><span>大中专教材</span></a></dd>
                            <dd><a title="外语" href="#"><span>外语</span></a></dd>
                            <dd><a title="工具书" href="#"><span>工具书</span></a></dd>
                            <dd><a title="教师用书" href="#"><span>教师用书</span></a></dd>
                            <dd><a title="英语四六级" href="#"><span>英语四六级</span></a></dd>
                            <dd><a title="公务员" href="#"><span>公务员</span></a></dd>
                            <dd><a title="教师资格考试" href="#"><span>教师资格考试</span></a></dd>
                          </dl>
                          <dl class="dl-sort">
                            <dt><span title="文艺">文艺</span></dt>
                            <dd><a title="小说" href="#"><span>小说</span></a></dd>
                            <dd><a title="文学" href="#"><span>文学</span></a></dd>
                            <dd><a title="传记" href="#"><span>传记</span></a></dd>
                            <dd><a title="青春文学" href="#"><span>青春文学</span></a></dd>
                            <dd><a title="动漫/幽默" href="#"><span>动漫/幽默</span></a></dd>
                            <dd><a title="艺术" href="#"><span>艺术</span></a></dd>
                            <dd><a title="摄影" href="#"><span>摄影</span></a></dd>
                            <dd><a title="偶像明星" href="#"><span>偶像明星</span></a></dd>
                            <dd><a title="涂色/填色" href="#"><span>涂色/填色</span></a></dd>
                          </dl>

                        </div>
                        <div class="brand-side">
                          <dl class="dl-sort"><dt><span>出版社</span></dt>
                            <dd><a title="小说" href="#"><span>人民文学出版社</span></a></dd>
                            <dd><a title="文学" href="#"><span>现代出版社</span></a></dd>
                            <dd><a title="传记" href="#"><span>中华书局</span></a></dd>
                            <dd><a title="青春文学" href="#"><span>作家出版社</span></a></dd>
                            <dd><a title="动漫/幽默" href="#"><span>海豚出版社</span></a></dd>
                            <dd><a title="艺术" href="#"><span>云南人民出版社</span></a></dd>
                            <dd><a title="摄影" href="#"><span>人民出版社</span></a></dd>
                            <dd><a title="偶像明星" href="#"><span>长江文艺出版社</span></a></dd>
                          </dl>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <b class="arrow"></b>
              </li>
            </ul>
          </div>
        </div>

      </div>
    </div>
    <!--导航 -->
    <script type="text/javascript">
        (function() {
            $('.am-slider').flexslider();
        });
        $(document).ready(function() {
            $("li").hover(function() {
                $(".category-content .category-list li.first .menu-in").css("display", "none");
                $(".category-content .category-list li.first").removeClass("hover");
                $(this).addClass("hover");
                $(this).children("div.menu-in").css("display", "block")
            }, function() {
                $(this).removeClass("hover")
                $(this).children("div.menu-in").css("display", "none")
            });
        })
    </script>





    <!--各类活动-->
    <div class="row">
      <li><a href="#"><img src="../images/bookphoto_03.jpg" style="margin-top:250px"/></a></li>
      <li><a href="#"><img src="../images/bookphoto_03.jpg" style="margin-top:250px"/></a></li>
      <li><a href="#"><img src="../images/bookphoto_03.jpg" style="margin-top:250px"/></a></li>
      <li><a href="#"><img src="../images/bookphoto_04.jpg" style="margin-top:20px"/></a></li>
    </div>
    <div class="clear"></div>
    <!--走马灯 -->

    <div class="marqueenTwo">
      <span class="marqueen-title"><i class="am-icon-volume-up am-icon-fw"></i>图书畅销榜<em class="am-icon-angle-double-right"></em></span>
      <div class="demo">

        <ul>
          <li class="title-first"><a target="_blank" href="#" title="古西行记选拔-西北史地资料丛书">
            <span style="color:red">01</span> 古西行记选拔-西北史地资料丛书
          </a></li>
          <li class="title-first"><a target="_blank" href="#" title="1688年的全球史--一个非凡年代里的中国与世界">
            <span style="color:red">02</span> 1688年的全球史--一个非凡年代里的中国与世界
          </a></li>
          <li><a target="_blank" href="#" title="哲学的慰藉"><span style="color:red">03</span> 哲学的慰藉	</a></li>
          <li><a target="_blank" href="#" title="帝鉴图说"><span style="color:red">05</span> 帝鉴图说</a></li>
          <li><a target="_blank" href="#" title="平妖传：第一部 在妖怪家那边"><span style="color:red">06</span> 平妖传：第一部 在妖怪家那边</a></li>
          <li><a target="_blank" href="#" title="神秘的风水-中华神秘文化"><span style="color:red">07</span> 神秘的风水-中华神秘文化</a></li>
          <li><a target="_blank" href="#" title="宫变-中国历史上最具影响力的宫廷政变"><span style="color:red">08</span> 宫变-中国历史上最具影响力的宫廷政变</a></li>

        </ul>

      </div>
    </div>
    <div class="clear"></div>

  </div>



  <script type="text/javascript">
      if ($(window).width() < 640) {
          function autoScroll(obj) {
              $(obj).find("ul").animate({
                  marginTop: "-39px"
              }, 500, function() {
                  $(this).css({
                      marginTop: "0px"
                  }).find("li:first").appendTo(this);
              })
          }
          $(function() {
              setInterval('autoScroll(".demo")', 3000);
          })
      }
  </script>
</div>




<div class="footer ">

  <div class="footer-bd ">
    <p>
      <em>&nbsp;&nbsp;&nbsp;&nbsp;计算机161班XXX小组制作&nbsp;&nbsp;&nbsp;我们的联系方式为：aaaaaa****@jk161.com</em>
    </p>
  </div>
</div>
</div>
</div>
</div>
</div>

<script>
    window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
</script>
<script type="text/javascript " src="../basic/js/quick_links.js "></script>
</body>

</html>
