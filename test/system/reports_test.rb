# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:report_one)
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: '初めての日報です。'
    fill_in '内容', with: 'これからがんばります'
    click_on '登録する'

    assert_text '日報が作成されました'
    assert_text '初めての日報です。'
    assert_text 'これからがんばります'
  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集'

    fill_in 'タイトル', with: '2日目の日報です'
    fill_in '内容', with: '更新してみました'
    click_on '更新する'

    assert_text '日報が更新されました'
    assert_text '2日目の日報です'
    assert_text '更新してみました'
  end

  test 'destroying a Report' do
    visit reports_url
    assert_text '今日の日報です'
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '日報が削除されました。'
    assert_no_text '今日の日報です'
  end
end
