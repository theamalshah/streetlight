<?php

require "common/header.php";
require 'dbconnect.php';
session_start();


$qry = "SELECT user_id,fname,lname,email,gender,sec_que,address,city,state,is_active FROM user_register_tbl WHERE is_active!=2";
$rs = mysqli_query($conn,$qry);


?>    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="dashboard.php">Cyber Shade</a> 
            </div>
              <div style="color: white;padding: 15px 50px 5px 50px;float: right;font-size: 16px;">  
                <a href="logout.php" class="btn btn-danger square-btn-adjust">Logout</a> 
              </div>
      </nav>  
<?php
  require "common/navigation.php";
?> 
          <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Manage User</h2>  
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                  <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             USER TABLE
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Fname</th>
                                            <th>Lname</th>
                                            <th>Email</th>
                                            <th>Gender</th>
                                            <th>Security Question</th>
                                              <th>Address</th>
                                            <th>City</th>
                                            <th>State</th>
                                            <th>In/Active</th>
                                            <th>Action</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                            <?php
                                                                
                            if(mysqli_num_rows($rs) > 0)
                                {
                                    while($row = mysqli_fetch_assoc($rs))
                                {
                            ?>
                                <tbody>
                                    <tr class="odd gradeX">
                                        <td><?php echo $row['user_id']; ?></td>
                                        <td><?php echo $row['fname'];?></td>
                                        <td><?php echo $row['lname'];?></td>
                                        <td><?php echo $row['email'];?></td>
                                        <td><?php echo $row['gender'];?></td>
                                        <td><?php echo $row['sec_que'];?></td>
                                        <td><?php echo $row['address'];?></td>
                                        <td><?php echo $row['city'];?></td>
                                        <td><?php echo $row['state'];?></td>
                                        <th><?php if($row['is_active']==1){echo "Active";}else{echo "Blocked";} ?></th>
                                        <td><a href="actionuser.php?user_id=<?php echo $row['user_id']; ?>&status=<?php echo $row['is_active']; ?>">Change</a></td>
                                       
                                        <td><a href="deleteuser.php?user_id=<?php echo $row['user_id']; ?>">Delete</a></td>
                                    </tr>
                            <?php   }
                                }
                                else
                                {
                                echo "0 Rows Returned!";
                                }
                            ?>
                                            
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
        </div>
    </div> 
     <!-- /. WRAPPER  -->
    <?php require "common/footer.php"; 
  #}
  #  else{
   #       header("location:login.php");
     ?>