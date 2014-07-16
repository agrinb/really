$(document).ready( function() {
  $(document).on('click', '#user_role_agent', function() {
    $('.agent-profile-fields').removeClass('hidden');
  });
   $(document).on('click', '#user_role_seller', function() {
    $('.agent-profile-fields').addClass('hidden');
  });
});
