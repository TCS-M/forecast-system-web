document.addEventListener('DOMContentLoaded', function () {
  const form = document.querySelector('form');
  const passwordInput = form.querySelector('input[name="password"]');

  form.addEventListener('submit', function (event) {
    const password = passwordInput.value.trim();

    if (password !== '') {
      const confirmed = confirm('パスワードを変更しますか？');
      if (!confirmed) {
        event.preventDefault(); // 送信キャンセル
      }
    }
  });
});
