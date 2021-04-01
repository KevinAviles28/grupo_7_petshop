window.addEventListener('load',()=>{
    
    let $prov = qs('#prov'),
    $localidad = qs('#localidad')
    
    let urlBase = 'https://apis.datos.gob.ar/georef/api/';
    
    
    fetch(`${urlBase}provincias`)
    .then(response=> response.json())
    .then(result=>{
        result.provincias.forEach(provincia=>{
            $prov.innerHTML += `<option value="${provincia.id}">${provincia.nombre}</option>`
        })
    })
    
    $prov.addEventListener('change',()=>{
        fetch(`${urlBase}localidades?max=1000&provincia=${$prov.value}`)/* con value tomo el valor de la etiqueta $prov */
        .then(response=> response.json())
        .then(result=>{
            $localidad.innerHTML = ''
            result.localidades.forEach(localidad=>{
                $localidad.innerHTML += `<option value="${localidad.nombre}">${localidad.nombre}</option>`
            })
        })
    })
       
})


