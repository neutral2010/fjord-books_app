# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:cherry_book)
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: 'Books'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'Ruby超入門'
    fill_in 'メモ', with: 'とても分かりやすい'
    fill_in '著者', with: 'igaiga'
    click_button '登録する'

    assert_text '本が作成されました'
    assert_text 'Ruby超入門'
    assert_text 'とても分かりやすい'
    assert_text 'igaiga'

    # click_on '戻る'
  end

  test 'updating a Book' do
    visit books_url
    click_on 'Edit', match: :first

    fill_in 'Memo', with: @book.memo
    fill_in 'Title', with: @book.title
    click_on 'Update Book'

    assert_text 'Book was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_on '削除' #, match: :first
    end

    assert_text '本が削除されました。'
  end
end
