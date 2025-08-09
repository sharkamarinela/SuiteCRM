<?php
/* Smarty version 4.5.3, created on 2025-08-09 12:32:58
  from '/var/www/html/SuiteCRM/include/utils/recaptcha_disabled.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.3',
  'unifunc' => 'content_68973ffa7aeee6_08079290',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'a97b5e1073fe9511d183ce33d60d137166af8c64' => 
    array (
      0 => '/var/www/html/SuiteCRM/include/utils/recaptcha_disabled.tpl',
      1 => 1747241417,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_68973ffa7aeee6_08079290 (Smarty_Internal_Template $_smarty_tpl) {
echo '<script'; ?>
>

  /**
   * Login Screen Validation
   */
  function validateAndSubmit() {
      generatepwd();
    }

  /**
   * Password reset screen validation
   */
  function validateCaptchaAndSubmit() {
      document.getElementById('username_password').value = document.getElementById('new_password').value;
      document.getElementById('ChangePasswordForm').submit();
    }
<?php echo '</script'; ?>
>
<?php }
}
