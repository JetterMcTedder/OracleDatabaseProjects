BEGIN
  ORDS_ADMIN.ENABLE_OBJECT(
    p_schema => 'ADMIN',
    p_object=>'NOTES'
  );
  COMMIT;
END;
