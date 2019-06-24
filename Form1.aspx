<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form1.aspx.cs" Inherits="WebPageTestOne.Form1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript" src="http://m.shenguang.com.cn/zysj/Content/Scripts/jquery-1.8.2.min.js"></script>
    <script src="css/jquery.cookie.js"></script>
    <script src="css/jquery.validate.min.js"></script>
    <script src="css/layui/lay/dest/layui.all.js"></script>
    <link href="css/layui/css/layui.css" rel="stylesheet" />
    <style type="text/css">
        
        .mybtn {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 16px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            -webkit-transition-duration: 0.4s; /* Safari */
            transition-duration: 0.4s;
            cursor: pointer;
        }
        table {
            border: 1px solid black;
        }
			.table1{
                
				width: auto;
				height:90px;
			}
			.tr1{
				background: #dbe3fa;
                width: 20px;
				height:10px;
			}
			tr:nth-child(even) {background-color: #f2f2f2;}
		</style>

     <script type="text/javascript">
         var n = 1;
         function LoadMore() {
             n = n + 1;
             $(function () {
                 $.ajax({
                     url: "GiveAll.ashx",
                     type: "POST",
                     async: false,
                     datatype: "json",
                     success: function (result) {

                         var sun = {};
                         sun = JSON.parse(result);
                         var trStr = "";
                         for (var i = 20 * (n - 1) ; 20 * (n - 1) <= i && i < 20 * n; i++) {
                             trStr += "<tr>";
                             trStr += "<td>" + sun[i].ZhuHaoID + "</td>";
                             trStr += "<td>" + sun[i].JieHaoID + "</td>";
                             trStr += "<td>" + sun[i].ServerID + "</td>";
                             trStr += "<td>" + sun[i].ListID + "</td>";
                             trStr += "<td>" + sun[i].PhoneStyle + "</td>";
                             trStr += "<td>" + sun[i].BeiZhu + "</td>";
                             trStr += "<td>" + sun[i].StartTime + "</td>";
                             trStr += "<td>" + sun[i].EndTime + "</td>";
                             trStr += "<td>" + sun[i].DateTime + "</td>";
                             trStr += "<td>" + sun[i].PhoneTime + "</td>";
                             trStr += "<td>" + sun[i].PhoneTimeOne + "</td>";
                             trStr += "<td>" + sun[i].PhoneTimeTwo + "</td>";
                             trStr += "<td>" + sun[i].PhoneTimeThree + "</td>";
                             trStr += "<td>" + sun[i].PhoneTimeMouth + "</td>";
                             trStr += "<td>" + sun[i].Weak + "</td>";
                             trStr += "<td>" + sun[i].HangYe + "</td>";
                             trStr += "<td>" + sun[i].YesOrNo + "</td>";
                             trStr += "<td>" + sun[i].WhereFrom + "</td>";
                             trStr += "<td>" + sun[i].Content + "</td>";
                             trStr += "<td>" + sun[i].Company + "</td>";
                             trStr += "</tr>";
                             
                         }

                         $("#morestrong").append(trStr);//运用html方法将拼接的table添加到tbody中return;
                     },
                     error: function (error) {
                         //alert(error);
                     }
                 })
             })
         }

     </script>
</head>
<body>
    <form id="form1" runat="server">

   
   <div>
       <asp:FileUpload ID="FileUpload1" runat="server" Style="visibility: hidden" onchange="Text1.value=this.value"/>
       <div style="text-align: center;">
       <input id="Text1" type="text" style="" readonly="readonly" value="选择Excel文件路径" />
       <input id="Button3" type="button" value="选择文件" class="layui-btn" onclick="FileUpload1.click()" />
       <asp:Button class="layui-btn" ID="lbtnSure_Click" runat="server" Text="确定上传" OnClick="Button1_Click" />
       <asp:Button class="layui-btn" ID="Button1" runat="server" Text="确定下载" OnClick="Button2_Click" />
       <asp:Button class="layui-btn" ID="Button2" runat="server" Text="确定下载指定表" OnClick="Button3_Click" />
       </div>
   </div>
         <h2 style = "margin:0px ;color:red">最新记录</h2>
        <div class="dbt_a" id ="stronger" style ="overflow: auto; height: 750px;">   
             
            <div id ="test" style="">
                <table id ="morestrong" class="layui-table" border: 1px solid black; cellspacing="0px" cellpadding="8px"  >

			<tr class="tr1">
                <th>主叫号</th>
				<th>接入号</th>
				<th>服务号</th>
				<th>清单号</th>
				<th>电话类型</th>
				<th>备注</th>	
                <th>开始时间</th>
				<th>结束时间</th>
				<th>日期</th>
                <th>通话时长(分)</th>
				<th>通话时长(秒)</th>
				<th>时长(秒)</th>
                <th>时刻</th>
				<th>月份</th>
				<th>星期</th>
                <th>行业</th>
                <th>是否监听</th>
				<th>数据来源</th>
				<th>监听详情</th>
                <th>公司名</th>	
			</tr>
                    
			<%for (int i = 0; i < show.Rows.Count; i++){%>
                    <tr>
                        <td><% =show.Rows[i]["ZhuHaoID"]%></td>
                        <td><% =show.Rows[i]["JieHaoID"]%></td>
                        <td><% =show.Rows[i]["ServerID"]%></td>
                        <td><% =show.Rows[i]["ListID"]%></td>
                        <td><% =show.Rows[i]["PhoneStyle"]%></td>
                        <td><% =show.Rows[i]["BeiZhu"]%></td>
                        <td><% =show.Rows[i]["StartTime"]%></td>
                        <td><% =show.Rows[i]["EndTime"]%></td>
                        <td><% =show.Rows[i]["DateTime"]%></td>
                        <td><% =show.Rows[i]["PhoneTime"]%></td>
                        <td><% =show.Rows[i]["PhoneTimeOne"]%></td>
                        <td><% =show.Rows[i]["PhoneTimeTwo"]%></td>
                        <td><% =show.Rows[i]["PhoneTimeThree"]%></td>
                        <td><% =show.Rows[i]["PhoneTimeMouth"]%></td>
                        <td><% =show.Rows[i]["Weak"]%></td>
                        <td><% =show.Rows[i]["HangYe"]%></td>
                        <td><% =show.Rows[i]["YesOrNo"]%></td>
                        <td><% =show.Rows[i]["WhereFrom"]%></td>
                        <td><% =show.Rows[i]["Content"]%></td>
                        <td><% =show.Rows[i]["Company"]%></td>

                    </tr>
                    <% }%>
                        
		</table>
            </div>
   </div>
    <div class="title_txt_more" style ="text-align: center;margin:8px;" ><a href="javascript:void(0);"  style ="text-decoration:none;pointer-events:painted;" onclick ="LoadMore()">点击加载更多</a></div>
    </form>
</body>
</html>
