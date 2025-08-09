<?php
/* Smarty version 4.5.3, created on 2025-08-09 12:34:29
  from '/var/www/html/SuiteCRM/include/SugarFields/Fields/Base/ListView.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.3',
  'unifunc' => 'content_68974055266181_94758771',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '8614b784a0205b807544175e7cdd787134b5fad2' => 
    array (
      0 => '/var/www/html/SuiteCRM/include/SugarFields/Fields/Base/ListView.tpl',
      1 => 1747241417,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_68974055266181_94758771 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/var/www/html/SuiteCRM/include/Smarty/plugins/function.sugar_fetch.php','function'=>'smarty_function_sugar_fetch',),));
?>

<?php echo smarty_function_sugar_fetch(array('object'=>$_smarty_tpl->tpl_vars['parentFieldArray']->value,'key'=>$_smarty_tpl->tpl_vars['col']->value),$_smarty_tpl);?>

<?php }
}
