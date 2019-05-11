create or replace procedure ActualizaLector(
  vLector_id in char,
  vCampo in varchar2,
  vValor in varchar2
)
is
  vFecha date;
begin
  case
    when upper(vCampo) = 'FECHAALTALECTOR' then

      if to_date(vValor,'dd/mm/yy') = SYSDATE then
        vFecha := sysdate;
      else
        vFecha := to_date(vValor,'dd/mm/yy');
      end if;

      update lector set fechaAltaLector = vFecha,
        fechaVigenciaLector = vFecha+365
      where lector_id=vLector_id;

    when upper(vCampo) = 'TELEFONOLECTOR' then

      update lector set telefonoLector=vValor
      where lector_id=vLector_id;

    when upper(vCampo) = 'NOMBRELECTOR' then

      update lector set nombreLector=vValor
      where lector_id=vLector_id;

    when upper(vCampo) = 'APPATERNOLECTOR' then

      update lector set apPaternoLector=vValor
      where lector_id=vLector_id;

    when upper(vCampo) = 'APMATERNOLECTOR' then

      update lector set apMaternoLector=vValor
      where lector_id=vLector_id;

    when upper(vCampo) = 'ADEUDOLECTOR' then

      update lector set adeudoLector=vValor
      where lector_id=vLector_id;

    when upper(vCampo) = 'ESTADO' then

      update lector set estado=vValor
      where lector_id=vLector_id;

    when upper(vCampo) = 'NUMERO' then

      update lector set numero=vValor
      where lector_id=vLector_id;

    when upper(vCampo) = 'CALLE' then

      update lector set calle=vValor
      where lector_id=vLector_id;

    when upper(vCampo) = 'COLONIA' then

      update lector set colonia=vValor
      where lector_id=vLector_id;

    when upper(vCampo) = 'DELEGACION' then

      update lector set delegacion=vValor
      where lector_id=vLector_id;

    when upper(vCampo) = 'TIPOLECTOR_ID' then

      update lector set tipoLector_id=vValor
      where lector_id=vLector_id;

    else
      raise_application_error(-20054,'ERROR No existe ese campo');

  end case; 
end;
/
show errors