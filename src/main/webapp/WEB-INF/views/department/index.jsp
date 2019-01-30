<%@include file="../header.jsp" %>

<div class="pull-right">
    <p>
        <a href="${SITE_URL}/department/add" class="btn btn-primary">
            <span class="glyphicon glyphicon-plus"/>
        </a> 
    </p>
</div>
<table class="table table-bordered table-hover table-striped">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Added Date</th>
        <th>Modified Date</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
    <c:forEach var="dept" items="${requestScope.departments}">
        <tr>
            <td>${dept.id}</td>
            <td>${dept.name}</td>
            <td>${dept.addedDate}</td>
            <td>${dept.modifiedDate}</td>
            <td>
                <c:choose>
                    <c:when test= "${dept.status}">
                        <span class="label label-success">Active</span> 
                    </c:when>  
                    <c:otherwise>
                        <span class="label label-danger">Inactive</span> 
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <a href="${SITE_URL}/department/edit?id=${dept.id}" class="btn btn-success btn-sm" >
                    <span class="glyphicon glyphicon-pencil"/></a>
                    <a href="${SITE_URL}/department/delete?id=${dept.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure to delete?')" >
                        <span class="glyphicon glyphicon-trash"/> </a>
            </td>
        </tr>
    </c:forEach>
</table>
<%@include file="../header.jsp" %>