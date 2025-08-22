<?php
include 'db_connect.php';

// Fetch data
$payroll = $conn->query("SELECT p.*, p.salary, concat(e.lastname,', ',e.firstname,' ',e.middlename) as ename,e.employee_no 
    FROM payroll_items p 
    INNER JOIN employee e ON e.id = p.employee_id 
    INNER join payroll pay on pay.id = p.payroll_id 
    WHERE p.id=" . $_GET['id']);
$data = $payroll->fetch_assoc();
extract($data);

$pay = $conn->query("SELECT * FROM payroll WHERE id = " . $payroll_id)->fetch_assoc();
$pt = array(1 => "Monthly", 2 => "Semi-Monthly");

$all_qry = $conn->query("SELECT * FROM allowances");
while ($row = $all_qry->fetch_assoc()) {
    $all_arr[$row['id']] = $row['allowance'];
}

$ded_qry = $conn->query("SELECT * FROM deductions");
while ($row = $ded_qry->fetch_assoc()) {
    $ded_arr[$row['id']] = $row['deduction'];
}

// Build HTML
ob_start();
?>
<style>
    body { font-family: helvetica; font-size: 13px; }
    h2, h4, h5 { margin: 0; padding: 3px 0; }
    .divider { border-bottom: 1px solid #000; margin: 5px 0; }
    table { border-collapse: collapse; width: 100%; margin-top: 5px; }
    th, td { border: 1px solid #000; padding: 5px; }
    .section-title { background-color: #f2f2f2; font-weight: bold; }
    .logo { text-align:center; margin-bottom:10px; }
</style>

<div class="logo">
    <img src="images/lascon.jpg" width="100">
</div>

<h4>Employee Payslip</h4>
<h5><b>Employee ID: </b> <?php echo $employee_no; ?></h5>
<h5><b>Name: </b> <?php echo ucwords($ename); ?></h5>
<div class="divider"></div>

<table>
    <tr>
        <td><b>Payroll Ref</b></td>
        <td><?php echo $pay['ref_no']; ?></td>
    </tr>
    <tr>
        <td><b>Payroll Range</b></td>
        <td><?php echo date("M d, Y", strtotime($pay['date_from'])) . " - " . date("M d, Y", strtotime($pay['date_to'])); ?></td>
    </tr>
    <tr>
        <td><b>Payroll Type</b></td>
        <td><?php echo $pt[$pay['type']]; ?></td>
    </tr>
    <!-- <tr>
        <td><b>Days Absent</b></td>
        <td><?php echo $absent; ?></td>
    </tr>
    <tr>
        <td><b>Tardy/Undertime (mins)</b></td>
        <td><?php echo $late; ?></td>
    </tr> -->
    <tr>
        <td><b>Total Allowances</b></td>
        <td><?php echo number_format($allowance_amount, 2); ?></td>
    </tr>
    <tr>
        <td><b>Total Deductions</b></td>
        <td><?php echo number_format($deduction_amount, 2); ?></td>
    </tr>
    <tr>
        <td><b>Basic Salary</b></td>
        <td><?php echo number_format($salary, 2); ?></td>
    </tr>
    <tr>
        <td><b>Net Pay</b></td>
        <td><b><?php echo number_format($net, 2); ?></b></td>
    </tr>
</table>

<h4>Allowances</h4>
<table>
    <tr class="section-title">
        <th>Allowance</th>
        <th>Amount</th>
    </tr>
    <?php foreach (json_decode($allowances) as $val): ?>
    <tr>
        <td><?php echo $all_arr[$val->aid] . " Allowance"; ?></td>
        <td align="right"><?php echo number_format($val->amount, 2); ?></td>
    </tr>
    <?php endforeach; ?>
</table>

<h4>Deductions</h4>
<table>
    <tr class="section-title">
        <th>Deduction</th>
        <th>Amount</th>
    </tr>
    <?php foreach (json_decode($deductions) as $val): ?>
    <tr>
        <td><?php echo $ded_arr[$val->did]; ?></td>
        <td align="right"><?php echo number_format($val->amount, 2); ?></td>
    </tr>
    <?php endforeach; ?>
</table>
<?php
$html = ob_get_clean();

if (isset($_GET['format']) && $_GET['format'] == 'pdf') {
    require_once('tcpdf/tcpdf.php');
    $pdf = new TCPDF('P', 'mm', 'A4', true, 'UTF-8', false);
    $pdf->SetCreator(PDF_CREATOR);
    $pdf->SetAuthor('Your Company');
    $pdf->SetTitle('Payslip');
    $pdf->SetMargins(10, 10, 10);
    $pdf->setPrintHeader(false);
    $pdf->setPrintFooter(false);
    $pdf->AddPage();
    $pdf->writeHTML($html, true, false, true, false, '');
    $pdf->Output('payslip.pdf', 'I');
    exit; // make sure nothing else is sent
} else {
    echo $html;
    //echo '<br><a href="view_payslip.php?id=' . $_GET['id'] . '&format=pdf" class="btn btn-sm btn-info">Download PDF</a>';
    echo '<br><a href="view_payslip.php?id=' . $_GET['id'] . '&format=pdf" target="_blank" class="btn btn-sm btn-info">Download PDF</a>';
}


