export default () => {
  const userCurrentPassword = document.querySelector('#user_current_password');
  const updateUserSubmit = document.querySelector('#update-user-submit');

  if (userCurrentPassword && updateUserSubmit) {
    userCurrentPassword.addEventListener('input', (event) => {
      if (event.target.value) {
        updateUserSubmit.disabled = false;

        return;
      }

      updateUserSubmit.disabled = true;
    });
  }
}
