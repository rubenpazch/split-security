# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Menu.create(title: 'dashboard', link_to: '/dashboard', has_sub_menu: false, is_root: true, index_order: 0)
m1 = Menu.create(title: 'accounts', link_to: '/accounts', has_sub_menu: true, is_root: true, index_order: 1)
SubMenu.create(title: 'overview', link_to: '/accounts/overview', has_sub_menu: false, menus_id: m1.id, index_order: 0)
SubMenu.create(title: 'settings', link_to: '/accounts/settings', has_sub_menu: false, menus_id: m1.id, index_order: 1)
