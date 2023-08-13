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

@user_director_one = User.create!(email: 'director1@email.com', password: '12345678')
@user_subdirector_one = User.create!(email: 'subdirector1@email.com', password: '12345678')
@user_support = User.create!(email: 'support@email.com', password: '12345678')
@user_teacher = User.create!(email: 'teacher@email.com', password: '12345678')
@user_student = User.create!(email: 'student@email.com', password: '12345678')
@user_visitor = User.create!(email: 'visitor@email.com', password: '12345678')

@user_director_two = User.create!(email: 'director2@email.com', password: '12345678')
@user_subdirector_two = User.create!(email: 'subdirector2@email.com', password: '12345678')
@user_areamanager = User.create!(email: 'areamanager@email.com', password: '12345678')
@user_operador = User.create!(email: 'operador@email.com', password: '12345678')

# -----------------------
# workgroup if a school
# -----------------------

# workgroups
@workgroup_director_one = WorkGroup.create!(title: 'Director 1')
@workgroup_sub_director_one = WorkGroup.create!(title: 'Sub Director 1')
@workgroup_support_one = WorkGroup.create!(title: 'Support 1')
@workgroup_teacher = WorkGroup.create!(title: 'Teacher 1')
@workgroup_student = WorkGroup.create!(title: 'Student 1')
@workgroup_visitor = WorkGroup.create!(title: 'Visitor 1')

# profile
@profile_user_director_one = Profile.new(is_active: false)
@profile_user_director_one.user = @user_director_one
@profile_user_director_one.work_group = @workgroup_director_one
@profile_user_director_one.save!

@profile_user_director_one = Profile.new(is_active: true)
@profile_user_director_one.user = @user_director_one
@profile_user_director_one.work_group = @workgroup_sub_director_one
@profile_user_director_one.save!

# profile
@profile_user_subdirector_one = Profile.new(is_active: true)
@profile_user_subdirector_one.user = @user_subdirector_one
@profile_user_subdirector_one.work_group = @workgroup_sub_director_one
@profile_user_subdirector_one.save!

# profile
@profile_user_support = Profile.new(is_active: true)
@profile_user_support.user = @user_support
@profile_user_support.work_group = @workgroup_support_one
@profile_user_support.save!

# -----------------------
# workgroup if a hospital
# -----------------------

@workgroup_director_two = WorkGroup.create!(title: 'Director 2')
@workgroup_sub_director_two = WorkGroup.create!(title: 'Sub Director 2')
@workgroup_manager_area = WorkGroup.create!(title: 'Area Manager')
@workgroup_operator = WorkGroup.create!(title: 'Operator')

# CreateRoles
# @role_super_admin = Role.create!(title: 'SuperAdministrator', is_root: true, parent_id: 0)
# @role_admin = Role.create!(title: 'Admin',  is_root: false, parent_id: 0)
# @role_owner = Role.create!(title: 'Owner',  is_root: false, parent_id: 0)
# @role_it_support = Role.create!(title: 'IT support', is_root: false, parent_id: 0)
# @role_sales_manager = Role.create!(title: 'Sales Manager', is_root: false, parent_id: 0)
# @role_client = Role.create!(title: 'Client', is_root: false, parent_id: 0)

# RoleProfiles
# RoleProfile.create!(role_id: @role_super_admin.id, profile_id: @profile_director_one.id)
# RoleProfile.create!(role_id: @role_admin.id, profile_id: @profile_director_one.id)

# UserProfile
# UserProfile.create!(user_id: @user_one.id, profile_id: @profile_director_one.id)
