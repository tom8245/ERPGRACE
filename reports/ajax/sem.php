<?php
    include('../../includes/config.php');
$c =  $_POST['c'];
$d =  $_POST['d'];
$s =  $_POST['s'];
print_r($s);
$cc = "SELECT distinct ce_exam,erp_createexam.ce_id FROM erp_mark
LEFT JOIN erp_exam
ON erp_exam.exam_id = erp_mark.exam_id
LEFT JOIN erp_class
ON erp_mark.cls_id = erp_class.cls_id
LEFT JOIN erp_createexam
ON erp_mark.ce_id = erp_createexam.ce_id
LEFT JOIN erp_subject
ON erp_exam.tt_subcode = erp_subject.tt_subcode where cls_course='$c' AND cls_dept='$d' AND cls_sem='$s'";
$cq = mysqli_query($con, $cc);
$output = '<option value="">--Select--</option>';
while ($cr = mysqli_fetch_assoc($cq)) {
    $output .= '<option dept="' . $d . '" course="' . $c . '" sem="' . $s . '" en="' . $cr['ce_exam'] . '" ceid="' . $cr['ce_id'] . '">' . $cr['ce_exam'] . '</option>';
}
echo $output;