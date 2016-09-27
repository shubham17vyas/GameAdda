<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
				<div>
					<div class="featured">
						<div>
							<h2>We Are The <br/> Champions</h2>
							<p>
								We provide the best games at best rate.
							</p>
						</div>
					</div>
					<div>
						<div>
							<h3>Latest Videos</h3>
							
							<ul>
								<li>
									<iframe width="200" height="220" src="https://www.youtube.com/embed/tadSLTW7td4" frameborder="0" allowfullscreen></iframe>
									<h4>Batman Akhram Knight</h4>
									
								</li>
								<li>
									<iframe width="200" height="220" src="https://www.youtube.com/embed/XH9fCA3dmGc" frameborder="0" allowfullscreen></iframe>
									<h4>Skyrim Online</h4>
									
								</li>
								<li>
									<iframe width="200" height="220" src="https://www.youtube.com/embed/x4QJBxolFUU" frameborder="0" allowfullscreen></iframe>
									<h4>HALO: NightFall</h4>
								
								</li>
							</ul>
						</div>
						<div>
							<h3>Featured Games</h3>
							<span><%--<a href="news.html">--%><%--</a>--%></span>
							<ul>
								<li>
									 <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Featured.aspx"><asp:Image ID="Image3" runat="server" Height="152" Width="200" ImageUrl="images/featured1.jpg" /></asp:HyperLink>
									<h4>Thief</h4>
									<p>
										Thief is a stealth video game developed by Eidos Montreal, and released in November 2015 for the PlayStation 3, PlayStation 4, Xbox 360.
									</p>
								</li>
								<li>
								 <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Featured.aspx"><asp:Image ID="Image2" runat="server" Height="152" Width="200" ImageUrl="images/featured2.png" /></asp:HyperLink>								
                                    	<h4>Tom Clancy's The Division</h4>
									<p>
										Tom Clancy's The Division is an upcoming open world third-person shooter role-playing video game with survival elements developed by Ubisoft.									</p>
								</li>
								<li>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Featured.aspx"><asp:Image ID="Image1" runat="server" Height="152" Width="200" ImageUrl="images/featured3.jpg" /></asp:HyperLink>
									<h4>Game of Thrones</h4>
									<p>
										Game Based on very popular TV Series Game of Thrones.
									</p>
								</li>
							</ul>
						</div>
					</div>
				</div>

				
			

</asp:Content>

