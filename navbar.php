<style>
    /* Sidebar text styling */
    #sidebar .sidebar-menu li a {
        font-size: 14px !important;
        font-weight: normal !important;
    }
</style>

<nav id="sidebar" class="mx-lt-5 bg-black">
    <div class="sidebar-list ">
		<div class="user-panel">
        <div class="pull-left image">
          <img src="<?php echo (!empty($user['photo'])) ? './images/'.$user['photo'] : './images/profile.jpg'; ?>" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><?php echo $user['firstname'].' '.$user['lastname']; ?></p>
          <a><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
        <ul class="sidebar-menu" data-widget="tree">

            <li><a href="index.php?page=home" class="nav-item nav-home text-white"><i class="fa fa-home"></i> Dashboard</a></li>

            <li><a href="index.php?page=employee" class="nav-item text-white"><i class="fa fa-users"></i> Employee Details</a></li>
            <li><a href="index.php?page=payroll" class="nav-item nav-payroll text-white"><i class="fa fa-running"></i> Payroll Process</a></li>
            <li><a href="index.php?page=department" class="nav-item nav-department text-white"><i class="fa fa-desktop"></i> Departments</a></li>
            <li><a href="index.php?page=position" class="nav-item nav-position text-white"><i class="fa fa-suitcase"></i> Positions</a></li>

            <!-- Payroll Elements submenu -->
            <li class="treeview bg-black">
                <a href="#" class="text-white">
                    <i class="fa fa-cogs"></i> <span>Payroll Elements</span>
                    <span class="pull-right-container"><i class="fa fa-angle-right pull-right text-white"></i></span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?page=allowances" class="text-white"><i class="fa fa-list"></i> Allowances</a></li>
                    <li><a href="index.php?page=deductions" class="text-white"><i class="fa fa-money-bill-wave"></i> Deductions</a></li>
                </ul>
            </li>

            <?php if ($_SESSION['login_type'] == 1): ?>
            <!-- Security submenu -->
            <li class="treeview bg-black">
                <a href="#" class="text-white">
                    <i class="fa fa-network-wired"></i> <span>SECURITY</span>
                    <span class="pull-right-container"><i class="fa fa-angle-right pull-right text-white"></i></span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?page=users" class="text-white"><i class="fa fa-user-shield"></i> Users</a></li>
                </ul>
            </li>
            <?php endif; ?>

            <!-- Reports submenu -->
            <li class="treeview bg-black">
                <a href="#" class="text-white">
                    <i class="fa fa-file-export"></i> <span>Reports</span>
                    <span class="pull-right-container"><i class="fa fa-angle-right pull-right text-white"></i></span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?page=employee_list" class="text-white"><i class="fa fa-book-open"></i> All Employee List</a></li>
					<li><a href="index.php?page=employee_list" class="text-white"><i class="fa fa-book-open"></i> All Payroll Run</a></li>
                    
                </ul>
            </li>

        </ul>
    </div>
</nav>

<script>
    // Highlight active menu
    $('.nav-<?php echo isset($_GET['page']) ? $_GET['page'] : '' ?>').addClass('active');

    // Enable treeview dropdown toggle
    $('.treeview > a').on('click', function (e) {
        e.preventDefault();
        let $parent = $(this).parent();

        if ($parent.hasClass('menu-open')) {
            $parent.removeClass('menu-open').children('.treeview-menu').slideUp();
        } else {
            $('.treeview').removeClass('menu-open').children('.treeview-menu').slideUp();
            $parent.addClass('menu-open').children('.treeview-menu').slideDown();
        }
    });
</script>
