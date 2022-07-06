
package com.portfolio.portfolioback.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@Entity 

public class Persona {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

  
    @NotNull
    @Size(min = 1, max= 50, message = "El nombre no cumple con la longitud")
    private String nombre;


    @NotNull
    @Size(min = 1, max= 50, message = "El apellido no cumple con la longitud")
    private String apellido;    


    @NotNull
    @Size(min = 1, max= 50, message = "El campo debe contener entre 1 a 50 cáracteres")
    private String titulo;


    @NotNull
    @Size(min = 1, max= 50, message = "El campo debe contener entre 1 a 50 cáracteres")
    private String provincia;


    @NotNull
    @Size(min = 1, max= 50, message = "El campo debe contener entre 1 a 50 cáracteres")
    private String correoElectronico;


    @NotNull
    @Size(min = 1, max= 50, message = "El campo debe contener entre 1 a 50 cáracteres")
    private String fechaNacimiento;


    @NotNull
    @Size(min = 1, max= 300, message = "El campo debe contener entre 1 a 300 cáracteres")
    private String acercaDeMi;    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getAcercaDeMi() {
        return acercaDeMi;
    }

    public void setAcercaDeMi(String acercaDeMi) {
        this.acercaDeMi = acercaDeMi;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }
    

   
   
    
}
