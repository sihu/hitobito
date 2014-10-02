# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

class Event::RoleAbility < AbilityDsl::Base

  include AbilityDsl::Constraints::Event

  on(::Event::Role) do
    permission(:any).may(:show, :create, :update).for_leaded_events
    permission(:any).may(:destroy).for_leaded_events_except_self
    permission(:group_full).may(:manage).in_same_group
    permission(:layer_and_below_full).may(:manage).in_same_layer_or_below
  end

  def for_leaded_events_except_self
    for_leaded_events &&
    !(subject.participation.person_id == user.id && subject.permissions.include?(:full))
  end

  private

  def event
    subject.participation.event
  end
end
