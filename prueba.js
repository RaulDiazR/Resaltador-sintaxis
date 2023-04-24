/* ###################################################
      Botón para cambiar visibilidad de Contraseña
   ################################################### */

   let alternarContra = document.querySelector('#togglePassword');
   let contra = document.querySelector('#password');
   let tipo;
   
   alternarContra.addEventListener('click', function () {
       /* Cambiar la vi*****sibilidad de la contraseña*/ 
       tipo = contra.getAttribute('type') === 'password' ? 'text' : 'password';
       contra.setAttribute('type', tipo);
       
       // Cambiar el formato de la imagen
       this.classList.toggle('bi-eye');
   });