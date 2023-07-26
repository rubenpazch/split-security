# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ title: "Star Wars" }, { title: "Lord of the Rings" }])
#   Character.create(title: "Luke", movie: movies.first)
# Menu.create(title: 'dashboard', link_to: '/dashboard', has_sub_menu: false, is_root: true, index_order: 0)
# m1 = Menu.create(title: 'accounts', link_to: '/accounts', has_sub_menu: true, is_root: true, index_order: 1)
# SubMenu.create(title: 'overview', link_to: '/accounts/overview', has_sub_menu: false, menus_id: m1.id, index_order: 0)
# SubMenu.create(title: 'settings', link_to: '/accounts/settings', has_sub_menu: false, menus_id: m1.id, index_order: 1)

@user_one = User.create!(email: 'test@email.com', password: '12345678')
@user_two = User.create!(email: 'test2@email.com', password: '12345678')

# profiles if a school
@profile_director_one = Profile.create!(title: 'Director 1')
@profile_sub_director_one = Profile.create!(title: 'Sub Director 1')
@profile_teacher = Profile.create!(title: 'Teacher')
@profile_student = Profile.create!(title: 'Student')
# profiles if a hospital
@profile_director_two = Profile.create!(title: 'Director 2')
@profile_sub_director_two = Profile.create!(title: 'Sub Director 2')
@profile_manager_area = Profile.create!(title: 'Area Manager')
@profile_operator = Profile.create!(title: 'Operator')

# CreateRoles
@role_super_admin = Role.create!(title: 'SuperAdministrator', is_root: true, parent_id: 0)
@role_admin = Role.create!(title: 'Admin',  is_root: false, parent_id: 0)
@role_owner = Role.create!(title: 'Owner',  is_root: false, parent_id: 0)
@role_it_support = Role.create!(title: 'IT support', is_root: false, parent_id: 0)
@role_sales_manager = Role.create!(title: 'Sales Manager', is_root: false, parent_id: 0)
@role_client = Role.create!(title: 'Client', is_root: false, parent_id: 0)

# RoleProfiles
RoleProfile.create!(role_id: @role_super_admin.id, profile_id: @profile_director_one.id)
RoleProfile.create!(role_id: @role_admin.id, profile_id: @profile_director_one.id)

# UserProfile
UserProfile.create!(user_id: @user_one.id, profile_id: @profile_director_one.id)
