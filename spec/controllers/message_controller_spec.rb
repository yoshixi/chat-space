require 'rails_helper'
require 'devise'

describe MessagesController do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:message) { create(:message, user_id: user.id, group_id: group.id) }
  let(:messages) { create_list(:message, 4,user: user, group: group)}
  before do
    sign_in user
  end
  describe 'GET #index' do
    before do
      login_user user
      get :index, group_id: group
    end
    it "populates an array of messages ordered by created_at ASC" do
      expect(assigns(:messages)).to match(messages)
    end
    it "assigns the requested contact to @group" do
      expect(assigns(:group)).to eq group
    end
    it "assigns the requested contact to @messages" do
      expect(assigns(:messages)).to eq messages
    end
    it "renders the :index template" do
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    it "saves message in the database" do
      expect(message).to be_valid
    end
    it "saves message in the database and redirect_to index" do
      post :create, group_id: group, message: attributes_for(:message, group_id: group.id, user_id: user.id)
      expect(response).to redirect_to group_messages_path
    end
    it "not save messaege in the database" do
      message = build(:message, text: nil)
      message.valid?
      expect(message.errors[:text]).to include("を入力してください。")
    end
    it "not save messaege in the database and redirect_to index_" do
      post :create, group_id: group, message: attributes_for(:message,text: "", group_id: group.id, user_id: user.id)
      expect(response).to redirect_to group_messages_path
    end
  end

end
