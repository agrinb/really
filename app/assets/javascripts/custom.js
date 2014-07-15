$(document).ready( function() {
  $('#user_role_agent').click(function() {
    $('.agent-profile-fields').removeClass('hidden');
  });
   $('#user_role_seller').click(function() {
    $('.agent-profile-fields').addClass('hidden');
  });
});
