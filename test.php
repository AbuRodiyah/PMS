<?php
// Path to TCPDF
require_once('tcpdf/tcpdf.php'); // Change path if TCPDF is in a different location

// Create new PDF document
$pdf = new TCPDF();
$pdf->AddPage();

// Add some text
$pdf->SetFont('helvetica', '', 14);
$pdf->Write(0, 'TCPDF is working correctly!', '', 0, 'L', true, 0, false, false, 0);

// Output PDF (inline in browser)
$pdf->Output('test.pdf', 'I');
?>
