

<%@include file="../header.jsp" %>
<h1>Edit Department</h1>

<form action="${SITE_URL}/department/save" method="post">
    <div class="form-group">
        <label>Name:</label>
        <input type="text" name="dept_name" required="required" placeholder="Enter Department Name" class="form-control" value="${department.name}"/>
        </div>
    <div class="form-group">
        <label>Description</label>
        <textarea name="dept_desc" required="required" placeholder="Enter Department Description" class="form-control">${department.description}</textarea>
        </div>
     <div class="checkbox">
        <label>Status</label>
        <label>
            <input type="checkbox" name="status"
                   <c:if test="${department.status}">
                       checked="checked"
            </c:if>
                   Active</label>
        </div>
    <input type="hidden" name="id" value="${department.id}"/>
    <button type="submit" class="btn btn-success">Save</button>
    <a href="${SITE_URL}/department" class="btn btn-danger">Back</a>
    
</form>

<%@include file="../footer.jsp" %>