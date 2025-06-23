function enableEdit(button) {
  const row = button.closest('tr');
  row.querySelector('.display-saleDate').style.display = 'none';
  row.querySelector('.display-quantity').style.display = 'none';
  row.querySelector('.edit-saleDate').style.display = '';
  row.querySelector('.edit-quantity').style.display = '';
  button.style.display = 'none';
  row.querySelector('.submit-btn').style.display = '';
  row.querySelector('.delete-btn').style.display = '';
}

function submitEdit(button) {
  const row = button.closest('tr');
  const saleId = row.id.replace('record-', '');
  const newDate = row.querySelector('.edit-saleDate').value;
  const newQty = row.querySelector('.edit-quantity').value;

  fetch('/admin/sales/update', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: `saleId=${saleId}&newDate=${newDate}&newQuantity=${newQty}`
  })
  .then(response => {
    if (!response.ok) throw new Error("在庫不足のため更新できません");
    return response.text();
  })
  .then(() => {
    alert("販売実績が更新されました！");
    location.reload();
  })
  .catch(err => alert("更新できません: " + err.message));
}

function deleteRecord(button) {
  const row = button.closest('tr');
  const saleId = row.id.replace('record-', '');

  if (!confirm("この販売実績を削除してもよろしいですか？")) return;

  fetch('/admin/sales/delete', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: `saleId=${saleId}`
  })
  .then(response => {
    if (!response.ok) throw new Error("削除に失敗しました");
    return response.text();
  })
  .then(() => {
    alert("削除が完了しました！");
    location.reload();
  })
  .catch(err => alert("削除できません: " + err.message));
}
