<?php
$semuadata = array();
$tgl_mulai="-";
$tgl_selesai="-";
$status ="";
if (isset($_POST["kirim"]))
{
	$tgl_mulai = $_POST["tglm"];
	$tgl_selesai = $_POST["tgls"];
	$status = $_POST['status'];
	$ambil = $koneksi->query("SELECT * FROM pembelian pm LEFT JOIN pelanggan pl ON
		pm.id_pelanggan=pl.id_pelanggan WHERE status_pembelian='$status' AND tanggal_pembelian BETWEEN '$tgl_mulai' AND '$tgl_selesai'");
	while($pecah = $ambil->fetch_assoc())
	{
		$semuadata[]=$pecah;
	}
	
	//echo "<pre>";
	//print_r($semuadata);
	//echo "</pre>";
}
?>

<h2>Laporan Pembelian dari <?php echo $tgl_mulai ?> hingga <?php echo $tgl_selesai ?></h2>
<hr>

<form method="post">
	<div class="row">
		<div class="col-md-3">
			<div class="form-group">
				<label>Dari Tanggal</label>
				<input type="date" class="form-control" name="tglm" value="<?php echo $tgl_mulai ?>">
			</div>
		</div>
		<div class="col-md-3">
			<div class="form-group">
				<label>Sampai Tanggal</label>
				<input type="date" class="form-control" name="tgls" value="<?php echo $tgl_selesai ?>">
			</div>
		</div>
		<div class="col-md-3">
			<label>Status</label>
			<select name="status" class="form-control">
				<option value="">-- Pilih Status --</option>
				<option value="pending" <?php echo $status=="pending"?"selected":""; ?>>pending</option>
				<option value="batal" <?php echo $status=="batal"?"selected":""; ?>>batal</option>
				<option value="sudah mengirim pembayaran" <?php echo $status=="sudah mengirim pembayaran"?"selected":"";?>>sudah mengirim pembayaran</option>
				<option value="barang sudah sampai" <?php echo $status=="barang sudah sampai"?"selected":"";?>>barang sudah sampai</option>
				<option value="barang dikirim" <?php echo $status=="barang dikirim"?"selected":"";?>>barang dikirim</option>
			</select>
		</div>
		<div class="col-md-2">
			<label>&nbsp;</label><br>
			<button class="btn btn-primary" name="kirim">Lihat</button>
		</div>
	</div>
</form>

<table class="table table-bordered">
	<thead>
		<tr>
			<th>No</th>
			<th>Pelanggan</th>
			<th>Tanggal</th>
			<th>Jumlah</th>
			<th>Status</th>
		</tr>
	</thead>
	<tbody>
		<?php $total=0; ?>
		<?php foreach ($semuadata as $key => $value): ?>
		<?php $total+=$value["total_pembelian"] ?>
		
		<tr>
			<td><?php echo $key+1; ?></td>
			<td><?php echo $value["nama_pelanggan"] ?></td>
			<td><?php echo $value["tanggal_pembelian"] ?></td>
			<td>Rp. <?php echo number_format($value["total_pembelian"]) ?></td>
			<td><?php echo $value["status_pembelian"] ?></td>
		</tr>
		<?php endforeach ?>
	</tbody>
	<tfoot>
		<tr>
			<th colspan="3">Total</th>
			<th>Rp. <?php echo number_format($total) ?></th>
			<th></th>
		</tr>
	</tfoot>
</table>