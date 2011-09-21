<div id="content"  class="map">
<?php 
$basearray = $database->getMInfo($_GET['d']);


?>
<h1><?php echo !$basearray['occupied']? !$basearray['fieldtype']? "Unoccupied oasis" : "Abandoned valley" : $basearray['name']; echo " (".$basearray['x']."|".$basearray['y'].")"; ?></h1>
<?php if($basearray['occupied'] && $basearray['capital']) { echo "<div id=\"dmain\">(capital)</div>"; } ?>

<img src="img/x.gif" id="detailed_map" class="<?php echo ($basearray['fieldtype'] == 0)? 'w'.$basearray['oasistype'] : 'f'.$basearray['fieldtype'] ?>" alt="<?php 
switch($basearray['fieldtype']) {
case 1:
$tt =  "3-3-3-9";
break;
case 2:
$tt =  "3-4-5-6";
break;
case 3:
$tt =  "4-4-4-6";
break;
case 4:
$tt =  "4-5-3-6";
break;
case 5:
$tt =  "5-3-4-6";
break;
case 6:
$tt =  "1-1-1-15";
break;
case 7:
$tt =  "4-4-3-7";
break;
case 8:
$tt =  "3-4-4-7";
break;
case 9:
$tt =  "4-3-4-7";
break;
case 10:
$tt =  "3-5-4-6";
break;
case 11:
$tt =  "4-3-5-6";
break;
case 12:
$tt =  "5-4-3-6";
break;
case 0:
switch($basearray['oasistype']) {
case 1:
case 2:
$tt =  "+25% odun üretimi\" title=\"+25% odun üretimi";
break;
case 3:
$tt =  "+25% odun üretim ve +25% tahıl üretimi\" title=\"+25% odun üretim ve +25% tahıl üretimi";
break;
case 4:
case 5:
$tt =  "+25% tuğla üretimi\" title=\"+25% tuğla üretimi";
break;
case 6:
$tt =  "+25% tuğla ve +25% tahıl üretimi\" title=\"+25% tuğla ve +25% tahıl üretimi";
break;
case 7:
case 8:
$tt =  "+25% demir üretimi\" title=\"+25% demir üretimi";
break;
case 9:
$tt =  "+25% demir ve +25% tahıl üretimi\" title=\"+25% demir ve +25% tahıl üretimi";
break;
case 10:
case 11:
$tt =  "+25% tahıl üretimi\" title=\"+25% tahıl üretimi";
break;
case 12:
$tt =  "+50% tahıl üretimi\" title=\"+50% tahıl üretimi";
break;
}
break;
}
echo $tt."\"";
$landd = explode("-",$tt);?> />

<div id="map_details">
<?php if($basearray['fieldtype'] == 0) {
?>
<table cellpadding="1" cellspacing="1" id="troop_info" class="tableNone">
            <thead><tr>
                <th colspan="3">Troops:</th>
            </tr></thead>
            <tbody>
            <?php         
        $unit = $database->getUnit($_GET['d']);
        $unarray = array(31=>"Sıçan","Örümcek","Yılan","Yarasa","Yaban Domuzu","Kutr","Ayı","Timsah","Kaplan","Fil");     
        $a = 0;
        for ($i = 31; $i <= 40; $i++) {
          if($unit['u'.$i]){
            echo '<tr>';
                      echo '<td class="ico"><img class="unit u'.$i.'" src="img/x.gif" alt="'.$unarray[$i].'" title="'.$unarray[$i].'" /></td>';
                      echo '<td class="val">'.$unit['u'.$i].'</td>';
                      echo '<td class="desc">'.$unarray[$i].'</td>';
                      echo '</tr>';                                             
                  }else{
            $a = $a+1;
          }                   
        }
        if($a == 10){
        echo '<tr><td>Vahada Asker Yok</td></tr>';
        }

     
      ?>
        </tbody>
        
        <table cellpadding="1" cellspacing="1" id="village_info" class="tableNone">
        <thead><tr>
            <th colspan="2"><div><?php echo $basearray['name']; ?></div>&nbsp;(<?php echo $basearray['x']; ?>|<?php echo $basearray['y']; ?>)</th>
        </tr></thead>
        <?php 
        
         $oinfo = $database->getOasisInfo($basearray['id']);
         $basearrayo = $database->getMInfo($oinfo[conqured]);
        
        if($oinfo['conqured'] == 0){
        $uinfo = $database->getUserArray($basearray['owner'],1); 
        $uinfoo = $database->getUserArray($basearray['owner'],1);
        
             }else{
             $uinfo = $database->getUserArray($basearray['owner'],1);
             $uinfoo = $database->getUserArray($basearrayo['owner'],1);
             
             }
        ?>
        <tbody><tr>
            <th>Irk</th>
            <td><?php switch($uinfo['tribe']) { case 1: echo "Romans"; break; case 2: echo "Teutons"; break; case 3: echo "Gauls"; break;case 4: echo "Nature"; break;case 5: echo "Natars"; break; } ?></td>
        </tr>
        <tr>
            <th>Sahip</th>
            <td><a href="spieler.php?uid=<?php echo $basearray['owner']; ?>"><?php echo $database->getUserField($basearray['owner'],'username',0); ?></a></td>
        </tr>
        <tr>
            <th>İşgal Eden</th>
            <td><?php if($oinfo['conqured'] == 0){ ?>Unoccupied<?php }else{ ?><a href="spieler.php?uid=<?php echo $basearrayo['owner']; ?>"><?php echo $database->getUserField($basearrayo['owner'],'username',0); ?></a><?php }?></td>
        </td>
        </tr>
        </tbody>
    </table>
    
        </table>
        <table cellpadding="1" cellspacing="1" id="troop_info" class="tableNone rep">
        <thead><tr>
            <th>Raporlar:</th>
        </tr></thead>
        <tbody>
                            <tr>
                    <td>Hiç Rapor Yok
<br>mevcut bilgiler.</td>
                </tr>
                    </tbody>
    </table>

<?php
}
else if (!$basearray['occupied']) {
?>
	<table cellpadding="1" cellspacing="1" id="distribution" class="tableNone">

		<thead><tr>
			<th colspan="3">Arazi Dağıtımı</th>
		</tr></thead>
		<tbody>
						<tr>
				<td class="ico"><img class="r1" src="img/x.gif" alt="Lumber" title="Lumber" /></td>
				<td class="val"><?php echo $landd['0']; ?></td>
				<td class="desc">Oduncu</td>

			</tr>
						<tr>
				<td class="ico"><img class="r2" src="img/x.gif" alt="Clay" title="Clay" /></td>
				<td class="val"><?php echo $landd['1']; ?></td>
				<td class="desc">Tuğla Oçağı</td>
			</tr>
						<tr>
				<td class="ico"><img class="r3" src="img/x.gif" alt="Iron" title="Iron" /></td>

				<td class="val"><?php echo $landd['2']; ?></td>
				<td class="desc">Demir Madeni</td>
			</tr>
						<tr>
				<td class="ico"><img class="r4" src="img/x.gif" alt="Crop" title="Crop" /></td>
				<td class="val"><?php echo $landd['3']; ?></td>
				<td class="desc">Tarla</td>

			</tr>
					</tbody>
	</table>
    <?php
    }
    else {
    ?>
    <table cellpadding="1" cellspacing="1" id="village_info" class="tableNone">
		<thead><tr>
			<th colspan="2"><div><?php echo $basearray['name']; ?></div>&nbsp;(<?php echo $basearray['x']; ?>|<?php echo $basearray['y']; ?>)</th>
		</tr></thead>
        <?php 
        $uinfo = $database->getUserArray($basearray['owner'],1); ?>
		<tbody><tr>
			<th>Tribe</th>
			<td><?php switch($uinfo['tribe']) { case 1: echo "Roma"; break; case 2: echo "Cermen"; break; case 3: echo "Galya"; break;case 4: echo "Doğa"; break;case 5: echo "Natar"; break; } ?></td>
		</tr>
		<tr>
			<th>Birlik</th>
			<?php if($uinfo['alliance'] == 0){
			echo '<td>-</td>';
			} else echo '
			<td><a href="allianz.php?aid='.$uinfo['alliance'].' ?>">'.$database->getUserAlliance($basearray['owner']).'</a></td>'; ?>
		</tr>
		<tr>
			<th>Sahip</th>
			<td><a href="spieler.php?uid=<?php echo $basearray['owner']; ?>"><?php echo $database->getUserField($basearray['owner'],'username',0); ?></a></td>
		</tr>
		<tr>
			<th>Nufus</th>
			<td><?php echo $basearray['pop']; ?></td>
		</tr></tbody>
	</table>
 
	<table cellpadding="1" cellspacing="1" id="troop_info" class="tableNone rep">
		<thead><tr>
			<th>Rapor:</th>
		</tr></thead>
		<tbody>
							<tr>
					<td>Rapor Yok
<br>.</td>
				</tr>
					</tbody>
	</table>
    <?php } ?>
</div>
<table cellpadding="1" cellspacing="1" id="options" class="tableNone">
	<thead><tr>
		<th>Ayarlar</th>
	</tr></thead>
	<tbody><tr>

		<td><a href="karte.php?z=<?php echo $_GET['d']; ?>">&raquo; Merkezi Harita.</a></td>
	</tr>
    <?php if(!$basearray['occupied']) {
    ?>
			<tr>
			<td class="none"><?php 
      $mode = CP; 
      $total = count($database->getProfileVillages($session->uid)); 
      
      $need_cps = ${'cp'.$mode}[$total+1];
      $cps = $database->getUserField($session->uid, 'cp',0);      
      
      if($cps >= $need_cps) {
        $enough_cp = true;
      } else {
        $enough_cp = false;
      }
      
			$otext = ($basearray['occupied'] == 1)? "occupied" : "unoccupied"; 
			if($village->unitarray['u'.$session->tribe.'0'] >= 3 AND $enough_cp) {
        $test = "<a href=\"a2b.php?id=".$_GET['d']."&amp;s=1\">&raquo;  Found new village.</a>";
      } elseif($village->unitarray['u'.$session->tribe.'0'] >= 3 AND !$enough_cp) {
        $test = "&raquo; Yeni Köy Kur. ($cps/$need_cps Kultür Puanın)";
      } else {
        $test = "&raquo; Yeni Köy Kur. (".$village->unitarray['u'.$session->tribe.'0']."/3 göçmen)";
      }
 	
		echo ($basearray['fieldtype']==0)? 
		($village->resarray['f39']==0)? 
		($basearray['owner'] == $session->uid)?
		
		
		"<a href=\"build.php?id=39\">&raquo; $otext Vahasına Dal. (Askeri Üs Kur)</a>" : 
		"&raquo; $otext Vahasına Dal. (Asker Üs kur)" : 
		
		"<a href=\"a2b.php?z=".$_GET['d']."&o\">&raquo; $otext Vahasına Dal.</a>" :                                                 
		"$test"
			?>
		</tr>
        <?php } 
        else if ($basearray['occupied'] && $basearray['wref'] != $_SESSION['wid']) {?>
        <tr>
					<td class="none">
          <?php 
          $query1 = mysql_query('SELECT * FROM `' . TB_PREFIX . 'vdata` WHERE `wref` = ' . mysql_escape_string($_GET['d']));
          $data1 = mysql_fetch_assoc($query1);
          $query2 = mysql_query('SELECT * FROM `' . TB_PREFIX . 'users` WHERE `id` = ' . $data1['owner']);
          $data2 = mysql_fetch_assoc($query2);
           if($data2['access']=='0') {
            echo "&raquo; Asker Gönder. (Oyuncu Banlanmıs)";
          } else if($data2['protect'] < time()) {
            echo $village->resarray['f39']? "<a href=\"a2b.php?z=".$_GET['d']."\">&raquo; Asker Gönder." : "&raquo; ASKER Gönder. (Askeri Üs Kur)"; 
          } else {
            echo "&raquo; Asker Gönder. (Koruma Süresi)";
          }
          ?>
          </td>
          
          
				</tr>
					    	<tr>
					<td class="none"><?php echo $building->getTypeLevel(17)? "<a href=\"build.php?z=".$_GET['d']."&id=" . $building->getTypeField(17) . "\">&raquo; Marketci(leri) gönder." : "&raquo; Marketci(leri) gönder. (Market Kur)"; ?></td>
				</tr>
                <?php } ?>
		</tbody>
</table>

</div>
