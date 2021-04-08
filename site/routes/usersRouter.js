var express = require('express');
var router = express.Router();
const path = require('path');
const {register, login, processRegister, perfil, processLogin, cerrarSession, eliminarCuenta,vistaDeEdicion, edicionDePerfil,vistaRecuperacionContraseña, recuperacionContraseña, vistaCambioContraseña, cambioContraseña,vistaCambioImagen, cambioImagen} = require(path.join('..','controllers','usersControllers'));

/* middlewares */
const registerValidation=require(path.join('..','validations','registerValidation'));
const loginValidation=require(path.join('..','validations','loginValidation'));

const upload = require(path.join('..','middlewares','multerUser'));
const rutasCheck=require(path.join('..','middlewares','rutasCheck'));

/* register */
router.post('/register',upload.any(),registerValidation,processRegister);

/* login */
router.get('/login',login);
router.post('/login',loginValidation,processLogin);

/* Perfil */
router.get('/perfil/:id',rutasCheck,perfil);

/* editar perfil normal*/
router.get('/edit/:id',rutasCheck,vistaDeEdicion);
router.put('/edit/:id',edicionDePerfil);

/* eliminar cuenta */
router.delete('/delete/:id',eliminarCuenta);

/* cerrar session */
router.get('/logout',cerrarSession);

/* prueba de email */
router.get('/contraNueva',vistaRecuperacionContraseña);
router.post('/contraNueva',recuperacionContraseña);
router.get('/nuevaContrasenia/:id',vistaCambioContraseña);
router.put('/nuevaContrasenia/:id',cambioContraseña);

/* cambio de imagen */
router.get('/elcambioDeImagen/:id',vistaCambioImagen);
router.put('/elcambioDeImagen/:id',upload.any(),cambioImagen);

module.exports = router;
