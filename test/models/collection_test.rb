require 'test_helper'

class CollectionTest < ActiveSupport::TestCase

  setup do
    @user ||= User.create(username: 'foo', name: 'Foo', email: 'bar@foo', password: '123')
    @collection ||= Collection.create(description: 'Yay',
                                  deadline: 5.days.from_now,
                                  email: 'foo@bar.com', user: @user)
  end

  test '.by_deadline retorna itens vencendo até 10 minutos antes da deadline' do
    assert_empty Collection.by_deadline(1.day.from_now)
    assert_includes Collection.by_deadline(5.days.from_now), @collection
  end
end
