<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf8">
	<title>Все операции по контрактам. BalanceSystem</title>

	<link rel="icon" href="<c:url value="/pages/img/favicon.ico" />" type="image/x-icon">


	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<!-- Bootstrap core CSS -->
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
	<%--<link href="<c:url value="/pages/css/bootstrap.css" />" rel="stylesheet">--%>
	<link href="<c:url value="/pages/css/main.css" />" rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
		  rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>




	<%--DatePicker JA and CSS--%>
	<%--<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.4.5/jquery.datetimepicker.min.css"  rel="stylesheet">--%>
	<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.4.5/jquery.datetimepicker.min.js"></script>--%>
	<link href="<c:url value="/pages/css/bootstrap-datetimepicker.min.css" />" rel="stylesheet">


	<%--<script--%>
	<%--src="<c:url value="/pages/js/jquery.js" />"></script>--%>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="https://storage.googleapis.com/code.getmdl.io/1.0.4/material.min.js"></script>
	<%--<link href="<c:url value="/pages/js/bootstrap.js" />" rel="text/javascript">--%>


	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script> -->


</head>
<body>
<%@include file="header.jsp" %>

<fmt:setLocale value="uk_UA" scope="session"/>
<c:if test="${error}">
	<div class="alert alert-warning alert-dismissible" role="alert">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<strong>Внимание!</strong> ${error} .
	</div>
</c:if>


<div class="container">





	<div class="page-header">

		<h2>Операции по департаментам</h2>
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">

			<li role="presentation"  class="active">
				<a href="#contract" aria-controls="contract" role="tab" data-toggle="tab" id="contract-tab"><i style="vertical-align:middle; font-size: 2em;" class="material-icons">work</i>Выбор по контракту</a></li>
			<li role="presentation">
				<a href="#department" aria-controls="department" role="tab" data-toggle="tab" id="department-tab"><i style="vertical-align:middle; font-size: 2em;" class="material-icons">business</i>Выбор по департаменту</a></li>
			<li role="presentation">
				<a href="#all" aria-controls="all" role="tab" data-toggle="tab" id="all-tab"><i style="vertical-align:middle; font-size: 2em;" class="material-icons">view_module</i>Отображение всех</a></li>

		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="contract" aria-labelledby="contract-tab">


				<h2>Выбор записей по контракту </h2>
				<div class="hidden" id="currentContract"><%= request.getParameter("contractId") %></div>

				<form:form method="get" action="alloperdept"  class="form-inline" name="contraсtsList">

					<select name="contractId" class="form-control" id="contractId">

						<c:forEach items="${contraсtsList}" var="contragent" varStatus="myIndex">
							<option value="${contragent.id}">№${contragent.contractNumber} | ${contragent.startDate} | ${contragent.description}</option>
						</c:forEach>

					</select>
					<button type="submit" class="btn btn-success text-center">Поиск</button>
				</form:form>





			</div>
			<div role="tabpanel" class="tab-pane" id="department" aria-labelledby="department-tab">


				<h2>Выбор записей по департаменту </h2>
				<div class="hidden" id="currentDepartment"><%= request.getParameter("departmentId") %></div>

				<form:form method="get" action="alloperdept"  class="form-inline" name="departmentsList">

					<select name="departmentId" class="form-control" id="departmentId">

						<c:forEach items="${departmentsList}" var="dep" varStatus="myIndex">
							<option value="${dep.id}" >${dep.nameOfDepartment}</option>
						</c:forEach>


					</select>
					<button type="submit" class="btn btn-success text-center">Поиск</button>
				</form:form>



			</div>
			<div role="tabpanel" class="tab-pane" id="all" aria-labelledby="all-tab">


				<h2>Отображение всех записей</h2>

				<form:form method="get" action="alloperdept"  class="form-inline">

					<input hidden="true" name="all" value="1"/>

					<button type="submit" class="btn btn-success  btn-lg">Показать</button>
				</form:form>




			</div>

		</div>

	</div>




	<c:if test="${!empty itogForDepartments}">

		<h2>Итоги по Департаменту <c:if test="${!empty department}">${department.nameOfDepartment}</c:if> </h2>

		<table class="table table-responsive table-striped">
			<tr>
				<th>#</th>
				<th>Контракт</th>
				<th>Кол-во операций</th>
				<th>Сумма</th>
				<th>НДС</th>
			</tr>
			<tbody>
			<c:forEach items="${itogForDepartments}" var="itorDep" varStatus="myIndex">
				<tr>
					<td>${myIndex.index + 1}</td>
					<td>№${itorDep.contracts.contractNumber} от <fmt:formatDate pattern="dd.MM.yyyy"
																				value="${itorDep.contracts.startDate}" /><br/>(${itorDep.contracts.contrAgentId.name})</td>
					<td>${itorDep.countOfOperations}</td>
					<td><fmt:formatNumber value="${itorDep.summa}"
										  type="currency" currencyCode="UAH" /></td>
					<td><fmt:formatNumber value="${itorDep.ndc}"
										  type="currency" currencyCode="UAH" /></td>
				</tr>


			</c:forEach>
			<tr class="info">
				<td></td>
				<td>ИТОГО:</td>
				<td>${count}</td>
				<td><fmt:formatNumber value="${summa}"
									  type="currency" currencyCode="UAH"/></td>
				<td><fmt:formatNumber value="${ndc}"
									  type="currency"
									  currencyCode="UAH"/></td>
			</tr>
			</tbody>

		</table>


	<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
		Показать все записи
	</button>
	<div class="collapse" id="collapseExample">
		<div class="well container ">


	</c:if>






	<c:if test="${!empty itogForContracts}">

		<h2>Итоги по Контракту<c:if test="${!empty contract}"> №${contract.contractNumber} от <fmt:formatDate pattern="dd.MM.yyyy"
																											   value="${contract.startDate}" /><br/>(${contract.contrAgentId.name})</c:if></h2>

		<table class="table table-responsive table-striped">
			<tr>
				<th>#</th>
				<th>Департамент</th>
				<th>Кол-во операций</th>
				<th>Сумма</th>
				<th>НДС</th>
			</tr>
			<tbody>
			<c:forEach items="${itogForContracts}" var="itorContract" varStatus="myIndex">
				<tr>
					<td>${myIndex.index + 1}</td>
					<td>${itorContract.departments.nameOfDepartment}</td>
					<td>${itorContract.countOfOperations}</td>
					<td><fmt:formatNumber value="${itorContract.summa}"
										   type="currency" currencyCode="UAH" /></td>
					<td><fmt:formatNumber value="${itorContract.ndc}"
										   type="currency" currencyCode="UAH" /></td>
				</tr>


			</c:forEach>
			<tr class="info">
				<td></td>
				<td>ИТОГО:</td>
				<td>${count}</td>
				<td><fmt:formatNumber value="${summa}"
									  type="currency" currencyCode="UAH"/></td>
				<td><fmt:formatNumber value="${ndc}"
									  type="currency"
									  currencyCode="UAH"/></td>
			</tr>
			</tbody>

		</table>


		<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
			Показать все записи
		</button>
		<div class="collapse" id="collapseExample">
			<div class="well container ">


	</c:if>





	<c:if test="${!empty operDepartmentList}">
	<div class="container">
		<h2>Список  операций</h2>
		<c:if test="${!empty type}">
			<h3>${type}</h3>
		</c:if>


		<c:if test="${summa != 0}">

			<div >


				<h2 class="text-success">Итого: <fmt:formatNumber value="${summa}"
																  type="currency"
																  currencyCode="UAH"/></h2>
				<h2 class="text-danger">НДС: <fmt:formatNumber value="${ndc}"
															   type="currency"
															   currencyCode="UAH"/></h2>

			</div>
		</c:if>

		<table class="table table-condensed table-responsive col-xs-11 col-sm-8 col-md-11">
			<tr>
				<th>#</th>
				<th>Дата время</th>
				<th>Департамент</th>
				<th>Контракт</th>
				<th>Сумма, грн</th>
				<th>НДС, грн</th>
				<th>Описание</th>


			</tr>
			<c:forEach items="${operDepartmentList}" var="operDepartment" varStatus="myIndex">
				<tr>
					<td>${myIndex.index + 1}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
										value="${operDepartment.time}" /></td>
					<td>${operDepartment.departmentId.nameOfDepartment}</td>
					<td>${operDepartment.receptOpContrId.contractId.contractNumber}</td>

					<td>
						<fmt:formatNumber value="${operDepartment.summa}"
										  type="currency" currencyCode="UAH" />
										  </td>
					<td><fmt:formatNumber value="${operDepartment.ndc}"
										  type="currency" currencyCode="UAH"/></td>
					<td>${operDepartment.description}</td>
				</tr>
			</c:forEach>
		</table>


		</c:if>

	</div>

</div>

		</div>
</div>
<script type="text/javascript" src="<c:url value="/pages/js/bootstrap-datetimepicker.min.js" />" charset="UTF-8"></script>
<script type="text/javascript" src="<c:url value="/pages/js/bootstrap-datetimepicker.ru.js" />" charset="UTF-8"></script>
<script type="text/javascript" src="<c:url value="/pages/js/bootbox.min.js" />" charset="UTF-8"></script>
<script type="text/javascript">
	$('#${tab}-tab').tab('show')



	bootbox.addLocale('my',
			{
				OK : 'OK',
				CANCEL : 'Отменить',
				CONFIRM : 'Удалить'
			}
	);


	bootbox.setLocale('my');

	$(document).on("click", ".confirm-modal", function(e) {
		e.preventDefault();
		var lHref = $(this).attr('href');
		if(lHref !== 'undefined') {
			bootbox.confirm("Вы точно хотите удалить данную запись?",
					function (result) {
						if (result) {
							window.location.href = lHref;
						}
					});
		}
	});



</script>
<script>

	var contractId = document.getElementById("currentContract").textContent;
	var select = document.getElementById("contractId");

	var i;
	for (i = 0; i < select.length; i++) {
		if (select.options[i].value  == contractId){
			select.options[i].selected = true;

		}
	}


</script>

<script>

	var departmentId = document.getElementById("currentDepartment").textContent;
	var select = document.getElementById("departmentId");

	var i;
	for (i = 0; i < select.length; i++) {
		if (select.options[i].value  == departmentId){
			select.options[i].selected = true;

		}
	}


</script>




</body>
</html>