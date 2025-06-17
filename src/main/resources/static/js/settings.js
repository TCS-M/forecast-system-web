function confirmRoleChange(form, username) {
  const role = form.querySelector("select[name='role']").value;
  const message = `ユーザー「${username}」の権限を「${role}」に変更しますか？`;
  if (confirm(message)) {
    form.submit();
  }
}
