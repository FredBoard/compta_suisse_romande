<?php
session_start();
if(!isset($_SESSION['login'])) {
include('GAR_input.php');
exit;
}?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   <title>Plan comptable pdf</title>
  </head>
  <body>

<?php
include( "ZZZ_GAR_Local_def.php"  );  // definition des variables locales
include( "GAR_Master_def.php"  );     // definition des variables globales
include( "GAR_entete.php"   );        // Nous appelons l'entete du site
include( "GAR_menu.php" );            // Nous appelons notre menu

////////////////////////////////////////////////////////////
	  
$BID = 1 ;
$year = 2024 ;	  
$nb_de_page_totales=0 ; // le 14.11.2024    // 0=ignore, pas d impression	
	  
////////////////////////////////////////////////////////////	  
	
$font                   = 'Arial';
$compta_journal         = 'Compta_V4_Plan_comptable_BID'.$BID.'' ;	  
$pdf_journal            = ''.PDFdir.''.$compta_journal.'.pdf';	  
	
$a                 = 0    ; // initialisation
$b                 = 0    ; // initialisation
$page              = 0    ; // initialisation	  
$y_ldep            = 25   ; // Premiere ligne a 25 mm
$y_shift           = 4    ; // 4 mm entre chaque ligne
$x_col_dep         = 7    ; 
$col_1_nr          = 8    ;
$nb_ecritures      = 60   ; // ecritures par page MAX 28 en forme Landscape , apres la mise en page explose.	
	  
$pdfr=new \Fpdf\Fpdf('P', 'mm', 'A4'); // attention class modifiee pour ajouter les cercles et rotations
$pdfr->SetAuthor('frederic.ducommun@reboard.io');
$pdfr->SetCreator('ducommun.info');
$pdfr->SetFillColor(210);
$pdfr->SetFont('Arial','',8);		  
add_page_plan_comptable();
	  	  
/////////////////////////////////////////////////////////////
$flag_A_P_old="";$flag_grp_old="";$flag_cat_old="";	
	  
$sql110  = 'SELECT * FROM  r_plan_comptable WHERE 1= 1 ' ;
$sql110 .= 'AND BID = '.$BID.' AND id_compta > 999  ';
$sql110 .= 'order by id_compta ' ;	
$con110   = mysqli_connect(SQLServer,GAR_user,GAR_pwd,GAR_db); $res110 = mysqli_query($con110, $sql110);  
	  
while ($dat110 = mysqli_fetch_assoc($res110)) 
 {
  $flag_A_P_new = utf8_encode($dat110['bilan_A_P']) ;
  $flag_grp_new = utf8_encode($dat110['bilan_grp']) ;
  $flag_cat_new = utf8_encode($dat110['bilan_cat']) ;
 
  $bilan_A_P = utf8_encode($dat110['bilan_A_P']) ;
  $bilan_grp = utf8_encode($dat110['bilan_grp']) ;
  $bilan_cat = utf8_encode($dat110['bilan_cat']) ;
  $compte   = utf8_encode($dat110['compte']) ;
	
  if ( $dat110['id_compta'] >= 3000 ) { $fil=false;} else { $fil=true; }	
	
  if ( $flag_A_P_new <> $flag_A_P_old ) 
  { 
	  $a++ ;$y_pos = ($y_ldep + ( $a * $y_shift ));$flag_A_P_old =  $flag_A_P_new ;
	  $pdfr->SetXY(8,$y_pos);	$pdfr->Cell(192,$y_shift,utf8_decode($flag_A_P_new),1,0,'L',$fil);
	  //echo '<br><b>'.$fil.'   * '.$flag_A_P_new.'</b>' ;
  } 
	
  if ( $flag_grp_new <> $flag_grp_old )
  {
	  if ( $flag_cat_new <> 'na' )
	  {
	   $a = $a + 0.5 ;
	   $a++ ;$y_pos = ($y_ldep + ( $a * $y_shift ));$flag_grp_old =  $flag_grp_new ;
	   $pdfr->SetXY(28,$y_pos);	$pdfr->Cell(172,$y_shift,utf8_decode($flag_grp_new),1,0,'L',$fil);
	   echo '<br><b>**'.$flag_grp_new.'</b>' ;
	  }
  } 	
  
  if ( $flag_cat_new <> $flag_cat_old )
  {
	  if ( $flag_cat_new <> 'na' )
	  {
	   $a = $a + 0.5 ;
	   $a++ ;$y_pos = ($y_ldep + ( $a * $y_shift ));$flag_cat_old =  $flag_cat_new ;
	   $pdfr->SetXY(48,$y_pos);	$pdfr->Cell(152,$y_shift,utf8_decode($flag_cat_new),1,0,'L',$fil);
	   echo '<br><b>***'.$flag_cat_new.'</b>';
	  }
  }
  
	$a++ ;$y_pos = ($y_ldep + ( $a * $y_shift ));
	//echo '<br>****'.$dat110['id_compta'].' => '.$compte.'  ' ;
	if ( check_id_compta($dat110['id_compta'])  ) {
	$pdfr->SetFont('Arial', 'B', 8);	
	$pdfr->SetXY(48,$y_pos);	$pdfr->Cell(10,$y_shift,utf8_decode($dat110['id_compta']),0,0,'C',false);
    $pdfr->SetXY(60,$y_pos);	$pdfr->Cell(130,$y_shift,utf8_decode($compte),0,0,'L',false);
	}
	else
	{
	$pdfr->SetXY(48,$y_pos);	$pdfr->Cell(10,$y_shift,utf8_decode($dat110['id_compta']),0,0,'C',false);
    $pdfr->SetXY(60,$y_pos);	$pdfr->Cell(130,$y_shift,utf8_decode($compte),0,0,'L',false);	
	}
    $pdfr->SetFont('Arial', '', 8);	
			
 
  if ( $a >= $nb_ecritures  ) 
   {
	$flag_A_P_old="";$flag_grp_old="";$flag_cat_old="";	
    add_page_plan_comptable(); $a = 0 ;
   } else { $pdfr->SetXY($x_col_dep,$y_ldep) ; $pdfr->Line (8   ,$y_ldep +$y_shift  , 200 ,$y_ldep+$y_shift);}  
}	  

////////////////////////////////////////////////////////////////////////////////////////////////////
	  
/////////////////////////////////////////////////////////////
	
/*	  
$a++ ; $a++ ;	  
$sql111  = 'SELECT * FROM  r_plan_comptable WHERE 1= 1 ' ;
$sql111 .= 'AND BID = '.$BID.' AND id_compta > 3000  ';
$sql111 .= 'order by id_compta ' ;	
$con111  = mysqli_connect(SQLServer,GAR_user,GAR_pwd,GAR_db); $res111 = mysqli_query($con111, $sql111);  
$a++ ;$y_pos = ($y_ldep + ( $a * $y_shift ));	  
$pdfr->SetXY(8,$y_pos);	$pdfr->Cell(192,$y_shift,utf8_decode('Comptes de résultats'),1,0,'L',false);
// echo '<br> 109 => '.$sql111.'  ' ;	
	  
while ($dat111 = mysqli_fetch_assoc($res111)) 
{
  //echo '<br>****'.$dat111['id_compta'].' => '.$compte.'  ' ;
  $compte   = utf8_encode($dat111['compte']) ;	 
  $a++ ;$y_pos = ($y_ldep + ( $a * $y_shift ));
  $pdfr->SetXY(48,$y_pos);	$pdfr->Cell(10,$y_shift,utf8_decode($dat111['id_compta']),0,0,'C',false);
  $pdfr->SetXY(60,$y_pos);	$pdfr->Cell(130,$y_shift,utf8_decode($compte),0,0,'L',false);	

 if ( $a >= $nb_ecritures  ) 
   {
	$flag_resultat_old="";	
    add_page_plan_comptable(); $a = 0 ;
   } else { $pdfr->SetXY($x_col_dep,$y_ldep) ; $pdfr->Line (8   ,$y_ldep +$y_shift  , 200 ,$y_ldep+$y_shift);}  
} 	  

*/ 
$pdfr->close();	  
	  
////////////////////////////////////////////////////////////////////////////////////////////////////	  

$pdfr->Output('F',''.$pdf_journal.'');	
echo '<br>'.$pdf_journal.' ';

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////	  
function add_page_plan_comptable()
{
global $nb_de_page_totales,$pdfr,$page,$font,$x_col_dep,$y_ldep,$col_1_nr,$y_shift,$rep_r,$rep_d,$page,$y_ldep,$year ;
$pdfr->AddPage();	  
$page++ ;
$pdfr->SetXY(8,8);  $pdfr->Cell(0,4,utf8_decode('Reboard Sàrl'),0,0,'L');
$pdfr->SetXY(8,12); $pdfr->Cell(0,4,utf8_decode('CHE-464.402.219 IDE'),0,0,'L');	
//$pdfr->SetXY(5,16); $pdfr->Cell(0,4,utf8_decode('Frédéric Ducommun-dit-Verron'),0,0,'L');	
$pdfr->SetXY(8,16); $pdfr->Cell(0,4,utf8_decode('Rue de l\'arsenal 25'),0,0,'L');	
$pdfr->SetXY(8,20); $pdfr->Cell(0,4,utf8_decode('2502 Bienne'),0,0,'L');

$pdfr->SetXY(8,12);  $pdfr->Cell(0,4,'Plan comptable',0,0,'C');
if ($nb_de_page_totales <> 0) {$pagex=''.$page.'/'.$nb_de_page_totales.'';} else { $pagex=''.$page.'';}	
$pdfr->SetXY(8,16); $pdfr->Cell(0,4,'page '.$pagex.'',0,0,'C');		
	
//$pdfr->SetXY(5,8);  $pdfr->Cell(0,4,'Bienne, le '.date('d.m.Y').'',0,0,'R');
$pdfr->SetXY(8,8);  $pdfr->Cell(0,4,'Bienne, le 31.12.'.$year.'',0,0,'R');	

$pdfr->SetXY(8,16); $pdfr->Cell(0,4,'frederic.ducommun@reboard.io',0,0,'R');
$pdfr->SetXY(8,20); $pdfr->Cell(0,4,utf8_decode('079 292 32 06'),0,0,'R');
	
 if ( $page == 1 )
  {
  $pdfr->SetXY(214,$y_ldep) ; $pdfr->Cell(24 ,$y_shift,"Comptes",0,0,'C');              // Seulement sur première page
  $pdfr->SetXY(238,$y_ldep) ; $pdfr->Cell(24 ,$y_shift,utf8_decode("Débit"),0,0,'R');   // Seulement sur première page
  $pdfr->SetXY(262,$y_ldep) ; $pdfr->Cell(24 ,$y_shift,utf8_decode("Crédit"),0,0,'R');  // Seulement sur première page
  }
		
$pdfr->SetFont($font,'',8);
}

////////////////////////////////////////////////////////////////////////////////////////////////////	  
function check_id_compta($id_compta)
{
global $nb_de_page_totales,$pdfr,$page,$font,$x_col_dep,$y_ldep,$col_1_nr,$y_shift,$rep_r,$rep_d,$page,$y_ldep,$year,$BID ;	  
$sql120  = 'SELECT * FROM  r_compta_journal WHERE 1= 1 ' ;
$sql120 .= 'AND BID = '.$BID.' AND exercice = \''.$year.'\'  ';
$sql120 .= 'AND ((compte_credit= '.$id_compta.') OR (compte_debit='.$id_compta.'))' ;	
$con120   = mysqli_connect(SQLServer,GAR_user,GAR_pwd,GAR_db); $res120 = mysqli_query($con120, $sql120);  
if (mysqli_num_rows($res120)  <> 0  ) {$used=true;} else {$used=false;}	
//echo '<br>  '.$sql120.' '.$used.' ';
return($used);
}	
	  
?>	  
  </body>
</html>