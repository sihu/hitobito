#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

app = window.App ||= {}

app.PersonPrimaryGroup = {
  setPrimaryGroup: (e) ->
    selected = $('#primary-group-select option:selected')
    url = selected.attr('data-url')
    $.ajax({ url: url, method: "PUT", dataType: "json"})
  toggleEditMode: (e) ->
    $('.edit-primary-group-form').toggle();
    $('#edit-primary-group').toggle();
  updateRolesAside: (rolesAside) ->
    console.log("I am in the right place")
    $('.section.roles').replaceWith(rolesAside)
}

$(document).on('change', '#primary-group-select', app.PersonPrimaryGroup.setPrimaryGroup)
$(document).on('click', '#edit-primary-group', app.PersonPrimaryGroup.toggleEditMode)
