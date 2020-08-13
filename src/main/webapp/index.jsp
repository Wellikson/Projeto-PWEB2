<%-- 
    Document   : index
    Created on : 24 de abr de 2020, 15:37:43
    Author     : wellikson
--%>

            <%@ include file="WEB-INF/jsp/template/header.jsp" %> 
        <main role="main">
            <br>
            <br>
            <br>
            <br>
            <br>
            <div class="container mt-3">
  <h2>Modal Example</h2>
  <!-- Button to Open the Modal -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    Open modal
  </button>

  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Modal body..
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>

        </main>


   <%@ include file="WEB-INF/jsp/template/footer.jsp" %>