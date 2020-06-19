<?php
$cfg['blowfish_secret'] = 'anMrcb0foIvC2ZFSHpw3psDnCn7RU9QL'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */

$i = 0;
$i++;

/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'cookie';

/* Server parameters */
$cfg['Servers'][$i]['host'] = 'MINIKUBEIP';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = false;

/**
 * phpMyAdmin configuration storage settings.
*/

/* User used to manipulate with storage */
$cfg['Servers'][$i]['controlhost'] = 'MINIKUBEIP';
$cfg['Servers'][$i]['controlport'] = '3306';
$cfg['Servers'][$i]['controluser'] = 'pma';
$cfg['Servers'][$i]['controlpass'] = 'password';

/**
 * Directories for saving/loading files from server
 */
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
