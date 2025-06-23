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

// ✅ 取得 CSRF token 与 header 名
function getCsrfHeaders() {
  const token = document.querySelector('meta[name="_csrf"]').getAttribute('content');
  const headerName = document.querySelector('meta[name="_csrf_header"]').getAttribute('content');
  return { token, headerName };
}

function submitEdit(button) {
  const row = button.closest('tr');
  const saleId = row.id.replace('record-', '');
  const newDate = row.querySelector('.edit-saleDate').value;
  const newQty = row.querySelector('.edit-quantity').value;

  const { token, headerName } = getCsrfHeaders();

  fetch('/admin/sales/update', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      [headerName]: token  // ✅ 加上 CSRF 头部
    },
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

  const { token, headerName } = getCsrfHeaders();

  fetch('/admin/sales/delete', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      [headerName]: token  // ✅  CSRF head 追加
    },
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
