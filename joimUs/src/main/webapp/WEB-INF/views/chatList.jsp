<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="./modal/chatRoom.jsp"%>
<head>
<!-- <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="/resources/js/chat.js"></script> -->
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="/resources/js/chat.js"></script>
</head>
<!------ Include the above in your HEAD tag ---------->
<body>
	<div class="container">
	    <div class="row form-group">
	        <div class="col-xs-12 col-md-offset-2 col-md-8 col-lg-8 col-lg-offset-2">
	            <div class="panel panel-primary">
	                <div class="panel-heading">
	                    <span class="glyphicon glyphicon-comment"></span> 채팅리스트
	                </div>
	                <div class="panel-body body-panel">
	                    <ul class="chat">
<%-- 	                        <li class="left clearfix"><span class="chat-img pull-left">
	                            <img src="http://placehold.it/50/55C1E7/fff&text=U" alt="User Avatar" class="img-circle" />
	                        </span>
	                            <div class="chat-body clearfix">
	                                <div class="header">
	                                    <strong class="primary-font">Jack Sparrow</strong> <small class="pull-right text-muted">
	                                        <span class="glyphicon glyphicon-time"></span>12 mins ago</small>
	                                </div>
	                                <p>
	                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare
	                                    dolor, quis ullamcorper ligula sodales.${user.userId} 
	                                </p>
	                            </div>
	                        </li> --%>
	                        <%int i=1; %>
	                        <c:forEach items="${list  }" var="list">
	                        <% i++; %>
								<li class="left clearfix"><span class="chat-img pull-left">
									<c:if test="${list.sender == user.userId}">
									<img src="${list.userImage}" alt="User Avatar" class="img-circle" style="margin-right:15px;" height="50" width="50"/>
									</c:if>
									<c:if test="${list.sender != user.userId}">
										<img src="${list.selfImage}" alt="User Avatar" class="img-circle" style="margin-right:15px;" height="50" width="50"/>
									</c:if>
	                        		</span>
	                            	<div class="chat-body clearfix" id="chat<%=i %>" ondblclick="openChatRoom('${list.chatRoomNum}','${user.userId}')" onmouseover="mouseOver(<%=i%>)" onmouseout="mouseOut(<%=i%>)" >
	                                	<div class="header" style="margin-bottom:6px;">
	                                		<c:if test="${list.sender == user.userId}">
											<strong class="primary-font">${list.recipient}</strong> <small class="pull-right text-muted">
											<span class="glyphicon glyphicon-time"></span>${list.updateDate} </small>
											</c:if>
											<c:if test="${list.sender != user.userId}">
												<strong class="primary-font">${list.sender}</strong> <small class="pull-right text-muted">
												<span class="glyphicon glyphicon-time"></span>${list.updateDate} </small>
											</c:if>
	                                    	
	                                        	
	                                	</div>
	                                	<p>
	                                    	${list.message} 
	                                    	<c:if test="${list.sender ne user.userId && list.readYN eq 'N'}"> 
	                                    		<small class="pull-right text-red" >                                    			                                    	<svg  xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-arrow-up" viewBox="0 0 16 16">
													  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v4.5a.5.5 0 0 1-1 0V5.383l-7 4.2-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h5.5a.5.5 0 0 1 0 1H2a2 2 0 0 1-2-1.99zm1 7.105 4.708-2.897L1 5.383zM1 4v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1"/>
													  <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.354-5.354 1.25 1.25a.5.5 0 0 1-.708.708L13 12.207V14a.5.5 0 0 1-1 0v-1.717l-.28.305a.5.5 0 0 1-.737-.676l1.149-1.25a.5.5 0 0 1 .722-.016"/>
													</svg>
	                                    		</small>
	                                    	</c:if>
	                                    	
	                                    	<c:if test="${list.sender eq user.userId && list.readYN eq 'R'}"> 
	                                    		<small class="pull-right text-red" >                                    			                                    	<svg   xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-arrow-up" viewBox="0 0 16 16">
													  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v4.5a.5.5 0 0 1-1 0V5.383l-7 4.2-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h5.5a.5.5 0 0 1 0 1H2a2 2 0 0 1-2-1.99zm1 7.105 4.708-2.897L1 5.383zM1 4v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1"/>
													  <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.354-5.354 1.25 1.25a.5.5 0 0 1-.708.708L13 12.207V14a.5.5 0 0 1-1 0v-1.717l-.28.305a.5.5 0 0 1-.737-.676l1.149-1.25a.5.5 0 0 1 .722-.016"/>
													</svg>
	                                    		</small>
	                                    	</c:if>
	                                    	
		                                </p>
	    	                        </div>
	        	                </li>
	                        </c:forEach>
	                        
	                        
	                    </ul>
	                </div>
	                
	            </div>
	        </div>
	    </div>
	</div>
	
</body>

