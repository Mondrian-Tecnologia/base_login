function exibirLog(log_id, tipo){
  let classe = `.log_${log_id}`;
  $(classe).find('div').fadeIn('slow');
  $(classe).find('a').fadeOut('slow');
}
