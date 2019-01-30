

<%@include file="../header.jsp" %>
<h1>Add Department</h1>

<form action="${SITE_URL}/department/save" method="post">
    <div class="form-group">
        <label>Name:</label>
        <input type="text" name="dept_name" required="required" placeholder="Enter Department Name" class="form-control"/>
        </div>
    <div class="form-group">
        <label>Description</label>
        <textarea name="dept_desc" required="required" placeholder="Enter Department Description" class="form-control"></textarea>
        </div>
     <div class="checkbox">
        <label>Status</label>
        <label>
            <input type="checkbox" name="status" />Active</label>
        </div>
    <input type="hidden" name="id" />
    <button type="submit" class="btn btn-success">Save</button>
    <a href="${SITE_URL}/department" class="btn btn-danger">Back</a>
    
</form>

<%@include file="../footer.jsp" %>