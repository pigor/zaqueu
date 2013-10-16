require 'test_helper'

class CollectionTest < ActiveSupport::TestCase

  setup do
    @user ||= User.create(username: 'foo', name: 'Foo', email: 'bar@foo', password: '123')
    @collection ||= Collection.create(description: 'Yay',
                                  deadline: 5.days.from_now,
                                  email: 'foo@bar.com', user: @user)

    @collection_every_day ||= Collection.create(description: 'Yay',
                                  deadline: 5.days.from_now,
                                  email: 'foo@bar.com', user: @user,
                                  repetition: "every_day")
  end

  test '.by_deadline retorna itens vencendo até 10 minutos depois do deadline' do
    assert_empty Collection.by_deadline(1.day.from_now)
    assert_includes Collection.by_deadline(5.days.from_now), @collection
    assert_includes Collection.by_deadline(5.days.from_now + 9.minutes), @collection
  end

  test '.next_deadline retorna o próximo deadline baseado na repetição definida' do
    assert_equal @collection_every_day.next_deadline, @collection_every_day.deadline + 1.day
  end
end
